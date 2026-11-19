
<%@ Page Title="" Language="C#" 
MasterPageFile="~/velora.master"
AutoEventWireup="true"
CodeBehind="login.aspx.cs"
Inherits="velorasite.login" %>

<asp:Content ID="Content2"
    ContentPlaceHolderID="head"
    runat="server">

    <link href="login.css" rel="stylesheet" />

</asp:Content>



<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

<div class="box">

    <div class="tabs">

        <button type="button"
            class="active"
            onclick="showLogin()">

            Giriş Yap

        </button>

        <button type="button"
            onclick="showRegister()">

            Kayıt Ol

        </button>

    </div>



    <!-- LOGIN -->
    <div id="loginForm" class="form active">

        <input type="email"
            id="loginEmail"
            placeholder="Email" />

        <span class="error" id="loginEmailError"></span>



        <input type="password"
            id="loginPassword"
            placeholder="Şifre" />

        <span class="error" id="loginPasswordError"></span>



        <button class="submit"
            type="button"
            onclick="validateLogin()">

            Giriş Yap

        </button>

        <div class="links">

            <a href="#">
                Şifrenizi mi unuttunuz?
            </a>

        </div>

    </div>



    <!-- REGISTER -->
    <div id="registerForm" class="form">

        <input type="text"
            id="registerName"
            placeholder="Ad Soyad"/>

        <span class="error" id="registerNameError"></span>



        <input type="email"
            id="registerEmail"
            placeholder="Email"/>

        <span class="error" id="registerEmailError"></span>



        <input type="password"
            id="registerPassword"
            placeholder="Şifre"/>

        <span class="error" id="registerPasswordError"></span>



        <input type="password"
            id="registerPasswordAgain"
            placeholder="Şifre Tekrar"/>

        <span class="error" id="registerPasswordAgainError"></span>



        <button class="submit"
            type="button"
            onclick="validateRegister()">

            Kayıt Ol

        </button>

        <div class="links">

            <a href="#"
                onclick="showLogin()">

                Zaten hesabın var mı?
                Giriş Yap

            </a>

        </div>

    </div>

</div>



<script>

	function showLogin() {

		document.getElementById("loginForm")
			.classList.add("active");

		document.getElementById("registerForm")
			.classList.remove("active");
	}



	function showRegister() {

		document.getElementById("registerForm")
			.classList.add("active");

		document.getElementById("loginForm")
			.classList.remove("active");
	}



	function validateLogin() {

		let email =
			document.getElementById("loginEmail").value;

		let password =
			document.getElementById("loginPassword").value;

		let emailError =
			document.getElementById("loginEmailError");

		let passwordError =
			document.getElementById("loginPasswordError");

		emailError.innerHTML = "";
		passwordError.innerHTML = "";

		let valid = true;



		if (email.trim() === "") {

			emailError.innerHTML =
				"Email alanı boş bırakılamaz";

			valid = false;
		}

		else if (!email.includes("@")) {

			emailError.innerHTML =
				"Geçerli bir email girin";

			valid = false;
		}



		if (password.trim() === "") {

			passwordError.innerHTML =
				"Şifre boş bırakılamaz";

			valid = false;
		}

		else if (password.length < 6) {

			passwordError.innerHTML =
				"Şifre en az 6 karakter olmalı";

			valid = false;
		}



		if (valid) {

			alert("Giriş başarılı 😄");
		}
	}



	function validateRegister() {

		let name =
			document.getElementById("registerName").value;

		let email =
			document.getElementById("registerEmail").value;

		let password =
			document.getElementById("registerPassword").value;

		let passwordAgain =
			document.getElementById("registerPasswordAgain").value;



		let nameError =
			document.getElementById("registerNameError");

		let emailError =
			document.getElementById("registerEmailError");

		let passwordError =
			document.getElementById("registerPasswordError");

		let passwordAgainError =
			document.getElementById("registerPasswordAgainError");



		nameError.innerHTML = "";
		emailError.innerHTML = "";
		passwordError.innerHTML = "";
		passwordAgainError.innerHTML = "";

		let valid = true;



		if (name.trim() === "") {

			nameError.innerHTML =
				"Ad Soyad boş bırakılamaz";

			valid = false;
		}



		if (email.trim() === "") {

			emailError.innerHTML =
				"Email boş bırakılamaz";

			valid = false;
		}

		else if (!email.includes("@")) {

			emailError.innerHTML =
				"Geçerli bir email girin";

			valid = false;
		}



		if (password.trim() === "") {

			passwordError.innerHTML =
				"Şifre boş bırakılamaz";

			valid = false;
		}

		else if (password.length < 6) {

			passwordError.innerHTML =
				"Şifre en az 6 karakter olmalı";

			valid = false;
		}



		if (passwordAgain.trim() === "") {

			passwordAgainError.innerHTML =
				"Şifre tekrar alanı boş bırakılamaz";

			valid = false;
		}

		else if (password !== passwordAgain) {

			passwordAgainError.innerHTML =
				"Şifreler uyuşmuyor";

			valid = false;
		}



		if (valid) {

			alert("Kayıt olundu 😄");

			showLogin();
		}
	}

</script>

</asp:Content>