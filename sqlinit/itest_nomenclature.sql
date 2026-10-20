-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: itest_nomenclature
-- ------------------------------------------------------
-- Server version	5.7.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

use nomenclature;

--
-- Table structure for table `codes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codes` (
  `code` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `uuid` varchar(60) DEFAULT NULL,
  `event` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `task` int(11) DEFAULT NULL,
  `entry` text,
  `output` text,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=6251 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `extrasurvey`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extrasurvey` (
  `id` int(11) NOT NULL,
  `uuid` varchar(60) DEFAULT NULL,
  `qid` varchar(60) NOT NULL,
  `optionname` varchar(60) NOT NULL,
  `value` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `language`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `year` char(25) NOT NULL,
  `nextLanguage` int(11) NOT NULL,
  `Lang1` int(11) DEFAULT NULL,
  `Lang2` int(11) DEFAULT NULL,
  `Lang3` int(11) DEFAULT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES ('Freshman',0,0,0,0),('Graduate',0,0,0,0),('Junior',0,0,0,0),('Non-degree seeking',0,0,0,0),('Not Applicable',0,0,0,0),('Post-graduate',0,0,0,0),('Professional',0,0,0,0),('Senior',0,0,0,0),('Sophomore',0,0,0,0);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `method`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `method` (
  `method_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `language` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method`
--

LOCK TABLES `method` WRITE;
/*!40000 ALTER TABLE `method` DISABLE KEYS */;
INSERT INTO `method` VALUES (1,1,'scale','R'),(2,2,'skewness','R'),(3,3,'kurtosis','R'),(4,4,'cor','R'),(5,5,'cor','R'),(6,6,'t.test','R'),(7,7,'aov','R'),(8,8,'aov','R'),(9,9,'manova','R'),(10,10,'aov','R'),(11,11,'wilcox.test','R'),(12,12,'wilcox.test','R'),(13,13,'kruskal.test','R'),(14,14,'friedman.test','R'),(15,15,'leveneTest','R'),(16,16,'conover.test','R'),(17,17,'anova_test','R'),(18,18,'chisq.test','R'),(19,19,'binom.test','R'),(20,20,'shapiro.test','R'),(21,21,'ks.test','R'),(22,22,'cohen.d','R'),(23,23,'eta_sq','R'),(24,24,'eta_sq','R'),(25,25,'glass_delta','R'),(26,26,'cohen.d','R'),(27,27,'dunn.test','R'),(28,28,'pairwise.t.test','R'),(29,29,'pairwise.t.test','R'),(30,30,'TukeyHSD','R'),(31,31,'anova_test','R'),(32,32,'anova_test','R'),(33,33,'cohen.kappa','R'),(34,34,'kripp.alpha','R'),(35,35,'lm','R'),(36,36,'chisq.test','R'),(37,37,'confint','R'),(38,38,'qt','R'),(39,39,'qnorm','R'),(40,40,'qf','R'),(41,41,'rstandard','R'),(42,42,'prop.test','R'),(43,43,'dt','R'),(44,44,'dnorm','R'),(45,45,'df','R'),(46,46,'boot','R'),(47,1,'zscore','Python'),(48,2,'skew','Python'),(49,3,'kurtosis','Python'),(50,4,'pearsonr','Python'),(51,5,'spearmanr','Python'),(52,6,'ttest_ind','Python'),(53,7,'f_oneway','Python'),(54,8,'AnovaRM.fit','Python'),(55,9,'MANOVA.mv_test','Python'),(56,10,'ancova','Python'),(57,11,'mannwhitneyu','Python'),(58,12,'wilcoxon','Python'),(59,13,'kruskal','Python'),(60,14,'friedman','Python'),(61,15,'levene','Python'),(62,16,'posthoc_conover','Python'),(63,17,'rm_anova','Python'),(64,18,'chisquare','Python'),(65,19,'binom','Python'),(66,20,'shapiro','Python'),(67,21,'kstest','Python'),(68,22,'pairwise_ttests','Python'),(69,23,'pairwise_ttests','Python'),(70,24,'anova','Python'),(71,25,'pairwise_ttests','Python'),(72,26,'pairwise_ttests','Python'),(73,27,'posthoc_dunn','Python'),(74,28,'pairwise_ttests','Python'),(75,29,'pairwise_ttests','Python'),(76,30,'posthoc_tukey','Python'),(77,31,'rm_anova','Python'),(78,32,'rm_anova','Python'),(79,33,'cohen_kappa_score','Python'),(80,34,'krippendorff.alpha','Python'),(81,35,'LinearRegression().fit','Python'),(82,36,'chisquare','Python'),(83,37,'t.interval','Python'),(84,38,'t.ppf','Python'),(85,39,'norm.ppf','Python'),(86,40,'f.ppf','Python'),(87,41,'resid_studentized_internal','Python'),(88,43,'t.pdf','Python'),(89,44,'norm.pdf','Python'),(90,45,'f.pdf','Python'),(91,46,'resample','Python'),(92,1,'zscore','Matlab'),(93,2,'skewness','Matlab'),(94,3,'kurtosis','Matlab'),(95,4,'corr','Matlab'),(96,5,'corr','Matlab'),(97,6,'ttest','Matlab'),(98,7,'anova1','Matlab'),(99,8,'ranova','Matlab'),(100,9,'manova1','Matlab'),(101,10,'f_ancova','Matlab'),(102,11,'ranksum','Matlab'),(103,12,'signrank','Matlab'),(104,13,'kruskalwallis','Matlab'),(105,14,'friedman','Matlab'),(106,15,'Levenetest','Matlab'),(107,16,'SquaredRanksTest','Matlab'),(108,17,'mauchly','Matlab'),(109,18,'chi2gof','Matlab'),(110,19,'myBinomTest','Matlab'),(111,20,'swtest','Matlab'),(112,21,'kstest','Matlab'),(113,22,'computeCohen_d','Matlab'),(114,23,'mes1way','Matlab'),(115,24,'mes1way','Matlab'),(116,25,'mes','Matlab'),(117,26,'mes','Matlab'),(118,27,'dunn','Matlab'),(119,28,'multcompare','Matlab'),(120,29,'bonf_holm','Matlab'),(121,30,'multcompare','Matlab'),(122,31,'GenCalcHFEps','Matlab'),(123,32,'GenCalcHFEps','Matlab'),(124,33,'kappa','Matlab'),(125,34,'kriAlpha','Matlab'),(126,35,'fitlm','Matlab'),(127,36,'chi2ind','Matlab'),(128,37,'paramci','Matlab'),(129,38,'tinv','Matlab'),(130,39,'norminv','Matlab'),(131,40,'finv','Matlab'),(132,41,'Residuals','Matlab'),(133,42,'prop_test','Matlab'),(134,43,'tpdf','Matlab'),(135,44,'normpdf','Matlab'),(136,45,'fpdf','Matlab'),(137,46,'bootstrp','Matlab'),(138,1,'StandardDeviationsFromMean','Experimental'),(139,2,'Skew','Experimental'),(140,3,'TailWeight','Experimental'),(141,4,'Correlate','Experimental'),(142,5,'CorrelateRanks','Experimental'),(143,6,'CompareGroups','Experimental'),(144,7,'CompareGroups','Experimental'),(145,8,'CompareGroups','Experimental'),(146,9,'CompareGroups','Experimental'),(147,10,'CompareGroups','Experimental'),(148,11,'CompareRanks','Experimental'),(149,12,'CompareRanks','Experimental'),(150,13,'CompareRanks','Experimental'),(151,14,'CompareRanks','Experimental'),(152,15,'CompareVariances','Experimental'),(153,16,'CompareRanksVariances','Experimental'),(154,17,'CompareVariances','Experimental'),(155,18,'CompareObservedExpected','Experimental'),(156,19,'CompareObservedExpected','Experimental'),(157,20,'IsNormalDistribution','Experimental'),(158,21,'IsDistribution','Experimental'),(159,22,'EffectSize','Experimental'),(160,23,'EffectSize','Experimental'),(161,24,'EffectSize','Experimental'),(162,25,'EffectSize','Experimental'),(163,26,'EffectSize','Experimental'),(164,27,'CompareGroupsPairwise','Experimental'),(165,28,'CompareGroupsPairwise','Experimental'),(166,29,'CompareGroupsPairwise','Experimental'),(167,30,'CompareGroupsPairwise','Experimental'),(168,31,'CalculateModelCorrections','Experimental'),(169,32,'CalculateModelCorrections','Experimental'),(170,33,'CompareRatings','Experimental'),(171,34,'CompareRatings','Experimental'),(172,35,'Regression','Experimental'),(173,36,'CompareObservedExpected','Experimental'),(174,37,'ConfidenceInterval','Experimental'),(175,38,'CriticalValue','Experimental'),(176,39,'CriticalValue','Experimental'),(177,40,'CriticalValue','Experimental'),(178,41,'Residuals','Experimental'),(179,42,'CompareProportions','Experimental'),(180,43,'HeavyTailNormalDistribution','Experimental'),(181,44,'NormalDistribution','Experimental'),(182,45,'VarianceRatioDistribution','Experimental'),(183,46,'Resample','Experimental'),(184,1,'Standardize','Experimental2'),(185,2,'Warp','Experimental2'),(186,3,'Tailedness','Experimental2'),(187,4,'CorrelateLinearly','Experimental2'),(188,5,'CorrelateGenerally','Experimental2'),(189,6,'CompareMeans','Experimental2'),(190,7,'CompareMeans','Experimental2'),(191,8,'CompareMeans','Experimental2'),(192,9,'CompareMeans','Experimental2'),(193,10,'CompareMeans','Experimental2'),(194,11,'CompareMeansRanked','Experimental2'),(195,12,'CompareMeansRanked','Experimental2'),(196,13,'CompareMeansRanked','Experimental2'),(197,14,'CompareMeansRanked','Experimental2'),(198,15,'EqualVarianceTest','Experimental2'),(199,16,'EqualVarianceRanksTest','Experimental2'),(200,17,'EqualVarianceTest','Experimental2'),(201,18,'CompareCounts','Experimental2'),(202,19,'CompareCounts','Experimental2'),(203,20,'CheckNormal','Experimental2'),(204,21,'CheckDistribution','Experimental2'),(205,22,'ResultStrength','Experimental2'),(206,23,'ResultStrength','Experimental2'),(207,24,'ResultStrength','Experimental2'),(208,25,'ResultStrength','Experimental2'),(209,26,'ResultStrength','Experimental2'),(210,27,'CompareMeansPairwise','Experimental2'),(211,28,'CompareMeansPairwise','Experimental2'),(212,29,'CompareMeansPairwise','Experimental2'),(213,30,'CompareMeansPairwise','Experimental2'),(214,31,'ModelAdjuster','Experimental2'),(215,32,'ModelAdjuster','Experimental2'),(216,33,'CheckAgreement','Experimental2'),(217,34,'CheckAgreement','Experimental2'),(218,35,'FindLine','Experimental2'),(219,36,'CompareCounts','Experimental2'),(220,37,'ExpectedRange','Experimental2'),(221,38,'TargetPoint','Experimental2'),(222,39,'TargetPoint','Experimental2'),(223,40,'TargetPoint','Experimental2'),(224,41,'Errors','Experimental2'),(225,42,'EqualProportionTest','Experimental2'),(226,43,'FatTailDistribution','Experimental2'),(227,44,'StandardDistribution','Experimental2'),(228,45,'FisherSnedecorDistribution','Experimental2'),(229,46,'RandomlySample','Experimental2'),(230,1,'ZScore','Technical'),(231,2,'Skew','Technical'),(232,3,'Kurtosis','Technical'),(233,4,'PearsonCorrelation','Technical'),(234,5,'SpearmanCorrelation','Technical'),(235,6,'TTest','Technical'),(236,7,'ANOVA','Technical'),(237,8,'RepeatedMeasuresANOVA','Technical'),(238,9,'MANOVA','Technical'),(239,10,'ANCOVA','Technical'),(240,11,'MannWhiteneyTest','Technical'),(241,12,'WilcoxonSignedRanksTest','Technical'),(242,13,'KruskalWallisTest','Technical'),(243,14,'FriedmanTest','Technical'),(244,15,'LevenesTest','Technical'),(245,16,'ConoverEqualVarianceTest','Technical'),(246,17,'MauchlysSphericityTest','Technical'),(247,18,'ChiSquareGoodnessOfFitTest','Technical'),(248,19,'BinomialTest','Technical'),(249,20,'ShapiroWilkTest','Technical'),(250,21,'KolmogorovSmirnovTest','Technical'),(251,22,'CohensD','Technical'),(252,23,'EtaSquared','Technical'),(253,24,'PartialEtaSquared','Technical'),(254,25,'GlassDelta','Technical'),(255,26,'HedgesG','Technical'),(256,27,'DunnsTest','Technical'),(257,28,'BonferroniProcedure','Technical'),(258,29,'HolmBonferroniProcedure','Technical'),(259,30,'TukeysTest','Technical'),(260,31,'GreenhouseGeisserCorrection','Technical'),(261,32,'HuynhFeldtCorrection','Technical'),(262,33,'CohensKappa','Technical'),(263,34,'KrippendorffsAlpha','Technical'),(264,35,'LinearRegression','Technical'),(265,36,'ChiSquareTestForIndependence','Technical'),(266,37,'ConfidenceInterval','Technical'),(267,38,'CriticalValueStudentsT','Technical'),(268,39,'CriticalValueGaussian','Technical'),(269,40,'CriticalValueF','Technical'),(270,41,'Residuals','Technical'),(271,42,'TestOfEqualOrGivenProportions','Technical'),(272,43,'TDistribution','Technical'),(273,44,'NormalDistribution','Technical'),(274,45,'FDistribution','Technical'),(275,46,'Bootstrap','Technical'),(276,1,'mobak','Random'),(277,2,'dames','Random'),(278,3,'tikajam','Random'),(279,4,'copov','Random'),(280,5,'nizuma','Random'),(281,6,'cejunas','Random'),(282,7,'kigujib','Random'),(283,8,'vuvahu','Random'),(284,9,'pulanu','Random'),(285,10,'vitox','Random'),(286,11,'rorovef','Random'),(287,12,'nuloj','Random'),(288,13,'gawohi','Random'),(289,14,'juyote','Random'),(290,15,'xorutu','Random'),(291,16,'diqejac','Random'),(292,17,'munatul','Random'),(293,18,'joxir','Random'),(294,19,'xosudu','Random'),(295,20,'fobixus','Random'),(296,21,'fukequf','Random'),(297,22,'qiroqu','Random'),(298,23,'mepir','Random'),(299,24,'xupala','Random'),(300,25,'zeqim','Random'),(301,26,'relor','Random'),(302,27,'tabicot','Random'),(303,28,'helade','Random'),(304,29,'rejajo','Random'),(305,30,'qofohoq','Random'),(306,31,'buloxo','Random'),(307,32,'sakecub','Random'),(308,33,'qebev','Random'),(309,34,'johoja','Random'),(310,35,'kemere','Random'),(311,36,'meyin','Random'),(312,37,'tobaqa','Random'),(313,38,'huxomop','Random'),(314,39,'lugof','Random'),(315,40,'gazilit','Random'),(316,41,'hiwix','Random'),(317,42,'cewer','Random'),(318,43,'wukeb','Random'),(319,44,'yulufol','Random'),(320,45,'qigiq','Random'),(321,46,'qakimav','Random');
/*!40000 ALTER TABLE `method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `courseNum` varchar(255) DEFAULT NULL,
  `courseName` varchar(255) DEFAULT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `lang` int(11) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `survey`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `uuid` varchar(60) DEFAULT NULL,
  `totalxp` int(11) DEFAULT NULL,
  `jobxp` int(11) DEFAULT NULL,
  `dataCourses` int(11) DEFAULT NULL,
  `education` char(25) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `year` char(25) DEFAULT NULL,
  `gpa` char(25) DEFAULT NULL,
  `origin` char(30) DEFAULT NULL,
  `language` char(30) DEFAULT NULL,
  `fluency` int(11) DEFAULT NULL,
  `disclosed` varchar(15) DEFAULT NULL,
  `attentionDeficit` tinyint(1) DEFAULT NULL,
  `autism` tinyint(1) DEFAULT NULL,
  `blind` tinyint(1) DEFAULT NULL,
  `deaf` tinyint(1) DEFAULT NULL,
  `health` tinyint(1) DEFAULT NULL,
  `learning` tinyint(1) DEFAULT NULL,
  `mentalHealth` tinyint(1) DEFAULT NULL,
  `mobility` tinyint(1) DEFAULT NULL,
  `speech` tinyint(1) DEFAULT NULL,
  `other` tinyint(1) DEFAULT NULL,
  `otherDescription` varchar(250) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `internxp` int(11) DEFAULT NULL,
  `lang1` int(11) DEFAULT NULL,
  `lang2` int(11) DEFAULT NULL,
  `lang3` int(11) DEFAULT NULL,
  `lang4` int(11) DEFAULT NULL,
  `lang5` int(11) DEFAULT NULL,
  `lang6` int(11) DEFAULT NULL,
  `lang7` int(11) DEFAULT NULL,
  `lang8` int(11) DEFAULT NULL,
  `lang9` int(11) DEFAULT NULL,
  `lang10` int(11) DEFAULT NULL,
  `lang11` int(11) DEFAULT NULL,
  `lang12` int(11) DEFAULT NULL,
  `lang13` int(11) DEFAULT NULL,
  `lang14` int(11) DEFAULT NULL,
  `lang15` int(11) DEFAULT NULL,
  `lang16` int(11) DEFAULT NULL,
  `lang17` int(11) DEFAULT NULL,
  `lang18` int(11) DEFAULT NULL,
  `lang19` int(11) DEFAULT NULL,
  `lang20` int(11) DEFAULT NULL,
  `lang21` int(11) DEFAULT NULL,
  `lang22` int(11) DEFAULT NULL,
  `lang23` int(11) DEFAULT NULL,
  `lang24` int(11) DEFAULT NULL,
  `lang25` int(11) DEFAULT NULL,
  `lang26` int(11) DEFAULT NULL,
  `lang27` int(11) DEFAULT NULL,
  `lang28` int(11) DEFAULT NULL,
  `lang29` int(11) DEFAULT NULL,
  `course1` char(10) DEFAULT NULL,
  `course2` char(10) DEFAULT NULL,
  `course3` char(10) DEFAULT NULL,
  `course4` char(10) DEFAULT NULL,
  `course5` char(10) DEFAULT NULL,
  `course6` char(10) DEFAULT NULL,
  `course7` char(10) DEFAULT NULL,
  `course8` char(10) DEFAULT NULL,
  `course9` char(10) DEFAULT NULL,
  `course10` char(10) DEFAULT NULL,
  `course11` char(10) DEFAULT NULL,
  `course12` char(10) DEFAULT NULL,
  `course13` char(10) DEFAULT NULL,
  `course14` char(10) DEFAULT NULL,
  `course15` char(10) DEFAULT NULL,
  `course16` char(10) DEFAULT NULL,
  `course17` char(10) DEFAULT NULL,
  `course18` char(10) DEFAULT NULL,
  `course19` char(10) DEFAULT NULL,
  `course20` char(10) DEFAULT NULL,
  `course21` char(10) DEFAULT NULL,
  `course22` char(10) DEFAULT NULL,
  `course23` char(10) DEFAULT NULL,
  `course24` char(10) DEFAULT NULL,
  `stoodOutDifficult` text,
  `stoodOutEasier` text,
  `namingApproach` text,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_response`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_response` (
  `task_response_id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(60) NOT NULL,
  `task_order` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test_id` int(11) NOT NULL,
  `method_order` int(11) NOT NULL,
  `method_id` int(11) NOT NULL,
  `response` int(4) NOT NULL,
  `max` int(4) NOT NULL,
  PRIMARY KEY (`task_response_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27556 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `test`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` int(11) DEFAULT NULL,
  `concept` varchar(50) DEFAULT NULL,
  `phrase` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,1,'Z-Score','A value\'s number of standard deviations from the mean'),(2,1,'Skew','A measure used to describe the lack of symmetry in a data set around its mean '),(3,2,'Kurtosis','A measure used to describe the degree to which scores cluster in the tails or around the peak of a distribution'),(4,1,'Pearson Correlation','Linear relationship between two variables'),(5,2,'Spearman Correlation','Measure if two variables move in the same direction but not at a constant rate'),(6,1,'T-Test','Difference between two groups'),(7,2,'ANOVA','Difference between several groups'),(8,2,'Repeated Measures ANOVA','Difference between several groups when there are repeated measures'),(9,2,'MANOVA','Difference between several groups on more than one dependent variable'),(10,2,'ANCOVA','Difference between several groups while controlling for nuisance variables'),(11,2,'Mann-Whiteney Test','Difference between two rank ordered groups without assumptions about the distribution'),(12,2,'Wilcoxon Signed-Ranks Test','Difference between two rank ordered groups without assumptions about the distribution when the data are paired'),(13,2,'Kruskal-Wallis Test','Difference between several rank ordered groups based on one factor without assumptions about the distribution'),(14,2,'Friedman Test','Difference between several rank ordered groups based on two factors without assumptions about the distribution'),(15,2,'Levene\'s Test','Check that several groups vary in the same way'),(16,2,'Conover Equal Variance Test','Check that several groups vary in the same way without assumptions about the distribution'),(17,2,'Mauchly\'s Sphericity Test','Check that several groups vary in the same way when there are repeated measures'),(18,1,'Chi-Square Goodness of Fit Test','Check if sample data matches the population'),(19,2,'Binomial Test','Test two possible outcomes\' observed versus expected results'),(20,2,'Shapiro-Wilk Test','Check if a sample is distributed normally'),(21,2,'Kolmogorov-Smirnov Test','Check a sample\'s distribution against a known distribution'),(22,2,'Cohen\'s d','Measure how much the difference between two groups is explained by a variable on a non-normed scale'),(23,2,'Eta Squared','Measure the proportion of variance associated with several groups on a 0 to 1 scale'),(24,2,'Partial Eta Squared','Measure the ratio of variance associated with several groups  on a 0 to 1 scale'),(25,2,'Glass\' Delta','Measure how much of the variance is accounted for by several variables when they have significantly difference standard deviations'),(26,2,'Hedge\'s g','Measure how much the difference between two groups is explained by a variable on a 0 to 1 scale'),(27,2,'Dunn\'s Test','Difference between pairs of means when there are many rank ordered groups'),(28,2,'Bonferroni Procedure','Difference between pairs of means when there are many groups'),(29,2,'Holm-Bonferroni Procedure','Difference between pairs of means when there are many groups where order matters'),(30,2,'Tukey\'s Test','Difference between pairs of means when there are many groups where they vary in the same way'),(31,2,'Greenhouse-Geisser Correction','Correct for difference in how several groups vary when there are repeated measures'),(32,2,'Huynh-Feldt Correction','Correct for difference in how several groups vary when there are repeated measures'),(33,2,'Cohen\'s kappa','Quantify how closely two raters or judges match based on where they agree'),(34,2,'Krippendorff\'s alpha','Quantify how closely several raters or judges match based on where they agree'),(35,1,'Linear regression','Model of a straight line relationship between two variables'),(36,1,'Chi-Square Test for Independence','Check if two variables of a group vary in the same way'),(37,1,'Confidence Interval','A range of values that likely includes a population value'),(38,1,'Critical Value (Student\'s t)','Boundaries of the acceptance region of a test'),(39,1,'Critical Value (Gaussian)','Boundaries of the acceptance region of a test'),(40,1,'Critical Value (F)','Boundaries of the acceptance region of a test'),(41,1,'Residuals','The distance between a measured and predicted data point'),(42,1,'Test of equal or given proportions','Used for testing the null hypothesis that the proportions of one or two groups are the same'),(43,1,'T Distribution','A symmetric bell-shaped curve with a shorter peak and heavier tails'),(44,1,'Normal Distribution','A symmetric bell-shaped curve'),(45,2,'F Distribution','A representation of the ratio between two variances'),(46,1,'Bootstrap','Method of resampling with replacement without making assumptions about the distribution');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-27  0:31:36
