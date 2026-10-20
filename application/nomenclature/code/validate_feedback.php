<?php
  session_start();
  require_once('sql_functions.php');
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = (int) $_SESSION['id'];
    $comments= isset($_POST['comments']) ? $_POST['comments'] : '';
    $stoodOutDifficult = isset($_POST['stoodOutDifficult']) ? $_POST['stoodOutDifficult'] : '';
    $stoodOutEasier = isset($_POST['stoodOutEasier']) ? $_POST['stoodOutEasier'] : '';
    $namingApproach = isset($_POST['namingApproach']) ? $_POST['namingApproach'] : '';
    insertFeedback($id, $comments, $stoodOutDifficult, $stoodOutEasier, $namingApproach);
    insertTimeEvent($id, $_SESSION['uuid'], 11);
  }
  $_SESSION['page'] = "finished.php";
?>
