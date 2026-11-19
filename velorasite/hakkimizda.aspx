
<%@ Page Title="" Language="C#" 
MasterPageFile="~/velora.master"
AutoEventWireup="true"
CodeBehind="hakkimizda.aspx.cs"
Inherits="velorasite.hakkimizda" %>



<asp:Content ID="Content2"
ContentPlaceHolderID="head"
runat="server">

    <link href="hakkimizda.css" rel="stylesheet" />

</asp:Content>



<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<section class="about-hero">

    <div class="about-left">

        <span class="mini-title">
            VELORA
        </span>

        <h1>
            Zamansız Şıklığın
            Yeni Yorumu
        </h1>

        <p>
            Velora, minimalist moda anlayışını
            premium detaylarla birleştiren
            modern bir moda markasıdır.

            Kaliteli kumaşlar, sade çizgiler ve
            zamansız tasarımlar ile
            herkesin kendini özel hissetmesini amaçlar.
        </p>

      <button type="button"
onclick="window.location.href='Default.aspx'">

    Koleksiyonu Keşfet

</button>
    </div>



    <div class="about-right">

        <img src="images/hakkimizda.png" />

    </div>

</section>



<section class="about-cards">

    <div class="about-card">

        <h3>✨ Premium Kalite</h3>

        <p>
            Her ürünümüzde kaliteli kumaş ve
            özenli işçilik kullanıyoruz.
        </p>

    </div>



    <div class="about-card">

        <h3>🖤 Minimal Tasarım</h3>

        <p>
            Sade ama güçlü tasarımlarla
            zamansız görünüm sunuyoruz.
        </p>

    </div>



    <div class="about-card">

        <h3>📦 Hızlı Teslimat</h3>

        <p>
            Siparişlerinizi güvenli ve hızlı
            şekilde ulaştırıyoruz.
        </p>

    </div>

</section>



<section class="about-bottom">

    <h2>
        Velora ile Stilini Yeniden Keşfet
    </h2>

    <p>
        Modanın sadece görünüş değil,
        bir his olduğuna inanıyoruz.

        Her koleksiyonumuzda modern,
        özgüvenli ve premium bir deneyim
        sunmayı hedefliyoruz.
    </p>

</section>

</asp:Content>

