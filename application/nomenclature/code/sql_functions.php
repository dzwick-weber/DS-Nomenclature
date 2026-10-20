<?php
  //require_once('config.php');  //$server, $user, $pwd, $db, $conn;
  $conn = null;
  if (!$conn) {
	$conn = connect();
  }
  function connect() {
    $servername = $servername = $_ENV["MYSQL_NAME"] . ":" . $_ENV["MYSQL_PORT"];
    $dbname = $_ENV["MYSQL_DATABASE"];
    $username = $_ENV["MYSQL_USER"];
    $password = $_ENV["MYSQL_PASSWORD"];
    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        return NULL;
    }
  }
  function disconnect() {
    global $conn;
    $conn = null;
  }
  
  function setLanguage($id, $lang) {
    global $conn;
    $sql = "UPDATE participants SET lang='".$lang."' WHERE id ='".$id."'";
    $conn->exec($sql);
  }
  function getNextLanguage($year) {
    global $conn;
    $sql = "SELECT nextLanguage FROM language WHERE year ='".$year."'";
    $query = $conn->query($sql);
    $result = $query->fetch();
    return $result['nextLanguage'];
  }

  function getAssignedLanguages($year) {
    global $conn;
    $sql = "SELECT Lang1, Lang2, Lang3 FROM language WHERE year=:year";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':year' => $year));
    $langs= $statement->fetch();
    return $langs;
  }
  
 function resetAllLanguages($year) {
    global $conn;
    $sql = "UPDATE language SET Lang1 = 0, Lang2 = 0, Lang3 = 0 WHERE year=:year";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':year' => $year));
  }

 function updateLang1($year) {
    global $conn;
    $sql = "UPDATE language SET Lang1 = 1 WHERE year=:year";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':year' => $year));
  }

 function updateLang2($year) {
    global $conn;
    $sql = "UPDATE language SET Lang2 = 1 WHERE year=:year";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':year' => $year));
  }

  function updateLang3($year) {
    global $conn;
    $sql = "UPDATE language SET Lang3 = 1 WHERE year=:year";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':year' => $year));
  }


  function setNextLanguage($year, $nextLanguage) {
    global $conn;
    $sql = "UPDATE language SET nextLanguage='".$nextLanguage."' WHERE year='".$year."'";
    $conn->exec($sql);
  }
  
  function insertTimeEvent($id, $uuid, $num) {
    global $conn;
    $sql = "INSERT INTO events (id, uuid, event) VALUES (:id, :uuid, :event)";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':id' => $id, ':uuid' => $uuid, ':event' => $num));
  }
  function insertTimeEventSurvey($id, $uuid, $num) {
    global $conn;
    $sql = "INSERT INTO events (id, uuid, event) VALUES (:id, :uuid, :event)";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':id' => $id, ':uuid' => $uuid, ':event' => $num));
}

  function insertUser($email) {
    global $conn;
    $sql = "INSERT INTO participants (email) VALUES (:email)";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':email' => $email));
    return getID($email);
  }
  function duplicateEmail($email) {
    global $conn;
    $sql = "SELECT id FROM participants WHERE email=:email";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':email' => $email));
    return ($statement->rowCount() > 0) ? true : false;
  }
  function getID($email) {
    global $conn;
    $sql = "SELECT id FROM participants WHERE email=:email";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':email' => $email));
    $participant = $statement->fetch();
    error_log("Participant ID check: ". $participant['id']);
    return $participant['id'];
  }
  function getCreditInfo($id) {
    global $conn;
    $sql = "SELECT name, courseNum, courseName, instructor FROM participants WHERE id='".$id."'";
    $query = $conn->query($sql);
    $participant = $query->fetch();
    return $participant;
  }
  function getFileName($id, $task, $group, $tries) {
    return $id."_".$task."_".$group."_".$tries.".cu";
  }
  function insertCodeEvent($id, $uuid, $event, $task, $entry, $output) {
    global $conn;
    $sql = "INSERT INTO events (id, uuid, event, task, entry, output) VALUES (:id,:uuid,:event,:task,:entry,:output)";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':id' => $id, ':uuid' => $uuid, ':event' => $event, ':task' => $task, ':entry' => $entry, ':output' => $output));
  }

  function insertSurveyEvent($id, $uuid, $event, $task, $unfilled = 0) {
    global $conn;
    $sql = "INSERT INTO events (id, uuid, event, task, entry) VALUES (:id, :uuid, :event, :task, :entry)";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':id' => $id, ':uuid' => $uuid,':event' => $event, ':task' => $task, ':entry' => $unfilled));
  }


  function duplicateExtraSurvey ($uuid, $qid) {
    global $conn;
    $sqlsel = "SELECT value FROM extrasurvey WHERE uuid=:uuid AND qid=:qid";
    $statementsel = $conn->prepare($sqlsel);
    $statementsel->execute(array(':uuid' => $uuid, ':qid' => $qid));

    return ($statementsel->rowCount() > 0) ? true : false;
  }
  function insertExtraSurvey($uuid, $qid, $option, $value) {
    global $conn;
    $sql = "INSERT INTO extrasurvey (uuid, qid, optionname, value) VALUES (:uuid,:qid,:option,:value)";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':uuid' => $uuid, ':qid' => $qid, ':option' => $option, ':value' => $value));
  }

  function insertSampleSwitchEvent($id, $uuid, $event, $task, $entry) {
    global $conn;
    $sql = "INSERT INTO events (id, uuid, event, task, entry) VALUES (:id,:uuid,:event,:task,:entry)";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':id' => $id, ':uuid' => $uuid, ':event' => $event, ':task' => $task, ':entry' => $entry ));
  }

  function insertTaskTimeEvent($id, $uuid, $event, $task) {
    global $conn;
    $sql = "INSERT INTO events (id, uuid, event, task) VALUES (:id, :uuid, :event, :task)";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':id' => $id, ':uuid' => $uuid, ':event' => $event, ':task' => $task));
  }

  function insertSurvey1($id, $uuid, $totalxp, $jobxp, $dataCourses, $education, $institution, $major, $degree, $year, $gpa, $origin, $language, $fluency, $disclosed, $attentionDeficit, $autism, $blind, $deaf, $health, $learning, $mentalHealth, $mobility, $speech, $other, $otherDescription) {
    global $conn;
    
	$sql = "INSERT INTO survey ";
    $sql .= "(id, uuid, totalxp, jobxp, dataCourses, education, institution, major, degree, year, gpa, origin, language, fluency, disclosed, attentionDeficit, autism, blind, deaf, health, learning, mentalHealth, mobility, speech, other, otherDescription)";
    $sql .= " VALUES ( :id, :uuid, :totalxp, :jobxp, :dataCourses, :education, :institution, :major, :degree, :year, :gpa, :origin, :language, :fluency, :disclosed, :attentionDeficit, :autism, :blind, :deaf, :health, :learning, :mentalHealth, :mobility, :speech, :other, :otherDescription)";
    
	$statement = $conn->prepare($sql);
    $statement->execute(array(
      ':id' => $id,
      ':uuid' => $uuid,
      ':totalxp' => $totalxp,
      ':jobxp' => $jobxp,
      ':dataCourses' => $dataCourses,
      ':education' => $education,
      ':institution' => $institution,
      ':major' => $major,
      ':degree' => $degree,
      ':year' => $year,
      ':gpa' => $gpa,
      ':origin' => $origin,
      ':language' => $language,
      ':fluency' => $fluency,
      ':disclosed' => $disclosed,
	  ':attentionDeficit' => $attentionDeficit,
	  ':autism' => $autism,
	  ':blind' => $blind,
	  ':deaf' => $deaf,
	  ':health' => $health,
	  ':learning' => $learning,
	  ':mentalHealth' => $mentalHealth,
	  ':mobility' => $mobility,
	  ':speech' => $speech,
	  ':other' => $other,
	  ':otherDescription' => $otherDescription
    ));
  }

  function insertSurvey2($id, $age, $gender, $internxp, $lang1, $lang2, $lang3, $lang4, $lang5, $lang6, $lang7, $lang8, $lang9, $lang10, $lang11, $lang12, $lang13, $lang14, $lang15, $lang16, $lang17, $lang18, $lang19, $lang20, $lang21, $lang22, $lang23, $lang24, $lang25, $lang26, $lang27, $lang28, $lang29, $course1, $course2, $course3, $course4, $course5, $course6, $course7, $course8, $course9, $course10, $course11, $course12, $course13, $course14, $course15, $course16, $course17, $course18, $course19, $course20, $course21, $course22, $course23, $course24) {
    
	global $conn;
    $sql =  "UPDATE survey ";
    $sql .= "SET ";
      $sql .= "age= :age, gender= :gender, internxp= :internxp, ";
      $sql .= "lang1= :lang1, lang2= :lang2, lang3= :lang3, lang4= :lang4, lang5= :lang5, ";
      $sql .= "lang6= :lang6, lang7= :lang7, lang8= :lang8, lang9= :lang9, lang10= :lang10, ";
      $sql .= "lang11= :lang11, lang12= :lang12, lang13= :lang13, lang14= :lang14, lang15= :lang15, ";
      $sql .= "lang16= :lang16, lang17= :lang17, lang18 = :lang18, lang19 = :lang19, lang20 = :lang20, lang21= :lang21, ";
      $sql .= "lang22= :lang22, lang23= :lang23, lang24= :lang24, ";
      $sql .= "lang25= :lang25, lang26= :lang26, lang27= :lang27, lang28= :lang28, lang29 = :lang29, ";
      $sql .= "course1= :course1, course2= :course2, course3= :course3, course4= :course4, course5= :course5, ";
      $sql .= "course6= :course6, course7= :course7, course8= :course8, course9= :course9, course10= :course10, ";
      $sql .= "course11= :course11, course12= :course12, course13= :course13, course14= :course14, course15= :course15, ";
      $sql .= "course16= :course16, course17= :course17, course18= :course18, course19= :course19, ";
      $sql .= "course20= :course20, course21= :course21, course22= :course22, course23= :course23, course24= :course24 ";
    $sql .= "WHERE id= :id";

    $arr = array(
      ':age' =>  intval($age, 10),
      ':gender' => $gender,
      ':internxp' => $internxp,
      ':lang1' => $lang1,
      ':lang2' => $lang2,
      ':lang3' => $lang3,
      ':lang4' => $lang4,
      ':lang5' => $lang5,
      ':lang6' => $lang6,
      ':lang7' => $lang7,
      ':lang8' => $lang8,
      ':lang9' => $lang9,
      ':lang10' => $lang10,
      ':lang11' => $lang11,
      ':lang12' => $lang12,
      ':lang13' => $lang13,
      ':lang14' => $lang14,
      ':lang15' => $lang15,
      ':lang16' => $lang16,
      ':lang17' => $lang17,
      ':lang18' => $lang18,
      ':lang19' => $lang19,
      ':lang20' => $lang20,
      ':lang21' => $lang21,
      ':lang22' => $lang22,
      ':lang23' => $lang23,
      ':lang24' => $lang24,
      ':lang25' => $lang25,
      ':lang26' => $lang26,
      ':lang27' => $lang27,
      ':lang28' => $lang28,
      ':lang29' => $lang29,
      ':course1' => $course1,
      ':course2' => $course2,
      ':course3' => $course3,
      ':course4' => $course4,
      ':course5' => $course5,
      ':course6' => $course6,
      ':course7' => $course7,
      ':course8' => $course8,
      ':course9' => $course9,
      ':course10' => $course10,
      ':course11' => $course11,
      ':course12' => $course12,
      ':course13' => $course13,
      ':course14' => $course14,
      ':course15' => $course15,
      ':course16' => $course16,
      ':course17' => $course17,
      ':course18' => $course18,
      ':course19' => $course19,
      ':course20' => $course20,
      ':course21' => $course21,
      ':course22' => $course22,
      ':course23' => $course23,
      ':course24' => $course24,
      ':id' => $id);
	  
    $statement = $conn->prepare($sql);
    $statement->execute($arr);

  }
  function insertCredit($id, $name, $courseNum, $courseName, $instructor) {
    global $conn;
    $sql = "UPDATE participants SET ";
    $sql .= "name=:name,";
    $sql .= "courseNum=:courseNum,";
    $sql .= "courseName=:courseName,";
    $sql .= "instructor=:instructor";
    $sql .= " WHERE id=:id";
    $statement = $conn->prepare($sql);
    $statement->execute(array(':name' => $name, ':courseNum' => $courseNum, ':courseName' => $courseName, ':instructor' => $instructor, ':id' => $id));
  }
  function insertFeedback($id, $comments, $stoodOutDifficult, $stoodOutEasier, $namingApproach = "") {
    global $conn;
    $sql = "UPDATE survey SET ";
    $sql .= "stoodOutDifficult=:stoodOutDifficult, ";
    $sql .= "stoodOutEasier=:stoodOutEasier, ";
    $sql .= "namingApproach=:namingApproach, ";
    $sql .= "comments=:comments ";
    $sql .= " WHERE id=:id";
    $statement = $conn->prepare($sql);
    $statement->execute(array(
      ':stoodOutDifficult' => $stoodOutDifficult, 
      ':stoodOutEasier' => $stoodOutEasier, 
      ':namingApproach' => $namingApproach, 
      ':comments' => $comments, 
      ':id' => $id
    ));
  }
  
  function insertTaskResponse($uuid, $task_order, $test_id, $method_order, $method_id, $response, $max) {
	  global $conn;
	  $sql = "INSERT INTO task_response ";
    $sql .= "(uuid, task_order, test_id, method_order, method_id, response, max)";
    $sql .= " VALUES (:uuid, :task_order, :test_id, :method_order, :method_id, :response, :max)";
    
	$statement = $conn->prepare($sql);
    $statement->execute(array(
      ':uuid' => $uuid,
      ':task_order' => $task_order,
      ':test_id' => $test_id,
	  ':method_order' => $method_order,
      ':method_id' => $method_id,
      ':response' => $response,
	  ':max' => $max
    ));
  }
  
  

  function getTests() {
    global $conn;
	
    $sql = "SELECT test_id FROM test";
    $query = $conn->query($sql);
    $result = $query->fetchAll();
	
	$tests = array();
	
	foreach($result as $row) {
		$tests[] = $row['test_id'];
	}
    return $tests;
  }
  
  function getTestPhrase($test_id) {
    global $conn;
    $sql = "SELECT phrase FROM test WHERE test_id='".$test_id."'";
    $query = $conn->query($sql);
    $result = $query->fetch();
    return $result['phrase'];
  }
  
  function getMethodDetails($test_id, $language) {
    global $conn;
	
	$actual_language = "";
	if($language == 1) {
		$actual_language = "R";
	}
	elseif ($language == 2) {
		$actual_language = "Python";
	}
	else {
		$actual_language = "Matlab";
	}
	
    $sql = "SELECT method_id, name FROM method WHERE test_id='".$test_id."' AND language IN ('".$actual_language."','Experimental','Experimental2','Technical','Random') ";
	
    error_log("Method ID Query: ". $sql);
    $query = $conn->query($sql);
    $result = $query->fetchAll();
	
	$methods = array();
	
	foreach($result as $row) {
		$methods[] = $row;
	}
    return $methods;
  }
?>
