
<%@ Page Title="" Language="C#" MasterPageFile="~/velora.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="velorasite._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section class="top-categories">

    <div class="top-category">
        <img src="images/elbise.png" />
        <span>Elbise</span>
    </div>

    <div class="top-category">
        <img src="images/takim.png" />
        <span>Takım</span>
    </div>

    <div class="top-category">
        <img src="images/yuvarlakminimal.png" />
        <span>Minimal</span>
    </div>

    <div class="top-category">
        <img src="images/soft.png" />
        <span>Soft Girl</span>
    </div>

    <div class="top-category">
        <img src="images/blazer.png" />
        <span>Blazer</span>
    </div>

    <div class="top-category">
        <img src="images/yuvarlakevening.png" />
        <span>Evening</span>
    </div>

</section>



<section class="promo-banners">

    <div class="promo-card large-banner">
        <img src="images/summerescape.png" />
    </div>

    <div class="promo-card">
        <img src="images/minimal.png" />
    </div>

    <div class="promo-card">
        <img src="images/evening.png" />
    </div>

</section>
<section class="shop-area">

<aside class="sidebar">

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

<div class="collection-section">

<div class="collection-header">

    <h2>Sana Özel Ürünler</h2>

</div>



<div class="trend-categories">

    <div class="trend-box">Minimal</div>
    <div class="trend-box">Soft Girl</div>
    <div class="trend-box">Summer Mood</div>
    <div class="trend-box">Black Edition</div>
    <div class="trend-box">Old Money</div>

</div>



<div class="slider-wrapper">

    <button type="button" class="slider-btn left-btn">
        &#10094;
    </button>



    <section class="products" id="productSlider">



        <div class="product-card">

            <div class="product-image">

                <div class="favorite-btn">♡</div>

                <img src="images/top1.jpg" class="main-img" />
                <img src="images/top1.1.jpg" class="hover-img" />

            </div>

            <div class="product-info">

                <div class="product-category">Minimal Collection</div>

                <h3>Streç Top</h3>

                <p>₺2199</p>

            </div>

        </div>





        <div class="product-card">

            <div class="product-image">

                <div class="favorite-btn"
                     onclick="addToFavorites('Askılı Mini Elbise', '₺1899', 'images/elbise2.jpg')">
                     ♡
                </div>

                <img src="images/etek1.jpg" class="main-img" />
                <img src="images/etek1.1.jpg" class="hover-img" />

            </div>

            <div class="product-info">

                <div class="product-category">Soft Summer</div>

                <h3>Etek</h3>

                <p>₺1899</p>

            </div>

        </div>





        <div class="product-card">

            <div class="product-image">

                <div class="favorite-btn">♡</div>

                <img src="images/jeans1.jpg" class="main-img" />
                <img src="images/jeans1.1.jpg" class="hover-img" />

            </div>

            <div class="product-info">

                <div class="product-category">Jeans Colleciton</div>

                <h3>Jeans</h3>

                <p>₺3000</p>

            </div>

        </div>

          <div class="product-card">

      <div class="product-image">

          <div class="favorite-btn">♡</div>

          <img src="images/keten2.jpg" class="main-img" />
          <img src="images/keten2.1.jpg" class="hover-img" />

      </div>

      <div class="product-info">

          <div class="product-category">Minimal Collection</div>

          <h3>Keten Takım</h3>

          <p>₺2599</p>

      </div>

  </div>

          <div class="product-card">

    <div class="product-image">

        <div class="favorite-btn">♡</div>

        <img src="images/elbise5.jpg" class="main-img" />
        <img src="images/elbise5.1.jpg" class="hover-img" />

    </div>

    <div class="product-info">

        <div class="product-category">Satin Mood</div>

        <h3>Puantiye Elbise</h3>

        <p>₺2599</p>

    </div>

</div>
          <div class="product-card">

    <div class="product-image">

        <div class="favorite-btn">♡</div>

        <img src="images/gömlek1.jpg" class="main-img" />
        <img src="images/gömlek1.1.jpg" class="hover-img" />

    </div>

    <div class="product-info">

        <div class="product-category">Minimal Collection</div>

        <h3>Gömlek</h3>

        <p>₺1700</p>

    </div>

</div>

          <div class="product-card">

    <div class="product-image">

        <div class="favorite-btn">♡</div>

        <img src="images/ceket1.jpg" class="main-img" />
        <img src="images/ceket1.1.jpg" class="hover-img" />

    </div>

    <div class="product-info">

        <div class="product-category">Jeans Colleciton</div>

        <h3>Ceket</h3>

        <p>₺2300</p>

    </div>

</div>

          <div class="product-card">

    <div class="product-image">

        <div class="favorite-btn">♡</div>

        <img src="images/elbise2.jpg" class="main-img" />
        <img src="images/elbise2.1.jpg" class="hover-img" />

    </div>

    <div class="product-info">

        <div class="product-category">Soft Summer</div>

        <h3>Puantiye Midi Elbise</h3>

        <p>₺1899</p>

    </div>

</div>

          <div class="product-card">

    <div class="product-image">

        <div class="favorite-btn">♡</div>

        <img src="images/elbise8.jpg" class="main-img" />
        <img src="images/elbise8.1.jpg" class="hover-img" />

    </div>

    <div class="product-info">

        <div class="product-category">Soft Summer</div>

        <h3>Mini Elbise</h3>

        <p>₺1999</p>

    </div>

</div>
                  <div class="product-card">

    <div class="product-image">

        <div class="favorite-btn">♡</div>

        <img src="images/keten1.jpg" class="main-img" />
        <img src="images/keten1.1.jpg" class="hover-img" />

    </div>

    <div class="product-info">

        <div class="product-category">Minimal Collection</div>

        <h3>Keten Takım</h3>

        <p>₺2499</p>

    </div>

</div>

    </section>



    <button type="button" class="slider-btn right-btn">
        &#10095;
    </button>

</div>





<div class="big-banners">

    <div class="banner-box">

        <div class="banner-content">

            <h2>Yeni Gelenler</h2>

            <span>→</span>

        </div>

    </div>



    <div class="banner-box">

        <div class="banner-content">

            <h2>Çok Satanlar</h2>

            <span>→</span>

        </div>

    </div>

</div>





<section class="collections-section">

    <div class="section-title">

        <h2>VELORA COLLECTIONS</h2>

    </div>



    <div class="collections-grid">

        <div class="collection-card">
            <img src="images/softsummer.png" />
        </div>

        <div class="collection-card">
            <img src="images/limited.png" />
        </div>

        <div class="collection-card">
            <img src="images/studio.png" />
        </div>

        <div class="collection-card">
            <img src="images/evenin.png" />
        </div>

    </div>

</section>





<section class="color-section">

    <div class="section-title">

        <h2>SEZONUN RENKLERİ</h2>

    </div>



    <div class="color-grid">

        <div class="color-card">
            <img src="images/visne.png" />
            <span>Vişne-Bordo</span>
        </div>

        <div class="color-card">
            <img src="images/yagyesili.png" />
            <span>Yağ Yeşili</span>
        </div>

        <div class="color-card">
            <img src="images/sari.png" />
            <span>Sarı</span>
        </div>

        <div class="color-card">
            <img src="images/pastel.png" />
            <span>Pastel Tonlar</span>
        </div>

        <div class="color-card">
            <img src="images/kirmizi.png" />
            <span>Kırmızı</span>
        </div>

    </div>

</section>





<section class="guide-section">

    <div class="section-title">

        <h2>DRESS GUIDE</h2>

    </div>



    <div class="guide-grid">

        <div class="guide-card">
            <img src="images/midi.png" />
        </div>

        <div class="guide-card">
            <img src="images/black.png" />
        </div>

        <div class="guide-card">
            <img src="images/mini.png" />
        </div>

        <div class="guide-card">
            <img src="images/satin.png" />
        </div>

    </div>

</section>



<script>

	const slider =
		document.getElementById("productSlider");

	const rightBtn =
		document.querySelector(".right-btn");

	const leftBtn =
		document.querySelector(".left-btn");

	rightBtn.onclick = () => {

		slider.scrollBy({

			left: 340,
			behavior: "smooth"

		});

	};

	leftBtn.onclick = () => {

		slider.scrollBy({

			left: -340,
			behavior: "smooth"

		});

	};

</script>
</div>

</section>
</asp:Content>
