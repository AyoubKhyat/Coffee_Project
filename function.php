<?php
    include "db.php";
    $strSQL = "SELECT * FROM product ";

    global $conn;
    $rs = mysqli_query($conn,$strSQL);
     
        while($row = mysqli_fetch_array($rs)) {
            $name = $row['Name'];
            $price = $row['price'];
            $image = $row['image'];
            echo '<div class="box" id="item1">
            <img src="images/'.$image.'">
            <h3>'. $name .'</h3>
            <div class="price">'. $price .'</div>
            <button href="#" class="btn btnCart" >add to cart</button>
            </div>';
        }
    

?>