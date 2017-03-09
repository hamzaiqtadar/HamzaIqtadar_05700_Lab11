<?php


  $db = mysqli_connect("localhost", "root", "seecs@123");  
  mysqli_select_db($db,"lab11");

if (isset($_POST['username']) && isset($_POST['password'])){
$username=$_POST["username"];
$password=$_POST["password"];


$result = mysqli_query($db,"SELECT * FROM lab11.user WHERE email='$username'") ;
            if(mysqli_num_rows($result) ==1 ){
//                echo "ok";
            $response['results']=array();
    		$row = mysqli_fetch_array($result);
            $product=array();
    		$product['id']=$row['id'];
    		$product['name']=$row['fullname'];
            $product['email']=$row['email'];
            $product['role']=$row['role'];
            $product['pass']=$row['pass'];
    		array_push($response['results'],$product);
    		
                $sid=$product['id'];
        
        if($password==$product['pass'])
        {
            if($product['role']=="teacher")
            {
                echo "You are a teacher but you cannot take attendance just yet!!!";   
            }
            else
            {
                ?>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Student Portal</title>
        <style>
            #div1
            {
                width: 48%;
                float: left;
                text-align:right;
                padding-right: 5px;
                margin-right: 5px;
            }
            #div2
            {
                width: 51%;
                float: left;
                text-align:left;
                
            }
        </style>
    </head>
    <body>
        <center>
            <hr>
            <h1>STUDENT ATTENDANCE PORTAL</h1>
            <hr>
            <div id="div1">
                <h3>Session No.</h3>
            </div>
            <div id="div2">
                <h3>Attendance</h3>
            </div>
            <hr>
            <div id="div3">
        
                <?php
                $result = mysqli_query($db,"SELECT * FROM lab11.attendance WHERE studentid='$sid' ORDER BY classid") ;
                 if(mysqli_num_rows($result) >=0 ){
            $response['results']=array();
            while($row = mysqli_fetch_array($result)){
            $product=array();
    		$product['id']=$row['id'];
    		$product['classid']=$row['classid'];
            $product['ispresent']=$row['isPresent'];
            $product['comments']=$row['comments'];
    		array_push($response['results'],$product);
                     
                    echo $product['classid'];
                    echo " : ";
                    if($product['ispresent']==1)
                    {
                        echo "Present";
                    }
                    else echo "Absent";
                    echo "<br>";
            }
            }
                ?>
            </div>
        </center>
    </body>
</html>

                <?php
            }
        }
        else echo"Login credentials incorrect.";
            
            }
    else echo "more than 1";

}
else echo "error";
?>