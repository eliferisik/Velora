
<%@ Page Title="" Language="C#" 
MasterPageFile="~/velora.master"
AutoEventWireup="true"
CodeBehind="Favoriler.aspx.cs"
Inherits="velorasite.Favoriler" %>

<asp:Content ID="Content2"
ContentPlaceHolderID="head"
runat="server">

<link href="favoriler.css" rel="stylesheet" />

</asp:Content>



<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="favorites-page">

    <div class="favorites-header">

        <span>VELORA FAVORITES</span>

        <h1>Favorilerim</h1>

        <p>
            Favorilere eklediğiniz ürünler burada görünür.
        </p>

    </div>



    <div id="favorites-container"
        class="favorites-grid">

    </div>

</div>



<script>

	window.onload = function () {

		let favorites =
			JSON.parse(localStorage.getItem("favorites")) || [];



		let container =
			document.getElementById("favorites-container");



		// BOŞ FAVORİ

		if (favorites.length === 0) {

			container.innerHTML = `

        <div class="empty-favorites">

            <h2>
                Henüz favori ürününüz bulunmamaktadır 🤍
            </h2>

            <p>
                Beğendiğiniz ürünleri favorilere ekleyebilirsiniz.
            </p>

            <a href="elbise.aspx">
                Ürünleri Keşfet
            </a>

        </div>

        `;

			return;
		}



		// ÜRÜNLER

		favorites.forEach(product => {

			container.innerHTML += `

        <div class="dress-card">

            <div class="dress-image">



                <div class="favorite-btn active"
                onclick="removeFavorite('${product.name}')">

                ♥

                </div>



                <img src="${product.image}"
                class="main-img" />



                <img src="${product.hoverImage || product.image}"
                class="hover-img" />



            </div>



            <div class="dress-info">

                <span>VELORA FAVORITE</span>

                <h3>${product.name}</h3>

                <p>${product.price}</p>



                <div class="favorite-buttons">

                    <button
                    class="cart-btn"
                    onclick="addToCart(
                    '${product.name}',
                    ${parseInt(product.price.replace('₺', ''))},
                    '${product.image}'
                    )">

                    Sepete Ekle

                    </button>

                </div>

            </div>

        </div>

        `;

		});

	}



	// FAVORİDEN KALDIR

	function removeFavorite(name) {

		let favorites =
			JSON.parse(localStorage.getItem("favorites")) || [];



		favorites =
			favorites.filter(x => x.name !== name);



		localStorage.setItem(
			"favorites",
			JSON.stringify(favorites)
		);



		location.reload();

	}



	// SEPET

	function addToCart(name, price, image) {

		let cart =
			JSON.parse(localStorage.getItem("cart")) || [];



		cart.push({

			name: name,
			price: price,
			image: image,
			quantity: 1,
			size: "S"

		});



		localStorage.setItem(
			"cart",
			JSON.stringify(cart)
		);



		alert("Ürün sepete eklendi 🛒");

	}

</script>

</asp:Content>
