
<%@ Page Title="" Language="C#" 
MasterPageFile="~/velora.master"
AutoEventWireup="true"
CodeBehind="sepet.aspx.cs"
Inherits="velorasite.sepet" %>



<asp:Content ID="Content2"
ContentPlaceHolderID="head"
runat="server">

    <link href="sepet.css" rel="stylesheet" />

</asp:Content>



<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<section class="cart-page">

    <!-- SOL TARAF -->

    <div class="cart-left">

        <h1>Sepetim</h1>

        <div id="cartItems">

        </div>

    </div>



    <!-- SAĞ TARAF -->

    <div class="cart-summary">

        <div>

            <h2>Sipariş Özeti</h2>

            <div class="summary-row">

                <span>Ara Toplam</span>

                <span id="subtotal">₺0</span>

            </div>

            <div class="summary-row">

                <span>Kargo</span>

                <span>Ücretsiz</span>

            </div>

            <div class="summary-row total">

                <span>Toplam</span>

                <span id="total">₺0</span>

            </div>

        </div>



        <button type="button"
        class="checkout-btn">

            Ödemeye Geç

        </button>



        <div class="summary-extra">

            <div class="extra-box">

                <h4>📦 Kargo</h4>

                <p>Ücretsiz Teslimat</p>

            </div>

            <div class="extra-box">

                <h4>↩️ İade</h4>

                <p>14 Gün Kolay İade</p>

            </div>

            <div class="extra-box">

                <h4>🔒 Güvenli Ödeme</h4>

                <p>256 Bit SSL Koruması</p>

            </div>

        </div>

    </div>

</section>



<script>

	let cart =
		JSON.parse(localStorage.getItem("cart")) || [];



	renderCart();



	function renderCart() {

		const cartContainer =
			document.getElementById("cartItems");



		if (cart.length == 0) {

			cartContainer.innerHTML = `

            <div class="empty-cart">

                <h2>
                    Sepetinizde Şu Anda
                    Ürün Bulunmamaktadır
                </h2>

                <p>
                    Beğendiğiniz ürünleri
                    sepete ekleyerek
                    alışverişe başlayabilirsiniz.
                </p>

            </div>

            `;



			document.getElementById("subtotal")
				.innerText = "₺0";

			document.getElementById("total")
				.innerText = "₺0";

			return;

		}



		let cartHTML = "";



		cart.forEach((item, index) => {

			cartHTML += `

            <div class="cart-item">

                <img src="${item.image}" />



                <div class="cart-info">

                    <h3>${item.name}</h3>



                    <div class="size-select">

                        <label>Beden:</label>

                        <select onchange="changeSize(${index}, this.value)">

                            <option ${item.size == "XS" ? "selected" : ""}>XS</option>
                            <option ${item.size == "S" ? "selected" : ""}>S</option>
                            <option ${item.size == "M" ? "selected" : ""}>M</option>
                            <option ${item.size == "L" ? "selected" : ""}>L</option>
                            <option ${item.size == "XL" ? "selected" : ""}>XL</option>

                        </select>

                    </div>



                    <div class="quantity">

                        <button type="button"
                        onclick="decreaseQty(${index})">

                        -

                        </button>

                        <span>${item.quantity}</span>

                        <button type="button"
                        onclick="increaseQty(${index})">

                        +

                        </button>

                    </div>



                    <h4>

                        ₺${item.price * item.quantity}

                    </h4>



                    <button type="button"
                    class="remove-btn"
                    onclick="removeItem(${index})">

                    🗑 Ürünü Sil

                    </button>

                </div>

            </div>

            `;

		});



		cartContainer.innerHTML = cartHTML;

		updateSummary();

	}



	function increaseQty(index) {

		cart[index].quantity++;

		localStorage.setItem(
			"cart",
			JSON.stringify(cart)
		);

		renderCart();

	}



	function decreaseQty(index) {

		if (cart[index].quantity > 1) {

			cart[index].quantity--;

			localStorage.setItem(
				"cart",
				JSON.stringify(cart)
			);

			renderCart();

		}
		else {

			removeItem(index);

		}

	}



	function removeItem(index) {

		cart.splice(index, 1);

		localStorage.setItem(
			"cart",
			JSON.stringify(cart)
		);

		renderCart();

	}



	function changeSize(index, value) {

		cart[index].size = value;

		localStorage.setItem(
			"cart",
			JSON.stringify(cart)
		);

	}



	function updateSummary() {

		let total = 0;

		cart.forEach(item => {

			total += item.price * item.quantity;

		});



		document.getElementById("subtotal")
			.innerText = "₺" + total;

		document.getElementById("total")
			.innerText = "₺" + total;

	}

</script>

</asp:Content>
