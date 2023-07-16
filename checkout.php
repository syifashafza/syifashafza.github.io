<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

   
if(isset($_POST['order_btn'])){

   $name = mysqli_real_escape_string($conn, $_POST['name']);
   $number = $_POST['number'];
   $email = mysqli_real_escape_string($conn, $_POST['email']);
   $method = mysqli_real_escape_string($conn, $_POST['method']);
   $address = mysqli_real_escape_string($conn, $_POST['address']);
   $member =  mysqli_real_escape_string($conn, $_POST['member']);
   $placed_on = date('d-M-Y');

   $cart_total = 0;
   $cart_products[] = '';

   $cart_query = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id = '$user_id'") or die('query failed');

   if(mysqli_num_rows($cart_query) > 0){
      while($cart_item = mysqli_fetch_assoc($cart_query)){
         $cart_products[] = $cart_item['name'].' ('.$cart_item['quantity'].') ';
         $sub_total = ($cart_item['price'] * $cart_item['quantity']);
         $cart_total += $sub_total;
      }
      if ($member == 'diskon 30%') {
         $discount = 0.3; // Diskon 30%
         $cart_total = $cart_total - ($cart_total * $discount); // Mengurangi total harga dengan diskon
      }
   }

   $total_products = implode(', ',$cart_products);

   $order_query = mysqli_query($conn, "SELECT * FROM `orders` WHERE name = '$name' AND number = '$number' AND email = '$email' AND method = '$method' AND address = '$address' AND total_products = '$total_products' AND total_price = '$cart_total' AND member = '$member' ") or die('query failed');

   if($cart_total == 0){
      $message[] = 'keranjang anda kosong ';
   }else{
      if(mysqli_num_rows($order_query) > 0){
         $message[] = 'barang sudah dimasukkan!'; 
      }else{
         mysqli_query($conn, "INSERT INTO `orders`(user_id, name, number, email, method, address, total_products, total_price, member, placed_on) VALUES('$user_id', '$name', '$number', '$email', '$method', '$address', '$total_products', '$cart_total', '$member', '$placed_on')") or die('query failed');

         //simpan keorders.txt
         $order_data = "Nama: $name\nNomor HP: $number\nEmail: $email\nAlamat: $address\nMetode Pembayaran: $method\nTotal Harga: Rp $cart_total\nMember: $member\n\n";
         
         file_put_contents('orders.txt', $order_data, FILE_APPEND);


         file_put_contents('orders.txt', $order_data, FILE_APPEND);

         $message[] = 'checkout berhasil!';
         mysqli_query($conn, "DELETE FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
      }//=============================
   }
   
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>checkout</title>

 
   
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   

<div class="heading">
   <h3>checkout</h3>
   <p> <a href="index.php">home</a> / checkout </p>
</div>

<section class="display-order">

   <?php  
      $grand_total = 0;
      $select_cart = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
      if(mysqli_num_rows($select_cart) > 0){
         while($fetch_cart = mysqli_fetch_assoc($select_cart)){
            $total_price = ($fetch_cart['price'] * $fetch_cart['quantity']);
            $grand_total += $total_price;
   ?>

   <p> <?php echo $fetch_cart['name']; ?> <span>(<?php echo 'Rp '.$fetch_cart['price'].'/-'.' x '. $fetch_cart['quantity']; ?>)</span> </p>

   <?php
      }
   }else{
      echo '<p class="empty">keranjang anda kosong</p>';
   }
   ?>


   <div class="grand-total">Total Bayar: <span>$<?php echo $grand_total; ?> </span> </div>


</section>

<section class="checkout">

   <form action="" method="post">
      <h3>place your order</h3>
      <div class="flex">
         <div class="inputBox">
            <span>Nama Lengkap :</span>
            <input type="text" name="name" required placeholder="masukkan nama">
         </div>
         <div class="inputBox">
            <span>Nomor HP :</span>
            <input type="number" name="number" required placeholder="masukkan nomor hp">
         </div>
         <div class="inputBox">
            <span>Email :</span>
            <input type="email" name="email" required placeholder="masukkan email">
         </div>
         <div class="inputBox">
            <span>Metode Pembayaran :</span>
            <select name="method">
               <option value="cash on delivery">Transfer Bank</option>
               <option value="credit card">Pay Later</option>
               <option value="paypal">paypal</option>
               <option value="shopeepay">Cash on Delivery</option>
            </select>
         </div>
         <div class="inputBox">
            <span>Alamat lengkap :</span>
            <input type="text" min="0" name="address" required placeholder="masukkan alamat">
         </div>
         <div class="inputBox">
            <span>Ingin menjadi member kami (diskon 30%) ?</span>
             <select name="member">
               <option value="diskon 30%">Ya</option>
               <option value="tanpa diskon">Tidak</option>
            </select>
         </div>
      </div>
      <input type="submit" value="order now" class="btn" name="order_btn">
      
   </form>

</section>


<?php       

      

      ?> 

<?php include 'footer.php'; ?>

 
<script src="js/script.js"></script>

</body>
</html>