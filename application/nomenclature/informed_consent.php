<?php require_once("header.php"); ?>
    <h3 style="color:red" align="center"><b><u>Do not use your browser navigation controls.</u></b></h3>
    <div class="container-fluid">
      <div>
        <h1>Weber State University Informed Consent</h1>
        <h3>TITLE OF STUDY: Data Science Coding Language Replication Study</h3>
        <h3>INVESTIGATORS: Dr. Dylan Zwick<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dr. Ryan Cain<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dr. Julian Chan<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dr. Hugo Valle</h3>
        <p>For questions about the study, you may contact the principal investigator: Dr. Dylan Zwick at <a href="mailto:dylanzwick@weber.edu"><b>dylanzwick@weber.edu</b></a>.</p>
        <p>For questions about your rights as a research participant or to discuss problems, complaints, or concerns about a research study, or to obtain information, or offer input, contact <b>the Chair of the IRB Committee at <a href="mailto:IRB@weber.edu">IRB@weber.edu</a>.</b></p>
      </div>
      
      <div id="scroll-area">
        <h4>Study Purpose</h4>
        <p>You are invited to participate in a research study. The purpose of this study is to study scientific programming languages and tools.</p>
        
        <h4>Participants</h4>
        <p>You are being asked to participate in this study because you fit this criteria: 18 or older and currently enrolled in a course related to Data Science.</p>
        
        <h4>Number of People Taking Part in the Study</h4>
        <p>If you agree to participate, you will be one of many Weber State University students in the study. We hope to recruit at least 150 students for the study.</p>
        
        <h4>Procedures for the Study</h4>
        <p>If you volunteer to participate in this study, you will be asked to do the following:</p>
        <ol>
          <li>Fill out a demographic survey</li>
          <li>Read descriptions of various statistical tests and concepts</li>
          <li>Make decisions on how well a given word, phrase, or method name maps to a statistical test or concept</li>
          <li>Take a survey about your experiences</li>
        </ol>
        
        <h4>Risks of Taking Part in the Study</h4>
        <p>There are risks involved in all research studies. This study may include only minimal risks. You may experience some mental stress while reading through questions and considering answers. This study is being conducted remotely, and while we do our best to keep all information confidential, no computer security mechanism is perfectly secure.</p>
        
        <h4>Benefits of Taking Part in the Study</h4>
        <p>There is no financial cost for participating in the study. The study will take 30-60 minutes of your time. Compensation will be provided as a $20 valued Amazon voucher and extra credit in courses where the instructor so advertised.</p>
        
        <h4>Alternatives to Taking Part in the Study</h4>
        <p>There is no alternative to participating.</p>
        
        <h4>Costs / Compensation for Injury</h4>
        <p>There are no anticipated costs of participating in this study. You must have access to the Internet to participate. In the event of physical injury resulting from your participation in this research, necessary medical treatment will be provided to you and billed as part of your medical expenses. Costs not covered by your health care insurer will be your responsibility. Also, it is your responsibility to determine the extent of your health care coverage. There is no program in place for other monetary compensation for such injuries. However, you are not giving up any legal rights or benefits to which you are otherwise entitled. If you are participating in research which is not conducted at a medical facility, you will be responsible for seeking medical care and for the expenses associated with any care received.</p>
        
        <h4>Confidentiality</h4>
        <p>All information gathered in this study will be kept as confidential as possible. No reference will be made in written or oral materials that could link you personally to this study. All records will be stored on a secure, encrypted server. Identifiers will be removed from identifiable private information and, after such removal, the information could be used for future research studies or distributed to another investigator for future research studies without additional informed consent from you.</p>
        
        <h4>Contacts for Questions or Problems</h4>
        <p>For questions about the study, you may contact the principal investigator: Dr. Dylan Zwick, <a href="mailto:dylanzwick@weber.edu">dylanzwick@weber.edu</a>. For questions about your rights as a research participant or to discuss problems, complaints, or concerns about a research study, or to obtain information, or offer input, contact the Chair of the IRB Committee at <a href="mailto:IRB@weber.edu">IRB@weber.edu</a>.</p>
        
        <h4>Funding</h4>
        <p>This research is funded by Weber State University.</p>
        
        <h4>Voluntary Nature of Study</h4>
        <p>Taking part in this study is voluntary. You may choose not to take part or may leave the study at any time. Leaving the study will not result in any penalty or loss of benefits to which you are entitled. Your decision whether or not to participate in this study will not affect your current or future relations with Weber State University or any department within Weber State University.</p>
      </div>

      <form role="form" action="code/accept_consent.php" method="post">
        <div class="form-group">
          <h4>Participant Consent</h4>
          <p>I have read the above information and agree to participate in this study. I have been able to ask questions about the research study. I am at least 18 years of age. A copy of this form is available at the following link: <a target="_blank" href="https://drive.google.com/file/d/13YuCCPcWKpvDjmIO5MIK9PO2CBT686T8/view?usp=sharing">Publicly Shared Consent Form.pdf</a>.</p>
          <p>You will be presented with a button to Accept/Decline at the bottom of the web form. If you click Accept, you will continue to the survey.</p>
          <button type="submit" class="btn btn-success bt-lg">I Accept</button>
          <button type="button" onclick="window.location.href = 'code/decline_consent.php'" class="btn btn-danger bt-lg">I Decline</button>
        </div>
      </form>
    </div>

<?php require_once("footer.php"); ?>
