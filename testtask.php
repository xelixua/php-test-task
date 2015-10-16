<?php 
    $db = mysqli_connect("127.0.0.1", "sergeymaksimenko", "", "c9");
    $db->set_charset("utf8");
    
    //fetching localization
    $culture = $_POST['lang'];
    $query = "SELECT name, value FROM localization WHERE culture='$culture'";
    $res = $db->query($query, MYSQLI_USE_RESULT);
    while($row = $res->fetch_array())
    {
        $locs[$row["name"]] = $row["value"];
    }
    //required register information
    $probable_login = $_POST['login'];
    $probable_password = $_POST['password'];
    $probable_email = $_POST['email'];
    $dataType = $_POST['dataType'];
    $login_regexp = '/^[a-zA-Z0-9]+$/';
    $password_regexp = '/^[a-zA-Z0-9-_.!@#$%^*()+=;:,.\/?\\|`~\[\]{}.]+$/';
    $email_regexp = '/^[a-zA-Z0-9-_.]+@[0-9a-zA-Z-_]+[.][a-zA-Z]+$/';
    $datatype_regexp = '/^[a-zA-Z]+$/';
    $wrongData = false;
    
    //print page header
    echo "<!DOCTYPE html>
          <html lang=\"en\">
          <head>
          <meta charset=\"utf-8\">
          <title>Test task</title>
          </head>
          <body>";
    
    if ($db->connect_errno) {
        //"Cannot connect to MySQL"
        echo $locs["CNTCONDB"]. $mysqli->connect_error;
        //"Goto login form"
        echo "<a href=\"https://test-task-sergeymaksimenko-1.c9.io/testtask.html\">".$locs["GOTOLOGN"]."</a>";
    }
    
    //validating data
    if(!(preg_match($login_regexp, $probable_login) && preg_match($password_regexp, $probable_password) 
            && (preg_match($email_regexp, $probable_email) || $dataType === "login"))){
        //"Wrong user data"
        echo '<p>'.$locs["WRUSERDT"].'</p>';
        echo "<a href=\"https://test-task-sergeymaksimenko-1.c9.io/testtask.html\">".$locs["GOTOLOGN"]."</a>";
        $wrongData = true;    
    }
    
    if(!preg_match($datatype_regexp, $dataType)){
        echo '<p>'.$locs["WRSERVDT"].'</p>';
        echo "<a href=\"https://test-task-sergeymaksimenko-1.c9.io/testtask.html\">".$locs["GOTOLOGN"]."</a>";
        exit;
    }
    
    $login = $probable_login;
    $password = $probable_password;
    $email = $probable_email;
    
    if(!$wrongData){
        //do we need to check logging in user or store new user?
        if($dataType === "login"){ 
            //user is logging in
            $query = "SELECT password, photoname FROM users WHERE login='$probable_login' LIMIT 1";
            $res = $db->query($query, MYSQLI_USE_RESULT);
            if (!$res) {
                echo $locs["CNTCONDB"] . mysql_error();
                $wrongData = true;
            }
            /*if ($res->num_rows == 0) {
                echo "<p>".$locs["NOLOGIN0"]."</p>";
                $wrongData = true;
            }*/
            $row = $res->fetch_assoc();
            $truePassword = $row["password"];
            if($password === $truePassword){
                //show user profile
                $photoName = $row["photoname"];
                echo $locs["YPROFILE"];
                echo "<p>$login</p><img width=\"200\" height=\"300\" src=\"usersPhoto/"."$photoName\">";
            } else {
                echo "<p>".$locs["WRLOGNDT"]."</p>";
                echo "<a href=\"https://test-task-sergeymaksimenko-1.c9.io/testtask.html\">".$locs["GOTOLOGN"]."</a>";
            }
        } else {
            //user is registering
            $imageinfo = getimagesize($_FILES['userfile']['tmp_name']);
            if($imageinfo['mime'] != "image/gif" && $imageinfo['mime'] != "image/jpeg" && $imageinfo['mime'] != "image/png") {
                echo "<p>".$locs["IMGALLWD"]."</p>";
                echo "<a href=\"https://test-task-sergeymaksimenko-1.c9.io/testtask.html\">".$locs["GOTOLOGN"]."</a>";
            } else {
                $uploaddir = 'usersPhoto/';
                $extension = substr($_FILES['userfile']['name'], -4);
                $newFilename = mt_rand(1000000, 1999999).$extension;
                $uploadfile = $uploaddir . basename($newFilename);
                if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
                    echo "<p>".$locs["FILELDED"]."</p>\n";
                } else {
                    echo "<p>".$locs["BADFILE0"]."</p>\n";
                }
                echo "<p>".$locs["REGISTRD"]."</p>";
                echo "<a href=\"https://test-task-sergeymaksimenko-1.c9.io/testtask.html\">".$locs["GOTOLOGN"]."</a>";
                $query = "INSERT INTO users (login, password, email, photoname) VALUES ('$login','$password','$email','$newFilename')";
                $res = $db->query($query, MYSQLI_USE_RESULT);
            }
        }
    }
    echo "</body></html>";
    $db->close()
?>