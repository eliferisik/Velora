
<%@ Page Title="" Language="C#" 
MasterPageFile="~/velora.master"
AutoEventWireup="true"
CodeBehind="iletişim.aspx.cs"
Inherits="velorasite.iletişim" %>

<asp:Content ID="Content2" 
ContentPlaceHolderID="head" 
runat="server">

    <link href="iletisim.css" rel="stylesheet" />

</asp:Content>



<asp:Content ID="Content1" 
ContentPlaceHolderID="MainContent" 
runat="server">

<section class="contact-page">

    <div class="contact-left">

        <span class="mini-title">VELORA</span>

        <h1>Bizimle İletişime Geç</h1>

        <p>
            Sorularınız, önerileriniz veya iş birlikleri için
            bizimle iletişime geçebilirsiniz.
        </p>

        <div class="contact-info">

            <div class="info-box">
                <h3>Email</h3>
                <span>hello@velora.com</span>
            </div>

            <div class="info-box">
                <h3>Telefon</h3>
                <span>+90 555 555 55 55</span>
            </div>

            <div class="info-box">
                <h3>Instagram</h3>
                <span>@veloraofficial</span>
            </div>

        </div>

    </div>



    <div class="contact-right">

        <h2>Mesaj Gönder</h2>

        <input type="text" placeholder="Adınız" />

        <input type="email" placeholder="Email" />

        <input type="text" placeholder="Konu" />

        <textarea placeholder="Mesajınız"></textarea>

        <button type="submit">
            Gönder
        </button>

    </div>

</section>

</asp:Content>
