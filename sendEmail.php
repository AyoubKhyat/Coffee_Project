<?php
    
  
    

    if (isset($_POST['email'])) {
        $email = $_POST['email'];
        $subject = $_POST['subject'];
        $body = $_POST['Message'];

        $to      = 'ayoubkhyat@gmail.com';
        $subject1 = $subject;
        $message = $body;
        $headers = 'From:'.$email . "\r\n" .
        'Reply-To:'.$email . "\r\n" .
        'X-Mailer: PHP/' . phpversion();

        mail($to, $subject1, $message, $headers);

        if ($mail->send()) {
            $status = "success";
            $response = "Email is sent!";
        } else {
            $status = "failed";
            $response = "Something is wrong: <br><br>" . $mail->ErrorInfo;
        }
        echo $status ." ".$response;
    }
?>
