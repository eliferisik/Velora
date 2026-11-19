using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace Velora.Core.Models;

public sealed class Category
{
    public int Id { get; set; }
    [Required, StringLength(80)] public string Name { get; set; } = "";
    [StringLength(240)] public string? Description { get; set; }
    public ICollection<Product> Products { get; set; } = new List<Product>();
}

public sealed class Product
{
    public int Id { get; set; }
    [Required, StringLength(140)] public string Name { get; set; } = "";
    [Required, StringLength(2000)] public string Description { get; set; } = "";
    [Range(typeof(decimal), "0.01", "1000000")] public decimal Price { get; set; }
    [Range(0, 100000)] public int Stock { get; set; }
    [Required, StringLength(260)] public string Image { get; set; } = "images/elbise1.jpg";
    [StringLength(260)] public string? HoverImage { get; set; }
    public bool IsActive { get; set; } = true;
    public int CategoryId { get; set; }
    public Category? Category { get; set; }
}

public sealed class Order
{
    public int Id { get; set; }
    [Required] public string UserId { get; set; } = "";
    public ApplicationUser? User { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    [Required, StringLength(50)] public string Status { get; set; } = "Alındı";
    public decimal Total { get; set; }
    public ICollection<OrderDetail> Details { get; set; } = new List<OrderDetail>();
}

public sealed class OrderDetail
{
    public int Id { get; set; }
    public int OrderId { get; set; }
    public Order? Order { get; set; }
    public int ProductId { get; set; }
    public Product? Product { get; set; }
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    [Required, StringLength(40)] public string Size { get; set; } = "M";
}

public sealed class ApplicationUser : IdentityUser
{
    [StringLength(120)] public string FullName { get; set; } = "";
}

public sealed class CartItem
{
    public int ProductId { get; set; }
    public string Name { get; set; } = "";
    public string Image { get; set; } = "";
    public decimal UnitPrice { get; set; }
    public int Quantity { get; set; }
    public string Size { get; set; } = "M";
}

