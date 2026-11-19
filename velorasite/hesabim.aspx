
<%@ Page Title="" Language="C#"
MasterPageFile="~/velora.master"
AutoEventWireup="true"
CodeBehind="hesabim.aspx.cs"
Inherits="velorasite.hesabim" %>

<asp:Content ID="Content2"
ContentPlaceHolderID="head"
runat="server">

<link href="hesabim.css" rel="stylesheet" />

</asp:Content>



<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="account-page">



    <!-- HEADER -->

    <div class="account-header">

        <span>VELORA ACCOUNT</span>

        <h1>Hesabım</h1>

        <p>
            Hesap ayarlarınızı ve kişisel tercihlerinizi
            buradan yönetebilirsiniz.
        </p>

    </div>



    <!-- PROFILE -->

    <div class="profile-card">

        <div class="profile-left">

            <div class="profile-image">
                E
            </div>

            <div class="profile-info">

                <h2>Elif Erişik</h2>

                <p>veloraofficial@gmail.com</p>

            </div>

        </div>

        <button class="edit-btn">
            Profili Düzenle
        </button>

    </div>



    <!-- ACCOUNT GRID -->

    <div class="account-grid">

    <!-- ITEM -->

<div class="account-card">

    <div class="card-icon">📦</div>

    <h3>Siparişlerim</h3>

    <p>
        Sipariş geçmişinizi ve teslim durumlarını görüntüleyin.
    </p>

</div>



<!-- ITEM -->

<div class="account-card">

    <div class="card-icon">🚚</div>

    <h3>Kargo Takip</h3>

    <p>
        Kargonuzun güncel durumunu anlık olarak takip edin.
    </p>

</div>



<!-- ITEM -->

<div class="account-card">

    <div class="card-icon">⭐</div>

    <h3>Ürün & Sipariş Yorumlarım</h3>

    <p>
        Yaptığınız ürün ve sipariş değerlendirmelerini ve yorumları görüntüleyin.
    </p>

</div>


<!-- ITEM -->

<div class="account-card">

    <div class="card-icon">🛍️</div>

    <h3>Önceden Gezdiğim</h3>

    <p>
        Daha önce görüntülediğiniz ürünleri inceleyin.
    </p>

</div>



<!-- ITEM -->

<div class="account-card">

    <div class="card-icon">💎</div>

    <h3>Velora Club</h3>

    <p>
        Size özel avantajları ve premium fırsatları keşfedin.
    </p>

</div>



        <!-- ITEM -->

        <div class="account-card">

            <div class="card-icon">⚙️</div>

            <h3>Hesap Ayarlarım</h3>

            <p>
                Şifre, email ve kişisel bilgilerinizi yönetin.
            </p>

        </div>




        <!-- ITEM -->

        <div class="account-card">

            <div class="card-icon">🎟️</div>

            <h3>İndirim Kuponlarım</h3>

            <p>
                Size özel kampanyaları ve kuponları görüntüleyin.
            </p>

        </div>



        <!-- ITEM -->

        <div class="account-card">

            <div class="card-icon">🌍</div>

            <h3>Dil Değiştir</h3>

            <p>
                Site dilini istediğiniz zaman değiştirebilirsiniz.
            </p>

        </div>



        <!-- ITEM -->

        <div class="account-card">

            <div class="card-icon">🔒</div>

            <h3>Güvenlik & Gizlilik</h3>

            <p>
                Güvenlik tercihlerinizi ve gizlilik ayarlarınızı yönetin.
            </p>

        </div>



        <!-- ITEM -->

        <div class="account-card">

            <div class="card-icon">💬</div>

            <h3>Yardım Merkezi</h3>

            <p>
                Destek almak için yardım merkezini ziyaret edin.
            </p>

        </div>



        <!-- ITEM -->

        <div class="account-card">

            <div class="card-icon">❓</div>

            <h3>Sıkça Sorulan Sorular</h3>

            <p>
                En çok sorulan soruların cevaplarını inceleyin.
            </p>

        </div>



        <!-- ITEM -->

        <div class="account-card logout-card">

            <div class="card-icon">🚪</div>

            <h3>Çıkış Yap</h3>

            <p>
                Hesabınızdan güvenli şekilde çıkış yapın.
            </p>

        </div>

    </div>

</div>

</asp:Content>
