using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Velora.Core.Data;
using Velora.Core.Models;

namespace Velora.Core.Pages.Products;
public sealed class IndexModel(VeloraDbContext db) : PageModel
{
    public List<Category> Categories { get; private set; } = new();
    public List<Product> Products { get; private set; } = new();
    public string? Query { get; private set; }
    public string? Sort { get; private set; }
    public int? CategoryId { get; private set; }
    public async Task OnGetAsync(string? q, int? category, string? sort)
    {
        Query=q?.Trim(); Sort=sort; CategoryId=category;
        Categories=await db.Categories.OrderBy(x=>x.Name).ToListAsync();
        var list=db.Products.Include(x=>x.Category).Where(x=>x.IsActive).AsQueryable();
        if(!string.IsNullOrWhiteSpace(Query)) list=list.Where(x=>x.Name.Contains(Query)||x.Description.Contains(Query));
        if(category.HasValue) list=list.Where(x=>x.CategoryId==category.Value);
        if (sort == "top")
        {
            Products = await list.OrderByDescending(x => db.OrderDetails.Where(d => d.ProductId == x.Id).Sum(d => (int?)d.Quantity) ?? 0).ToListAsync();
            return;
        }

        // SQLite cannot ORDER BY decimal values; filter in SQL then sort the small result set with LINQ.
        var filteredProducts = await list.ToListAsync();
        Products = sort switch
        {
            "price-asc" => filteredProducts.OrderBy(x => x.Price).ToList(),
            "price-desc" => filteredProducts.OrderByDescending(x => x.Price).ToList(),
            _ => filteredProducts.OrderBy(x => x.Name).ToList()
        };
    }
}
