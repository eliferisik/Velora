using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Velora.Core.Data;
using Velora.Core.Models;
using Velora.Core.Services;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<VeloraDbContext>(o => o.UseSqlite(builder.Configuration.GetConnectionString("DefaultConnection")));
builder.Services.AddDefaultIdentity<ApplicationUser>(o => { o.SignIn.RequireConfirmedAccount = false; o.Password.RequiredLength = 8; o.Password.RequireDigit = true; o.Password.RequireUppercase = true; })
    .AddRoles<IdentityRole>().AddEntityFrameworkStores<VeloraDbContext>();
builder.Services.ConfigureApplicationCookie(o => { o.LoginPath = "/Account/Login"; o.AccessDeniedPath = "/Account/AccessDenied"; o.Cookie.HttpOnly = true; o.Cookie.SameSite = SameSiteMode.Lax; });
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(o => { o.Cookie.HttpOnly = true; o.Cookie.IsEssential = true; o.IdleTimeout = TimeSpan.FromHours(2); });
builder.Services.AddHttpContextAccessor();
builder.Services.AddScoped<CartService>();
builder.Services.AddRazorPages(o => o.Conventions.AuthorizeFolder("/Admin", "AdminOnly"))
    .AddRazorPagesOptions(o => o.Conventions.AuthorizeFolder("/Orders"));
builder.Services.AddAuthorization(o => o.AddPolicy("AdminOnly", p => p.RequireRole("Admin")));

builder.Services.AddDataProtection().PersistKeysToFileSystem(new DirectoryInfo(Path.Combine(builder.Environment.ContentRootPath, "App_Data", "Keys"))).SetApplicationName("Velora.Core");
var app = builder.Build();
Directory.CreateDirectory(Path.Combine(app.Environment.ContentRootPath, "App_Data"));
Directory.CreateDirectory(Path.Combine(app.Environment.ContentRootPath, "App_Data", "Keys"));
if (!app.Environment.IsDevelopment()) { app.UseExceptionHandler("/Error"); app.UseHsts(); }
app.UseHttpsRedirection(); app.UseStaticFiles(); app.UseRouting(); app.UseSession(); app.UseAuthentication(); app.UseAuthorization();
app.MapRazorPages();
await DatabaseSeed.InitializeAsync(app.Services, app.Configuration);
app.Run();





