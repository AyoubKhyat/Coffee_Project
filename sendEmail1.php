<?php
    require_once "PHPMailer-master/src/PHPMailer.php";
    require_once "PHPMailer-master/src/SMTP.php";
    require_once "PHPMailer-master/src/Exception.php";

    use PHPMailer\PHPMailer\PHPMailer;

    if ( isset($_POST['name']) && isset($_POST['email'])) {
        $name = $_POST['name'];
        $email = $_POST['email'];
        $subject = $_POST['subject'];
        $body = $_POST['body'];


        $mail = new PHPMailer();

        //SMTP Settings
        $mail->isSMTP();
        $mail->Host = "smtp.gmail.com";
        $mail->SMTPAuth = true;
        $mail->Username ="mmahrar011@gmail.com";
        $mail->Password = 'ayoub2002';
        $mail->Port = 465; //587
        $mail->SMTPSecure = "ssl"; //tls

        //Email Settings
        $mail->isHTML(true);
        $mail->setFrom($email, $name);
        $mail->addAddress("ayoubkhyat@gmail.com");
        $mail->Subject = $subject;
        $mail->Body ="From: ". $email ."<br>".$body;

        if ($mail->send()) {
            header("Location: index.php#home");
            $status = "success";
            $response = "Email is sent!";   
        } else {
            $status = "failed";
            $response = "Something is wrong: <br><br>" . $mail->ErrorInfo;
        }
       
    }
?>
