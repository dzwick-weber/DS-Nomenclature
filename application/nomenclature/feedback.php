<?php require_once("header.php"); ?>
  <script>
function SubmitFeedback() {
    $.ajax({
      url: 'code/validate_feedback.php',
      type: 'POST',
      data: { 
        'stoodOutDifficult': $("#stoodOutDifficult").val(), 
        'stoodOutEasier': $("#stoodOutEasier").val(), 
        'namingApproach': $("#namingApproach").val(), 
        'comments': $("#comments").val()
      },
      complete: function (response) {
        window.location.href = "finished.php";
      }
    });
  }
  </script>
  <div class="container">
    <h1>Final Feedback</h1>
    <label for="stoodOutDifficult">Was there anything about the syntax (not the study) that stood out as particularly difficult?</label>
    <textarea class="form-control" rows=10 id="stoodOutDifficult"></textarea>
    <br>
    <label for="stoodOutEasier">Was there anything about the syntax (not the study) that stood out to make these tasks easier</label>
    <textarea class="form-control" rows=10 id="stoodOutEasier"></textarea>
    <br>
    <label for="namingApproach">If you were naming a new function for data analysis, what approach would be best?</label>
    <textarea class="form-control" rows=10 id="namingApproach"></textarea>
    <br>
    <label for="comments">If you have any other comments or feedback, please type it here:</label>
    <textarea class="form-control" rows=10 id="comments"></textarea>
    <br>

    <p align="right">
      <button type="button" class="btn btn-success" style="align" id="finished" onclick="SubmitFeedback()">I'm finished</button>
    </p>
  </div>
<?php require_once("footer.php"); ?>

