<link rel="stylesheet" href="css/style.css">
<h3>mvc is working</h3>
<?= "<h3>" . $data["title"] . "</h3>"; ?>
<?= "<h3>" . APPROOT . "</h3>"; ?>
<?= "<a href='" . URLROOT . "/pages/about'>about</a>"; ?>

<?php 
  var_dump($data['users']);
  foreach ($data['users'] as $key => $user) {
    echo $key . " | " . $user->user_id . "<br>";
  }
?>
