<%@ Page Title="" Language="C#" MasterPageFile="~/velora.master"
AutoEventWireup="true"
CodeBehind="urundetay.aspx.cs"
Inherits="velorasite.urundetay" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<link href="urundetay.css" rel="stylesheet" />

<section class="product-detail-page">

    <div class="product-gallery">

        <!-- SOL KÜÇÜK GÖRSELLER -->

        <div class="small-images">

            <img src="images/elbise5.jpg"
                 onclick="changeImage(this)" />

            <img src="images/elbise5.1.jpg"
                 onclick="changeImage(this)" />

            <img src="images/elbise5.2.jpg"
                 onclick="changeImage(this)" />

        </div>



        <!-- BÜYÜK GÖRSEL -->

        <div class="main-image">

            <img id="mainProductImage"
                 src="images/elbise5.jpg" />

        </div>

    </div>



    <!-- ÜRÜN BİLGİLERİ -->

    <div class="product-detail-info">

        <span class="product-brand">
            VELORA STUDIO
        </span>

        <h1>
            Soft White Dress
        </h1>

        <p class="product-price">
            ₺2599
        </p>

        <p class="product-description">

            Minimal ve modern çizgilerle tasarlanan
            premium koleksiyon parçası.
            Günlük kullanım ve özel davetler için
            zamansız bir görünüm sunar.

        </p>



        <!-- BEDEN -->

        <div class="size-area">

            <h3>Beden Seç</h3>

            <div class="sizes">

                <button type="button">XS</button>
                <button type="button">S</button>
                <button type="button">M</button>
                <button type="button">L</button>
                <button type="button">XL</button>

            </div>

        </div>



        <!-- BUTONLAR -->

        <div class="detail-buttons">

            <button type="button"
                    class="add-cart"
                    onclick="addToCart()">

                Sepete Ekle

            </button>

            <button type="button"
                    class="favorite">

                ♡ Favorilere Ekle

            </button>

        </div>



        <!-- EXTRA -->

        <div class="product-extra">

            <div class="extra-box">

                <h4>Kargo</h4>

                <p>Ücretsiz Teslimat</p>

            </div>

            <div class="extra-box">

                <h4>İade</h4>

                <p>14 Gün Kolay İade</p>

            </div>

            <div class="extra-box">

                <h4>Kumaş</h4>

                <p>%100 Premium Satin</p>

            </div>

        </div>

    </div>

</section>



<script>

	// FOTOĞRAF DEĞİŞTİRME

	function changeImage(element) {

		document.getElementById("mainProductImage").src =
			element.src;

	}



	// BEDEN SEÇME

	const sizeButtons =
		document.querySelectorAll(".sizes button");

	sizeButtons.forEach(button => {

		button.addEventListener("click", function () {

			sizeButtons.forEach(btn =>
				btn.classList.remove("active"));

			this.classList.add("active");

		});

	});



	// SEPETE EKLE

	function addToCart() {

		const selectedSize =
			document.querySelector(".sizes button.active");

		if (!selectedSize) {

			alert("Lütfen beden seçiniz");
			return;

		}

		alert(
			"Ürün sepete eklendi. Beden: "
			+ selectedSize.innerText
		);

	}

</script>

</asp:Content>