using System.Text.Json;
using Velora.Core.Models;

namespace Velora.Core.Services;

public sealed class CartService(IHttpContextAccessor accessor)
{
    private const string Key = "velora.cart";
    private ISession Session => accessor.HttpContext!.Session;
    public List<CartItem> Get() => JsonSerializer.Deserialize<List<CartItem>>(Session.GetString(Key) ?? "[]") ?? new();
    public void Save(List<CartItem> items) => Session.SetString(Key, JsonSerializer.Serialize(items));
    public void Clear() => Session.Remove(Key);
}
