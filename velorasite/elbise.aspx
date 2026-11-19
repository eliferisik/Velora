
<%@ Page Title="" Language="C#" MasterPageFile="~/velora.master"
AutoEventWireup="true"
CodeBehind="elbise.aspx.cs"
Inherits="velorasite.elbise" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<link href="elbise.css" rel="stylesheet" />

<section class="dress-page">

<div class="dress-layout">

    <aside class="dress-sidebar">

        <h2>Kategoriler</h2>

        <ul>

            <li><a href="elbise.aspx">Elbise</a></li>
            <li><a href="#">Etek</a></li>
            <li><a href="#">T-Shirt & Atlet</a></li>
            <li><a href="#">Bluz & Body</a></li>
            <li><a href="#">Gömlek</a></li>
            <li><a href="#">Sweatshirt</a></li>
            <li><a href="#">Jeans</a></li>
            <li><a href="#">Pantolon</a></li>
            <li><a href="#">Şort</a></li>
            <li><a href="#">Blazer Ceket</a></li>
            <li><a href="#">Takım</a></li>
            <li><a href="#">Spor Giyim</a></li>
            <li><a href="#">Pijama</a></li>
            <li><a href="#">İç Giyim</a></li>
            <li><a href="#">Aksesuar</a></li>

        </ul>

    </aside>



    <div class="dress-content">

        <div class="page-header">

            <span>VELORA COLLECTION</span>

            <h1>Elbiseler</h1>

            <p>
                Zamansız, modern ve premium elbise koleksiyonu.
            </p>

        </div>



        <div class="dress-grid">

		<!-- ÜRÜN 5 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">YENİ</span>

<div class="favorite-btn"
data-name="Puantiye Elbise"
onclick="addToFavorites(
'Puantiye Elbise',
'₺2599',
'images/elbise5.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise5.jpg" class="main-img" />
<img src="images/elbise5.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Puantiye Elbise</h3>

<p>₺2599</p>

<a href="urundetay.aspx" class="detail-btn">
Ürünü İncele
</a>

<button type="button"
class="cart-btn"
onclick="addToCart(
'Puantiye Elbise',
2599,
'images/elbise5.jpg'
)">

Sepete Ekle

</button>

</div>

</div>



<!-- ÜRÜN 2 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">TREND</span>

<div class="favorite-btn"
data-name="Puantiye Midi Elbise"
onclick="addToFavorites(
'Puantiye Midi Elbise',
'₺1899',
'images/elbise2.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise2.jpg" class="main-img" />
<img src="images/elbise2.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Puantiye Midi Elbise</h3>

<p>₺1899</p>

<a class="detail-btn">
Ürünü İncele
</a>

<button  type="button"
class="cart-btn"
onclick="addToCart(
'',
1899,
'images/elbise2.jpg'
)">

Sepete Ekle

</button>

</div>

</div>



<!-- ÜRÜN 3 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">LIMITED</span>

<div class="favorite-btn"
data-name="Siyah Detay Elbise"
onclick="addToFavorites(
'Siyah Detay Elbise',
'₺2499',
'images/elbise3.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise3.jpg" class="main-img" />
<img src="images/elbise3.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Siyah Detay Elbise</h3>

<p>₺2499</p>

<a class="detail-btn">
Ürünü İncele
</a>

<button  type="button"
class="cart-btn"
onclick="addToCart(
'Siyah Detay Elbise',
2499,
'images/elbise3.jpg'
)">

Sepete Ekle

</button>

</div>

</div>



<!-- ÜRÜN 4 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">NEW</span>

<div class="favorite-btn"
data-name="Bağcıklı Siyah Elbise"
onclick="addToFavorites(
'Bağcıklı Siyah Elbise',
'₺2799',
'images/elbise4.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise4.jpg" class="main-img" />
<img src="images/elbise4.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Bağcıklı Siyah Elbise</h3>

<p>₺2799</p>

<a class="detail-btn">
Ürünü İncele
</a>

<button type="button"
class="cart-btn"
onclick="addToCart(
'Bağcıklı Siyah Elbise',
2799,
'images/elbise4.jpg'
)">

Sepete Ekle

</button>

</div>

</div>



<!-- ÜRÜN 1 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">YENİ</span>

<div class="favorite-btn"
data-name="Bej Mini Elbise"
onclick="addToFavorites(
'Bej Mini Elbise',
'₺2199',
'images/elbise1.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise1.jpg" class="main-img" />
<img src="images/elbise1.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Bej Mini Elbise</h3>

<p>₺2199</p>

<a class="detail-btn">
Ürünü İncele
</a>

<button type="button"
class="cart-btn"
onclick="addToCart(
'Bej Mini Elbise',
2199,
'images/elbise1.jpg'
)">

Sepete Ekle

</button>

</div>

</div>



<!-- ÜRÜN 6 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">TREND</span>

<div class="favorite-btn"
data-name="Beyaz Saten Elbise"
onclick="addToFavorites(
'Beyaz Saten Elbise',
'₺3299',
'images/elbise6.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise6.jpg" class="main-img" />
<img src="images/elbise6.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Beyaz Saten Elbise</h3>

<p>₺3299</p>

<a class="detail-btn">
Ürünü İncele
</a>

<button type="button"
class="cart-btn"
onclick="addToCart(
'Beyaz Saten Elbise',
3299,
'images/elbise6.jpg'
)">

Sepete Ekle

</button>

</div>

</div>
<!-- ÜRÜN 7 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">LIMITED</span>

<div class="favorite-btn"
data-name="Siyah Çapraz Elbise"
onclick="addToFavorites(
'Siyah Çapraz Elbise',
'₺3599',
'images/elbise7.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise7.jpg" class="main-img" />
<img src="images/elbise7.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Siyah Çapraz Elbise</h3>

<p>₺3599</p>

<a class="detail-btn">
Ürünü İncele
</a>

<button type="button"
class="cart-btn"
onclick="addToCart(
'Siyah Çapraz Elbise',
3599,
'images/elbise7.jpg'
)">

Sepete Ekle

</button>

</div>

</div>



<!-- ÜRÜN 8 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">NEW</span>

<div class="favorite-btn"
data-name="Yeşil Mini Elbise"
onclick="addToFavorites(
'Yeşil Mini Elbise',
'₺1999',
'images/elbise8.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise8.jpg" class="main-img" />
<img src="images/elbise8.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Yeşil Mini Elbise</h3>

<p>₺1999</p>

<a class="detail-btn">
Ürünü İncele
</a>

<button type="button"
class="cart-btn"
onclick="addToCart(
'Yeşil Mini Elbise',
1999,
'images/elbise8.jpg'
)">

Sepete Ekle

</button>

</div>

</div>



<!-- ÜRÜN 9 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">YENİ</span>

<div class="favorite-btn"
data-name="Kırmızı Mini Elbise"
onclick="addToFavorites(
'Kırmızı Mini Elbise',
'₺2899',
'images/elbise9.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise9.jpg" class="main-img" />
<img src="images/elbise9.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Kırmızı Mini Elbise</h3>

<p>₺2899</p>

<a class="detail-btn">
Ürünü İncele
</a>

<button type="button"
class="cart-btn"
onclick="addToCart(
'Kırmızı Mini Elbise',
2899,
'images/elbise9.jpg'
)">

Sepete Ekle

</button>

</div>

</div>



<!-- ÜRÜN 10 -->
<div class="dress-card">

<div class="dress-image">

<span class="badge">TREND</span>

<div class="favorite-btn"
data-name="Pötikareli Mini Elbise"
onclick="addToFavorites(
'Pötikareli Mini Elbise',
'₺1790',
'images/elbise10.jpg',
null,
this
)">
♡
</div>

<img src="images/elbise10.jpg" class="main-img" />
<img src="images/elbise10.1.jpg" class="hover-img" />

</div>

<div class="dress-info">

<span>Soft Summer</span>

<h3>Pötikareli Mini Elbise</h3>

<p>₺1790</p>

<a class="detail-btn">
Ürünü İncele
</a>

<button type="button"
class="cart-btn"
onclick="addToCart(
'Pötikareli Mini Elbise',
1790,
'images/elbise10.jpg'
)">

Sepete Ekle

</button>

</div>

</div>
    </div>

</div>

</section>
<script>

	function showMessage(text) {

		let existing =
			document.getElementById("customMessage");

		if (existing) {

			existing.remove();

		}



		let box =
			document.createElement("div");

		box.id = "customMessage";

		box.innerHTML = text;



		box.style.position = "fixed";
		box.style.top = "90px";
		box.style.right = "20px";
		box.style.background = "white";
		box.style.color = "#111";
		box.style.padding = "16px 24px";
		box.style.borderRadius = "14px";
		box.style.fontSize = "14px";
		box.style.fontWeight = "500";
		box.style.zIndex = "999999";
		box.style.boxShadow =
			"0 8px 22px rgba(0,0,0,0.08)"
		box.style.border = "1px solid #ececec";



		document.body.appendChild(box);



		setTimeout(() => {

			box.remove();

		}, 2000);

	}





	function addToFavorites(
		name,
		price,
		image,
		hoverImage,
		element
	) {

		event.preventDefault();



		let favorites =
			JSON.parse(localStorage.getItem("favorites")) || [];



		let exists =
			favorites.find(x => x.name === name);



		if (exists) {

			favorites =
				favorites.filter(x => x.name !== name);



			localStorage.setItem(
				"favorites",
				JSON.stringify(favorites)
			);



			element.classList.remove("active");

			element.innerHTML = "♡";



			showMessage(
				"Ürün favorilerinizden kaldırıldı 💔"
			);

		}

		else {

			favorites.push({

				name: name,
				price: price,
				image: image,
				hoverImage: hoverImage

			});



			localStorage.setItem(
				"favorites",
				JSON.stringify(favorites)
			);



			element.classList.add("active");

			element.innerHTML = "♥";



			showMessage(
				"Ürün favorilerinize eklendi ❤️"
			);

		}

	}





	function addToCart(name, price, image) {

		event.preventDefault();



		let cart =
			JSON.parse(localStorage.getItem("cart")) || [];



		let existingProduct =
			cart.find(x => x.name === name);



		if (existingProduct) {

			existingProduct.quantity += 1;

		}

		else {

			cart.push({

				name: name,
				price: price,
				image: image,
				quantity: 1

			});

		}



		localStorage.setItem(
			"cart",
			JSON.stringify(cart)
		);



		showMessage(
			"Ürün sepetinize eklendi 🛒"
		);

	}





	window.onload = function () {

		let favorites =
			JSON.parse(localStorage.getItem("favorites")) || [];



		document
			.querySelectorAll(".favorite-btn")
			.forEach(btn => {

				let productName =
					btn.getAttribute("data-name");



				let exists =
					favorites.find(
						x => x.name === productName
					);



				if (exists) {

					btn.classList.add("active");

					btn.innerHTML = "♥";

				}

			});

	}

</script>

</asp:Content>
