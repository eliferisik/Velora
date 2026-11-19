using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Velora.Core.Data;
using Velora.Core.Models;

namespace Velora.Core.Services;

public static class DatabaseSeed
{
    private static readonly string[] CategoryNames =
    [
        "Elbise", "Etek", "T-Shirt & Atlet", "Bluz & Body", "Gömlek", "Sweatshirt", "Jeans", "Pantolon", "Şort", "Blazer Ceket", "Takım", "Spor Giyim", "Pijama", "İç Giyim", "Aksesuar"
    ];

    public static async Task InitializeAsync(IServiceProvider services, IConfiguration configuration)
    {
        using var scope = services.CreateScope();
        var db = scope.ServiceProvider.GetRequiredService<VeloraDbContext>();
        await db.Database.MigrateAsync();
        var roles = scope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();
        foreach (var role in new[] { "Admin", "User" })
            if (!await roles.RoleExistsAsync(role)) await roles.CreateAsync(new IdentityRole(role));

        var users = scope.ServiceProvider.GetRequiredService<UserManager<ApplicationUser>>();
        var adminEmail = configuration["AdminSeed:Email"];
        var adminPassword = configuration["AdminSeed:Password"];
        if (!string.IsNullOrWhiteSpace(adminEmail) && !string.IsNullOrWhiteSpace(adminPassword))
        {
            var admin = await users.FindByEmailAsync(adminEmail);
            if (admin is null)
            {
                admin = new ApplicationUser { UserName = adminEmail, Email = adminEmail, EmailConfirmed = true, FullName = "Velora Yönetici" };
                var result = await users.CreateAsync(admin, adminPassword);
                if (result.Succeeded) await users.AddToRoleAsync(admin, "Admin");
            }
            else if (!await users.IsInRoleAsync(admin, "Admin")) await users.AddToRoleAsync(admin, "Admin");
        }

        var existingCategories = await db.Categories.ToListAsync();
        foreach (var name in CategoryNames)
            if (!existingCategories.Any(c => c.Name == name)) db.Categories.Add(new Category { Name = name, Description = $"Velora {name} koleksiyonu" });
        await db.SaveChangesAsync();
        var categories = await db.Categories.ToDictionaryAsync(c => c.Name);

        var products = new (string Name, int Price, int Stock, string Image, string Hover, string Description, string Category)[]
        {
            ("Bej Mini Elbise",2199,12,"elbise1.jpg","elbise1.1.jpg","Yumuşak dokusu ve sade kesimiyle günlük stile zarif bir dokunuş katar.","Elbise"),
            ("Puantiye Midi Elbise",1899,10,"elbise2.jpg","elbise2.1.jpg","Hareketli puantiye deseni ve midi boy kesimiyle zamansız bir görünüm sunar.","Elbise"),
            ("Siyah Detay Elbise",2499,8,"elbise3.jpg","elbise3.1.jpg","Modern siyah detayları ve rahat kalıbıyla öne çıkar.","Elbise"),
            ("Bağcıklı Siyah Elbise",2799,7,"elbise4.jpg","elbise4.1.jpg","Bağcık detayıyla modern ve güçlü bir gardırop parçası.","Elbise"),
            ("Puantiye Elbise",2599,9,"elbise5.jpg","elbise5.1.jpg","Günlük kullanım ve özel davetler için zamansız görünüm.","Elbise"),
            ("Beyaz Saten Elbise",3299,5,"elbise6.jpg","elbise6.1.jpg","Akışkan saten dokusu ve zarif görünümüyle öne çıkar.","Elbise"),
            ("Siyah Çapraz Elbise",3599,6,"elbise7.jpg","elbise7.1.jpg","Çapraz kesimiyle modern ve dikkat çekici stil.","Elbise"),
            ("Yeşil Mini Elbise",1999,11,"elbise8.jpg","elbise8.1.jpg","Canlı rengi ve mini boy kesimiyle enerjik kombinler.","Elbise"),
            ("Kırmızı Mini Elbise",2899,4,"elbise9.jpg","elbise9.1.jpg","Cesur rengiyle stilinize güçlü bir vurgu katar.","Elbise"),
            ("Pötikareli Mini Elbise",1790,13,"elbise10.jpg","elbise10.1.jpg","Pötikare deseni ve rahat kesimiyle modern günlük stil.","Elbise"),
            ("Yüksek Bel Etek",1899,14,"etek1.jpg","etek1.1.jpg","Minimal kesimli zamansız etek.","Etek"),
            ("Keten Takım",2599,8,"keten2.jpg","keten2.1.jpg","Doğal dokulu, modern keten takım.","Takım"),
            ("Streç Top",2199,8,"top1.jpg","top1.1.jpg","Minimal koleksiyondan modern kesimli streç top.","T-Shirt & Atlet"),
            ("Jeans",3000,8,"jeans1.jpg","jeans1.1.jpg","Günlük kombinler için zamansız denim.","Jeans"),
            ("Gömlek",1700,8,"gömlek1.jpg","gömlek1.1.jpg","Minimal çizgili, çok yönlü gömlek.","Gömlek"),
            ("Ceket",2300,6,"ceket1.jpg","ceket1.1.jpg","Günlük stile uygun modern ceket.","Blazer Ceket"),
            ("Mini Elbise",1999,11,"elbise8.jpg","elbise8.1.jpg","Mini boy kesimiyle enerjik kombinler.","Elbise"),
            ("Keten Takım Natural",2499,8,"keten1.jpg","keten1.1.jpg","Doğal dokulu keten takım.","Takım")
        };
        var existingNames = await db.Products.Select(p => p.Name).ToListAsync();
        foreach (var product in products)
            if (!existingNames.Contains(product.Name))
                db.Products.Add(new Product { Name = product.Name, Price = product.Price, Stock = product.Stock, Image = "images/" + product.Image, HoverImage = "images/" + product.Hover, Description = product.Description, Category = categories[product.Category] });
        await db.SaveChangesAsync();
    }
}
