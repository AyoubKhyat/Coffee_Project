<?php
require_once 'db.php';

  if (isset($_POST['reserve'])) {
  $name = $_POST['name'];
  $number = $_POST['fnumber'];
  $date = $_POST['fdate'];

  $sql = "INSERT INTO reservation (name, number, date) VALUES ('$name',$number,'$date')";
  if (mysqli_query($conn, $sql)) {
    header("Location: index.php?MakeAppointment=success");
  } else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }
  
  } 
  use PHPMailer\PHPMailer\PHPMailer;
  use PHPMailer\PHPMailer\SMTP;
  use PHPMailer\PHPMailer\OAuth;
  //Alias the League Google OAuth2 provider class
  use League\OAuth2\Client\Provider\Google;

  require 'vendor/autoload.php';

  if($_SERVER['REQUEST_METHOD'] == 'POST' and isset($_POST['btnSend'])){
//SMTP needs accurate times, and the PHP time zone MUST be set
//This should be done in your php.ini, but this is how to do it if you don't have access to that
date_default_timezone_set('Asia/Kolkata');

//Load dependencies from composer
//If this causes an error, run 'composer install'
//Create a new PHPMailer instance
$mail = new PHPMailer();

//Tell PHPMailer to use SMTP
$mail->isSMTP();

//Enable SMTP debugging
//SMTP::DEBUG_OFF = off (for production use)
//SMTP::DEBUG_CLIENT = client messages
//SMTP::DEBUG_SERVER = client and server messages
$mail->SMTPDebug = SMTP::DEBUG_OFF;

//Set the hostname of the mail server
$mail->Host = 'smtp.gmail.com';

//Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
$mail->Port = 587;

//Set the encryption mechanism to use - STARTTLS or SMTPS
$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;

//Whether to use SMTP authentication
$mail->SMTPAuth = true;

//Set AuthType to use XOAUTH2
$mail->AuthType = 'XOAUTH2';

//Fill in authentication details here
//Either the gmail account owner, or the user that gave consent
$email = 'ayoubkhyat@gmail.com';
$clientId = '189981356940-rnui51q4efa3c2d73488j36irksuo2lm.apps.googleusercontent.com';
$clientSecret = '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';

//Obtained by configuring and running get_oauth_token.php
//after setting up an app in Google Developer Console.
$refreshToken = '1//03Wogg2ST3DaqCgYIARAAGAMSNgF-L9IrtlXGR25sMMPeVk477EEJPL71BxRt-B2ZdGUuUfGkbwmxa7L7IhvPa-G7RKV3W0-BJg';

//Create a new OAuth2 provider instance
$provider = new Google(
    [
        'clientId' => $clientId,
        'clientSecret' => $clientSecret,
    ]
);

//Pass the OAuth provider instance to PHPMailer
$mail->setOAuth(
    new OAuth(
        [
            'provider' => $provider,
            'clientId' => $clientId,
            'clientSecret' => $clientSecret,
            'refreshToken' => $refreshToken,
            'userName' => $email,
        ]
    )
);

//Set who the message is to be sent from
//For gmail, this generally needs to be the same as the user you logged in as
$mail->setFrom($email, 'Coffee Shop');

//Set who the message is to be sent to
$mail->addAddress('ayoubkhyat@gmail.com');

// if you want to send email to multiple users, then add the email addresses you which you want to send.
//$mail->addAddress('reciver2@gmail.com');
//$mail->addAddress('reciver3@gmail.com');

$mail->isHTML(true);

//Set the subject line
$mail->Subject = $_POST['subject'];

$mail->Body    = $_POST['body'] . ", Envoyé par le client :" . $_POST['email'];

//Replace the plain text body with one created manually
// $mail->AltBody = 'This is a plain-text message body';

//For Attachments
//$mail->addAttachment('/var/tmp/file.tar.gz');  // Add attachments
//$mail->addAttachment('/tmp/image.jpg', 'new.jpg'); // You can specify the file name

//send the message, check for errors
if (!$mail->send()) {
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo '<script>alert("Message sent!")</script>';
}
  }

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/Logo12.png" type="image/icon type">
    <link rel="stylesheet" href="coffee_shop.css">
    <title>Bonjourno</title>
    <!--font awesome link-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="fontawesome-free-6.0.0-web/fontawesome-free-6.0.0-web/css/all.min.css">
</head>
<body>
    <!--Header Navbar-->
    <header class="header">
        <a href="#home" class="logo">
            <img src="images/Logo1.png" alt="">
        </a>
        <nav class="navbar">
            <a href="#home">Home</a>
            <a href="#about">About Us</a>
            <a href="#menu">Menu</a>
            <a href="#reserve">Réservation</a>
            <a href="#contact">Contact Us</a>
        </nav>
        <!-- <button type="button" class="button icons icon-button theme-toggle-button">
                    <i class="bx bx-toggle-left theme-off"></i>
                    <i class="bx bx-toggle-right theme-on"></i>
                </button> -->
        <div class="icons">
            <div class="fa fa-searchs" id="btnSearch"></div>
            <div class="fa fa-shopping-cart" id="btnShop"></div>
            <div class="fa fa-bars" id="btnMenu"></div>
        </div>
        <!--Search-->
        <div class="searchForm">
            <input type="search" id="search-box" placeholder="search here...">
            <label for="search-box" class="fa fa-search"></label>
        </div>
        <!--Cart-->
        <div class="cart-items-container">
            <div id="title">
            </div>
            <!--a class="btn btncheck" id ="btncheck">CheckOut Now</a-->
            <input type="number" id="results" readonly >
        </div>
    </header>
    <!--Home--> 
    <section class="home" id="home">
        <div class="content">
            <h3>Original Taste<br>Of Coffee</h3>
            <p></p>
            <a href="#menu" class="btn">get yours now</a>
        </div>
    </section>
    <!--About Us-->
    <section class="about" id="about">
        <h1 class="heading"> <span>About</span> us </h1>
        <div class="row">
            <div class="image">
                <img src="images/1234.jpg" alt="">
            </div>    
            <div class="content">
                <h3>what makes our coffee special?</h3>
                <p>Do you love coffee drinks, but not waiting in line to shell
                    out big bucks at the coffee shop? Here you will have your own tablette-Menu to order without a server.
                    You'll find whatever slice you need here</p>
                <!--a href="#" class="btn">learn more</a-->
            </div>    
        </div>
    </section>
    <!--Menu-->
    <section class="menu" id="menu">
        <h1 class="heading"> our <span>menu</span> </h1>    
        <div class="box-container">    
            <?php
            include 'function.php';
            ?>
        </div>
    </section>
    <!--Reservation-->
    <section class="reserve" id="reserve">
        <h1 class="heading"> <span>Reserve</span> Here </h1>
        <div class="rese">
            <form action="" method="POST" id="ress">
                <div class="inputBox">
                    <span class="fas fa-user"></span>
                    <input type="text" placeholder="name" name="name" required>
                </div>
                <div class="inputBox">
                    <span class="fas fa-users"></span>
                    <input type="number" placeholder="How many person ?" name="fnumber" required>
                </div>
                <div class="inputBox">
                    <span class="fas fa-table"></span>
                    <input type="datetime-local" placeholder="Time" name="fdate" required>
                </div>
                <input type="submit" value="Reserve" name="reserve" class="btn">
            </form>
        </div>
    </section>
    <!--Contact Us-->
    <section class="contact" id="contact">
        <h1 class="heading"> <span>Contact</span> Us </h1>
        <div class="row">
            <iframe id="map" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d22188.302590312887!2d-8.061998999999998!3d31.626947999999985!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xee1e4815392d167a!2scafe%20bonjorno!5e1!3m2!1sen!2sma!4v1648815789039!5m2!1sen!2sma" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <form method="POST" action="">
                <h3>get in touch</h3>
                <div class="inputBox">
                    <span class="fas fa-user"></span>
                    <input type="text" placeholder="Name" name="name" required>
                </div>
                <div class="inputBox">
                    <span class="fas fa-envelope"></span>
                    <input type="email" id="email" placeholder="Email" name="email" required>
                </div>
                <div class="inputBox">
                    <span class="fas fa-link"></span>
                    <input type="text" placeholder="Subject" name="subject" required>

                </div>
                <div class="inputBox">
                    <span class="fas fa-message"></span>
                    <input type="text" placeholder="Message" name="body">
                </div>
                <input type="submit" value="contact now" name="btnSend" class="btn">
            </form>
                <!--a class="set-url-target" rel="noopener" data-mobile-target="" data-desktop-target="" target="" href="https://web.whatsapp.com/send?phone=212661977967"><span class="sr-only" style="height: 54px; width: 54px;">WhatsApp</span><svg class="ico_d " margin-bottom="0" width="39" height="39" viewBox="0 0 39 39" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(0deg);"><circle class="color-element" cx="19.4395" cy="19.4395" r="19.4395" fill="#49E670"></circle><path d="M12.9821 10.1115C12.7029 10.7767 11.5862 11.442 10.7486 11.575C10.1902 11.7081 9.35269 11.8411 6.84003 10.7767C3.48981 9.44628 1.39593 6.25317 1.25634 6.12012C1.11674 5.85403 2.13001e-06 4.39053 2.13001e-06 2.92702C2.13001e-06 1.46351 0.83755 0.665231 1.11673 0.399139C1.39592 0.133046 1.8147 1.01506e-06 2.23348 1.01506e-06C2.37307 1.01506e-06 2.51267 1.01506e-06 2.65226 1.01506e-06C2.93144 1.01506e-06 3.21063 -2.02219e-06 3.35022 0.532183C3.62941 1.19741 4.32736 2.66092 4.32736 2.79397C4.46696 2.92702 4.46696 3.19311 4.32736 3.32616C4.18777 3.59225 4.18777 3.59224 3.90858 3.85834C3.76899 3.99138 3.6294 4.12443 3.48981 4.39052C3.35022 4.52357 3.21063 4.78966 3.35022 5.05576C3.48981 5.32185 4.18777 6.38622 5.16491 7.18449C6.42125 8.24886 7.39839 8.51496 7.81717 8.78105C8.09636 8.91409 8.37554 8.9141 8.65472 8.648C8.93391 8.38191 9.21309 7.98277 9.49228 7.58363C9.77146 7.31754 10.0507 7.1845 10.3298 7.31754C10.609 7.45059 12.2841 8.11582 12.5633 8.38191C12.8425 8.51496 13.1217 8.648 13.1217 8.78105C13.1217 8.78105 13.1217 9.44628 12.9821 10.1115Z" transform="translate(12.9597 12.9597)" fill="#FAFAFA"></path><path d="M0.196998 23.295L0.131434 23.4862L0.323216 23.4223L5.52771 21.6875C7.4273 22.8471 9.47325 23.4274 11.6637 23.4274C18.134 23.4274 23.4274 18.134 23.4274 11.6637C23.4274 5.19344 18.134 -0.1 11.6637 -0.1C5.19344 -0.1 -0.1 5.19344 -0.1 11.6637C-0.1 13.9996 0.624492 16.3352 1.93021 18.2398L0.196998 23.295ZM5.87658 19.8847L5.84025 19.8665L5.80154 19.8788L2.78138 20.8398L3.73978 17.9646L3.75932 17.906L3.71562 17.8623L3.43104 17.5777C2.27704 15.8437 1.55796 13.8245 1.55796 11.6637C1.55796 6.03288 6.03288 1.55796 11.6637 1.55796C17.2945 1.55796 21.7695 6.03288 21.7695 11.6637C21.7695 17.2945 17.2945 21.7695 11.6637 21.7695C9.64222 21.7695 7.76778 21.1921 6.18227 20.039L6.17557 20.0342L6.16817 20.0305L5.87658 19.8847Z" transform="translate(7.7758 7.77582)" fill="white" stroke="white" stroke-width="0.2"></path></svg></a-->
        </div>    
    </section>
    <!--Footer-->
    <section class="footer">
        <div class="links">
            <a href="#home">Home</a>
            <a href="#about">About</a>
            <a href="#menu">Menu</a>
            <a href="#reserve">Réservation</a>
            <a href="#contact">Contact</a>
        </div>
        <!--div class="share">
            <a href="https://www.facebook.com/ayoub.khyat.58/" class="fab fa-facebook-f"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="https://www.instagram.com/ayoub_khyat10/" class="fab fa-instagram"></a>
            <a class="fab fa-whatsapp" rel="noopener" data-mobile-target="" data-desktop-target="" target="" href="https://web.whatsapp.com/send?phone=212625461645"><span class="sr-only" style="height: 54px; width: 54px;">WhatsApp</span><!--svg class="ico_d " width="39" height="39" viewBox="0 0 39 39" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(0deg);"><circle class="color-element" cx="19.4395" cy="19.4395" r="19.4395" fill="#49E670"></circle><path d="M12.9821 10.1115C12.7029 10.7767 11.5862 11.442 10.7486 11.575C10.1902 11.7081 9.35269 11.8411 6.84003 10.7767C3.48981 9.44628 1.39593 6.25317 1.25634 6.12012C1.11674 5.85403 2.13001e-06 4.39053 2.13001e-06 2.92702C2.13001e-06 1.46351 0.83755 0.665231 1.11673 0.399139C1.39592 0.133046 1.8147 1.01506e-06 2.23348 1.01506e-06C2.37307 1.01506e-06 2.51267 1.01506e-06 2.65226 1.01506e-06C2.93144 1.01506e-06 3.21063 -2.02219e-06 3.35022 0.532183C3.62941 1.19741 4.32736 2.66092 4.32736 2.79397C4.46696 2.92702 4.46696 3.19311 4.32736 3.32616C4.18777 3.59225 4.18777 3.59224 3.90858 3.85834C3.76899 3.99138 3.6294 4.12443 3.48981 4.39052C3.35022 4.52357 3.21063 4.78966 3.35022 5.05576C3.48981 5.32185 4.18777 6.38622 5.16491 7.18449C6.42125 8.24886 7.39839 8.51496 7.81717 8.78105C8.09636 8.91409 8.37554 8.9141 8.65472 8.648C8.93391 8.38191 9.21309 7.98277 9.49228 7.58363C9.77146 7.31754 10.0507 7.1845 10.3298 7.31754C10.609 7.45059 12.2841 8.11582 12.5633 8.38191C12.8425 8.51496 13.1217 8.648 13.1217 8.78105C13.1217 8.78105 13.1217 9.44628 12.9821 10.1115Z" transform="translate(12.9597 12.9597)" fill="#FAFAFA"></path><path d="M0.196998 23.295L0.131434 23.4862L0.323216 23.4223L5.52771 21.6875C7.4273 22.8471 9.47325 23.4274 11.6637 23.4274C18.134 23.4274 23.4274 18.134 23.4274 11.6637C23.4274 5.19344 18.134 -0.1 11.6637 -0.1C5.19344 -0.1 -0.1 5.19344 -0.1 11.6637C-0.1 13.9996 0.624492 16.3352 1.93021 18.2398L0.196998 23.295ZM5.87658 19.8847L5.84025 19.8665L5.80154 19.8788L2.78138 20.8398L3.73978 17.9646L3.75932 17.906L3.71562 17.8623L3.43104 17.5777C2.27704 15.8437 1.55796 13.8245 1.55796 11.6637C1.55796 6.03288 6.03288 1.55796 11.6637 1.55796C17.2945 1.55796 21.7695 6.03288 21.7695 11.6637C21.7695 17.2945 17.2945 21.7695 11.6637 21.7695C9.64222 21.7695 7.76778 21.1921 6.18227 20.039L6.17557 20.0342L6.16817 20.0305L5.87658 19.8847Z" transform="translate(7.7758 7.77582)" fill="white" stroke="white" stroke-width="0.2"></path></svg></a>
            <a href="#" class="fab fa-linkedin"></a>
            <a href="https://www.pinterest.com" class="fab fa-pinterest"></a>
        </div-->
        <div class="credit">created by &copy;<span><a href="http://ayoubkhyat.ga/?i=1" target="blank">Ayoub Khyat</a></span>&copy; |&copy; All Rights Reserved &copy;</div>
    </section>
    <!--Js script-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="coffee_shop.js"></script>
    <script src="https://smtpjs.com/v3/smtp.js"></script>
</body>
</html>