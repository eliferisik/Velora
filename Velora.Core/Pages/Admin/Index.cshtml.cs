using System.ComponentModel.DataAnnotations;
using System.Globalization;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Velora.Core.Data;
using Velora.Core.Models;

namespace Velora.Core.Pages.Admin;

[Authorize(Roles = "Admin")]
public sealed class IndexModel(VeloraDbContext db) : PageModel
{
    public List<Category> Categories { get; private set; } = new();
    public List<Product> Products { get; private set; } = new();
    public List<Order> Orders { get; private set; } = new();
    public CultureInfo Culture => CultureInfo.GetCultureInfo("tr-TR");

    public async Task OnGetAsync() => await LoadAsync();

    private async Task LoadAsync()
    {
        Categories = await db.Categories.OrderBy(x => x.Name).ToListAsync();
        Products = await db.Products.Include(x => x.Category).OrderBy(x => x.Name).ToListAsync();
        Orders = await db.Orders.Include(x => x.Details).ThenInclude(x => x.Product).OrderByDescending(x => x.CreatedAt).Take(50).ToListAsync();
    }

    public async Task<IActionResult> OnPostAddCategoryAsync(string categoryName)
    {
        var name = categoryName?.Trim();
        if (!string.IsNullOrWhiteSpace(name) && name.Length <= 80 && !await db.Categories.AnyAsync(x => x.Name == name))
        {
            db.Categories.Add(new Category { Name = name });
            await db.SaveChangesAsync();
        }
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostUpdateCategoryAsync(int id, string name)
    {
        var category = await db.Categories.FindAsync(id);
        if (category is null) return NotFound();
        name = name?.Trim() ?? "";
        if (name.Length == 0 || name.Length > 80 || await db.Categories.AnyAsync(x => x.Id != id && x.Name == name))
        {
            TempData["Error"] = "Kategori adını kontrol edin; adlar benzersiz olmalıdır.";
            return RedirectToPage();
        }
        category.Name = name;
        await db.SaveChangesAsync();
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostDeleteCategoryAsync(int id)
    {
        var category = await db.Categories.Include(x => x.Products).FirstOrDefaultAsync(x => x.Id == id);
        if (category is null) return NotFound();
        if (category.Products.Count > 0) TempData["Error"] = "Ürün bağlı kategoriyi silemezsiniz.";
        else { db.Categories.Remove(category); await db.SaveChangesAsync(); }
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostAddProductAsync([Required, StringLength(140)] string name, [Range(typeof(decimal), "0.01", "1000000")] decimal price, [Range(0, 100000)] int stock, int categoryId, [Required, StringLength(260)] string image, [StringLength(260)] string? hoverImage, [Required, StringLength(2000)] string description)
    {
        if (!ModelState.IsValid || !await db.Categories.AnyAsync(x => x.Id == categoryId) || !ValidImage(image) || (!string.IsNullOrWhiteSpace(hoverImage) && !ValidImage(hoverImage)))
        {
            ModelState.AddModelError(string.Empty, "Ürün alanlarını ve images/ ile başlayan görsel yollarını kontrol edin.");
            await LoadAsync();
            return Page();
        }
        db.Products.Add(new Product { Name = name.Trim(), Price = price, Stock = stock, CategoryId = categoryId, Image = image, HoverImage = hoverImage, Description = description.Trim() });
        await db.SaveChangesAsync();
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostUpdateProductAsync(int id, string name, decimal price, int stock, int categoryId, string image, string? hoverImage, string description, bool isActive)
    {
        var product = await db.Products.FindAsync(id);
        if (product is null) return NotFound();
        if (string.IsNullOrWhiteSpace(name) || name.Length > 140 || price <= 0 || stock < 0 || description is null || description.Length > 2000 || !ValidImage(image) || (!string.IsNullOrWhiteSpace(hoverImage) && !ValidImage(hoverImage)) || !await db.Categories.AnyAsync(x => x.Id == categoryId))
        {
            TempData["Error"] = "Ürün bilgilerini, görsel yollarını ve kategoriyi kontrol edin.";
            return RedirectToPage();
        }
        product.Name = name.Trim(); product.Price = price; product.Stock = stock; product.CategoryId = categoryId;
        product.Image = image; product.HoverImage = hoverImage; product.Description = description.Trim(); product.IsActive = isActive;
        await db.SaveChangesAsync();
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostDeleteProductAsync(int id)
    {
        var product = await db.Products.FindAsync(id);
        if (product is null) return NotFound();
        if (await db.OrderDetails.AnyAsync(x => x.ProductId == id))
        {
            product.IsActive = false;
            TempData["Error"] = "Siparişi bulunan ürün satıştan kaldırıldı.";
        }
        else db.Products.Remove(product);
        await db.SaveChangesAsync();
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostUpdateOrderAsync(int id, string status)
    {
        if (!new[] { "Alındı", "Hazırlanıyor", "Kargoya Verildi", "Tamamlandı", "İptal" }.Contains(status)) return BadRequest();
        var order = await db.Orders.FindAsync(id);
        if (order is null) return NotFound();
        order.Status = status;
        await db.SaveChangesAsync();
        return RedirectToPage();
    }

    private static bool ValidImage(string path) => !string.IsNullOrWhiteSpace(path) && path.StartsWith("images/", StringComparison.Ordinal) && !path.Contains("..", StringComparison.Ordinal);
}
