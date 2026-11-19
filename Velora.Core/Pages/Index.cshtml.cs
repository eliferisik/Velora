using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Velora.Core.Data;
using Velora.Core.Models;

public sealed class IndexModel(VeloraDbContext db) : PageModel
{
    public List<Category> Categories { get; private set; } = new();
    public List<Product> Products { get; private set; } = new();
    public async Task OnGetAsync()
    {
        Categories = await db.Categories.OrderBy(x => x.Name).ToListAsync();
        var featured = new[] { "Streç Top", "Yüksek Bel Etek", "Jeans", "Keten Takım", "Puantiye Elbise", "Gömlek", "Ceket", "Puantiye Midi Elbise", "Mini Elbise", "Keten Takım Natural" };
        Products = await db.Products.Include(x => x.Category).Where(x => x.IsActive && featured.Contains(x.Name))
            .ToListAsync();
        Products = Products.OrderBy(x => Array.IndexOf(featured, x.Name)).ToList();
    }
}
