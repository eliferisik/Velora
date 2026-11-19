using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Velora.Core.Data;
using Velora.Core.Models;
using Velora.Core.Services;

namespace Velora.Core.Pages.Products;
public sealed class DetailsModel(VeloraDbContext db, CartService cart, IWebHostEnvironment environment) : PageModel
{
    public Product? Product { get; private set; }
    public List<string> Images { get; private set; } = new();
    public async Task<IActionResult> OnGetAsync(int id)
    {
        Product=await db.Products.Include(x=>x.Category).FirstOrDefaultAsync(x=>x.Id==id&&x.IsActive);
        if(Product is null)return NotFound();
        var imageDirectory = Path.Combine(environment.WebRootPath ?? "wwwroot", "images");
        var imageBaseName = Path.GetFileNameWithoutExtension(Product.Image);
        var variants = Directory.Exists(imageDirectory)
            ? Directory.GetFiles(imageDirectory, imageBaseName + ".*").Where(path => new[] { ".jpg", ".jpeg", ".png", ".webp" }.Contains(Path.GetExtension(path), StringComparer.OrdinalIgnoreCase)).Select(path => "images/" + Path.GetFileName(path)).OrderBy(path => path, StringComparer.OrdinalIgnoreCase)
            : Enumerable.Empty<string>();
        Images = new[] { Product.Image, Product.HoverImage }.Where(x => !string.IsNullOrWhiteSpace(x)).Cast<string>().Concat(variants).Distinct(StringComparer.OrdinalIgnoreCase).ToList();
        return Page();
    }
    public async Task<IActionResult> OnPostAddAsync(int id, string size)
    {
        var product = await db.Products.FirstOrDefaultAsync(x => x.Id == id && x.IsActive);
        if (product is null) return NotFound();
        if (!new[] { "XS", "S", "M", "L", "XL" }.Contains(size)) return RedirectToPage(new { id });

        var items = cart.Get();
        var totalInCart = items.Where(x => x.ProductId == id).Sum(x => x.Quantity);
        if (totalInCart >= product.Stock) return RedirectToPage(new { id });
        var line = items.FirstOrDefault(x => x.ProductId == id && x.Size == size);
        if (line is null)
            items.Add(new CartItem { ProductId = id, Name = product.Name, Image = product.Image, UnitPrice = product.Price, Quantity = 1, Size = size });
        else
            line.Quantity++;

        cart.Save(items);
        return RedirectToPage("/Cart/Index");
    }
}
