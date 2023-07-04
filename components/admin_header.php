<?php
   if(isset($message)){
      foreach($message as $message){
         echo '
         <div class="message">
            <span>'.$message.'</span>
            <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
         </div>
         ';
      }
   }
?>

<header class="header">

   <section class="flex">

      <a href="../admin/dashboard.php" class="logo">Admin<span>Paneli</span></a>

      <nav class="navbar">
         <a href="../admin/dashboard.php">Anasayfa</a>
         <a href="../admin/products.php">Ürünler</a>
         <a href="../admin/placed_orders.php">Siparişler</a>
         <a href="../admin/admin_accounts.php">Adminler</a>
         <a href="../admin/users_accounts.php">Kullanıclar</a>
         <a href="../admin/messages.php">Mesajlar</a>
      </nav>

      <div class="icons">
         <div id="menu-btn" class="fas fa-bars"></div>
         <div id="user-btn" class="fas fa-user"></div>
      </div>

      <div class="profile">
         <?php
            $select_profile = $conn->prepare("SELECT * FROM `admins` WHERE id = ?");
            $select_profile->execute([$admin_id]);
            $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);
         ?>
         <p><?= $fetch_profile['name']; ?></p>
         <a href="../admin/update_profile.php" class="btn">Profili Düzenle</a>
         <div class="flex-btn">
            <a href="../admin/register_admin.php" class="option-btn">Kayıt Ol</a>
            <a href="../admin/admin_login.php" class="option-btn">Giriş Yap</a>
         </div>
         <a href="../components/admin_logout.php" class="delete-btn" onclick="return confirm('Web sitesinden çıkış yapmak istediğine eminmisin?');">Çıkış Yap</a> 
      </div>

   </section>

</header>