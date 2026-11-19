using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Velora.Core.Models;

namespace Velora.Core.Data;

public sealed class VeloraDbContext(DbContextOptions<VeloraDbContext> options) : IdentityDbContext<ApplicationUser>(options)
{
    public DbSet<Category> Categories => Set<Category>();
    public DbSet<Product> Products => Set<Product>();
    public DbSet<Order> Orders => Set<Order>();
    public DbSet<OrderDetail> OrderDetails => Set<OrderDetail>();

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        builder.Entity<Category>().HasIndex(x => x.Name).IsUnique();
        builder.Entity<Product>().HasOne(x => x.Category).WithMany(x => x.Products).HasForeignKey(x => x.CategoryId).OnDelete(DeleteBehavior.Restrict);
        builder.Entity<Product>().Property(x => x.Price).HasPrecision(10, 2);
        builder.Entity<Order>().Property(x => x.Total).HasPrecision(10, 2);
        builder.Entity<Order>().HasOne(x => x.User).WithMany().HasForeignKey(x => x.UserId).OnDelete(DeleteBehavior.Restrict);
        builder.Entity<OrderDetail>().Property(x => x.UnitPrice).HasPrecision(10, 2);
        builder.Entity<OrderDetail>().HasOne(x => x.Product).WithMany().HasForeignKey(x => x.ProductId).OnDelete(DeleteBehavior.Restrict);
        builder.Entity<OrderDetail>().HasOne(x => x.Order).WithMany(x => x.Details).HasForeignKey(x => x.OrderId).OnDelete(DeleteBehavior.Cascade);
    }
}

