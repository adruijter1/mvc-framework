<link rel="stylesheet" href="css/style.css">

<?php 
  foreach ($data['users'] as $key => $user) {
    echo $user->user_id . " | " . $user->user_name . " | " . $user->user_email . " | " . $user->password."<br>";
  }
?>
