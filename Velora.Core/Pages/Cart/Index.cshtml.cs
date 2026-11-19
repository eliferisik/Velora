using System.Globalization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Velora.Core.Data;
using Velora.Core.Models;
using Velora.Core.Services;

namespace Velora.Core.Pages.Cart;

public sealed class IndexModel(CartService cart, VeloraDbContext db) : PageModel
{
    public List<CartItem> Items { get; private set; } = new();
    public decimal Total => Items.Sum(x => x.UnitPrice * x.Quantity);
    public CultureInfo Culture => CultureInfo.GetCultureInfo("tr-TR");

    public void OnGet() => Items = cart.Get();

    public async Task<IActionResult> OnPostQuantityAsync(int productId, string size, int quantity)
    {
        var items = cart.Get();
        var item = items.FirstOrDefault(x => x.ProductId == productId && x.Size == size);
        if (item is null) return RedirectToPage();

        if (quantity <= 0)
        {
            items.Remove(item);
            cart.Save(items);
            return RedirectToPage();
        }

        var product = await db.Products.FirstOrDefaultAsync(x => x.Id == productId && x.IsActive);
        var quantityInOtherSizes = items.Where(x => x.ProductId == productId && x.Size != size).Sum(x => x.Quantity);
        if (product is null || quantity + quantityInOtherSizes > product.Stock)
        {
            ModelState.AddModelError(string.Empty, product is null
                ? "Bu ürün artık satışta değil. Ürünü sepetten kaldırın."
                : $"Stokta bu ürün için en fazla {Math.Max(0, product.Stock - quantityInOtherSizes)} adet var.");
            Items = items;
            return Page();
        }

        item.Quantity = quantity;
        cart.Save(items);
        return RedirectToPage();
    }

    public IActionResult OnPostRemove(int productId, string size)
    {
        var items = cart.Get();
        items.RemoveAll(x => x.ProductId == productId && x.Size == size);
        cart.Save(items);
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostCheckoutAsync()
    {
        if (User.Identity?.IsAuthenticated != true)
            return RedirectToPage("/Account/Login", new { returnUrl = "/Cart" });

        var items = cart.Get();
        if (items.Count == 0) return RedirectToPage();

        await using var tx = await db.Database.BeginTransactionAsync();
        var requiredByProduct = items.GroupBy(x => x.ProductId).ToDictionary(g => g.Key, g => g.Sum(x => x.Quantity));
        var products = await db.Products.Where(x => requiredByProduct.Keys.Contains(x.Id) && x.IsActive).ToDictionaryAsync(x => x.Id);
        foreach (var (productId, quantity) in requiredByProduct)
        {
            if (!products.TryGetValue(productId, out var product) || product.Stock < quantity)
            {
                ModelState.AddModelError(string.Empty, $"{items.First(x => x.ProductId == productId).Name} için stok yetersiz. Sepet miktarını güncelleyin.");
                Items = items;
                return Page();
            }
        }

        var order = new Order { UserId = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)!.Value, Total = 0 };
        foreach (var item in items)
        {
            var product = products[item.ProductId];
            product.Stock -= item.Quantity;
            order.Details.Add(new OrderDetail { Product = product, Quantity = item.Quantity, UnitPrice = product.Price, Size = item.Size });
            order.Total += product.Price * item.Quantity;
        }

        db.Orders.Add(order);
        await db.SaveChangesAsync();
        await tx.CommitAsync();
        cart.Clear();
        return RedirectToPage("/Orders/Index", new { placed = order.Id });
    }
}
