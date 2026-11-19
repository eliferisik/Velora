# Velora E-Ticaret

Velora'nın mevcut görsellerini ve görsel stilini koruyan ASP.NET Core Razor Pages e-ticaret uygulaması. Çözüm `velorasite.slnx` artık .NET 8 web projesini açar. Eski ASP.NET Web Forms kaynakları `velorasite/` klasöründe dokunulmadan durur.

## Teknolojiler

- ASP.NET Core Razor Pages (.NET 8)
- ASP.NET Core Identity: kullanıcı, parola, oturum ve Admin/User rolleri
- Entity Framework Core 8, SQLite, migration'lar
- Session tabanlı alışveriş sepeti

## Çalıştırma

Visual Studio 2022/18 ile `velorasite.slnx` dosyasını açıp `Velora.Core` projesini başlatın. İlk açılışta `InitialCreate` migration'ı uygulanır; kategori ve ürün örnekleri eklenir.

CLI ile, NuGet paket geri yükleme tamamlandıktan sonra:

```powershell
$env:AdminSeed__Email = Read-Host "Yönetici e-posta adresi"
$env:AdminSeed__Password = Read-Host "Yönetici parolası"
dotnet run --project .\Velora.Core\Velora.Core.csproj
```

Yönetici oluşturmak için ilk açılıştan önce `AdminSeed__Email` ve `AdminSeed__Password` ortam değişkenlerini ayarlayın. Parola en az 8 karakter, büyük harf ve rakam içermelidir. Uygulama parolayı kod deposuna yazmaz. İlk kullanıcı oluşturulduktan sonra değişkenleri kaldırabilirsiniz. Normal kullanıcılar Kayıt Ol sayfasından kayıt olur.

## İşlevler

- Veritabanından ürün ve kategori listeleme, arama, kategori/fiyat filtresi ve çok satanlara göre sıralama
- Her ürün için görselleri, açıklaması, fiyatı ve stoku gösteren detay sayfası; beden seçimi
- Oturum sepeti; miktar güncelleme, silme, toplamı hesaplama ve siparişe dönüştürme
- Sipariş oluşturulurken veritabanındaki güncel stok/fiyat kontrolü; aynı transaction'da stok düşme ve sipariş kaydı
- ASP.NET Core Identity kayıt/giriş/çıkış, rol yetkilendirmesi
- Yalnızca Admin rolüne açık ürün/kategori CRUD ve sipariş durumu yönetimi
- Kullanıcının yalnızca kendi siparişlerini görebildiği sipariş geçmişi

## Migration

Migration dosyaları `Velora.Core/Data/Migrations` altındadır. Yeni model değişikliklerinde EF Core migration ekleyin ve `dotnet ef database update` ile uygulayın.
