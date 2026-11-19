using System.Globalization;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Velora.Core.Data;
using Velora.Core.Models;

namespace Velora.Core.Pages.Orders;
[Authorize]
public sealed class IndexModel(VeloraDbContext db):PageModel
{
    public List<Order> Orders{get;private set;}=new();
    public int? PlacedId{get;private set;}
    public CultureInfo Culture=>CultureInfo.GetCultureInfo("tr-TR");
    public async Task OnGetAsync(int? placed){PlacedId=placed;var id=User.FindFirstValue(ClaimTypes.NameIdentifier)!;Orders=await db.Orders.Include(x=>x.Details).ThenInclude(x=>x.Product).Where(x=>x.UserId==id).OrderByDescending(x=>x.CreatedAt).ToListAsync();}
}
