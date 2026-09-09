<?php
  session_start();
  require_once('sql_functions.php');
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = (int) $_SESSION['id'];
    $totalxp = filter_var($_POST['totalxp'] , FILTER_VALIDATE_INT);
    $jobxp = filter_var($_POST['jobxp'] , FILTER_VALIDATE_INT);
    $education = filter_var($_POST['education'] , FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $institution = filter_var($_POST['institution'] , FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $major = filter_var($_POST['major'] , FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $degree = filter_var($_POST['degree'] , FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $year = filter_var($_POST['year'] , FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $gpa = filter_var($_POST['gpa'] , FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $origin = filter_var($_POST['origin'] , FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $language = filter_var($_POST['language'] , FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $fluency = filter_var($_POST['fluency'] , FILTER_VALIDATE_INT);
    error_log("fluency: " . $fluency);
    if (empty($fluency)) {
      $fluency = -1;
    }
    error_log("fluency2: " . $fluency);
	
    $disclosed = filter_var($_POST['disclosed'] , FILTER_VALIDATE_INT);
	
	error_log("disclosed: " . $disclosed);
	
	
	$attentionDeficit = isset($_POST['attentionDeficit']) ? 1 : 0;
    $autism = isset($_POST['autism']) ? 1 : 0;
    $blind = isset($_POST['blind']) ? 1 : 0;
    $deaf = isset($_POST['deaf']) ? 1 : 0;
    $health = isset($_POST['health']) ? 1 : 0;
    $learning = isset($_POST['learning']) ? 1 : 0;
    $mentalHealth = isset($_POST['mentalHealth']) ? 1 : 0;
    $mobility = isset($_POST['mobility']) ? 1 : 0;
    $speech = isset($_POST['speech']) ? 1 : 0;
    $other = isset($_POST['other']) ? 1 : 0;
	if(array_key_exists('otherDescription',$_POST)) {
		$otherDescription = filter_var($_POST['otherDescription'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
		if(empty($otherDescription)){
			$otherDescription="";
		}
		error_log("otherDescription: " . $otherDescription);
	}
	else {
		$otherDescription="";
	}
    $_SESSION['year'] = $year;
    $uuid = $_SESSION['uuid'];
    insertSurvey1($id, $uuid, $totalxp, $jobxp, $education, $institution, $major, $degree, $year, $gpa, $origin, $language, $fluency, $disclosed, $attentionDeficit, $autism, $blind, $deaf, $health, $learning, $mentalHealth, $mobility, $speech, $other, $otherDescription);
    
    insertTimeEvent($_SESSION['id'], $_SESSION['uuid'], 4);

    $_SESSION['page'] = "survey_2.php";
    header("Location: ../survey_2.php");
  }
?>
