

CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB  DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Various channels thru which the member can submit for the assessments';



CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secureId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB  DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Members master table';



CREATE TABLE `question_types_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB  DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'A lookup table with all the possible question types';


CREATE TABLE `sequences` (
  `id` int(11) NOT NULL DEFAULT 0,
  `seq_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`seq_name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;


CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clientId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reportingKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mutex` tinyint(1) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Possible answers for the questions';

CREATE TABLE `answers_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answerId` int(11) NOT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clientId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reportingKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mutex` tinyint(1) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL ,
  `effectiveTill` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Possible answers for the questions';


CREATE TABLE `answer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clientId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Grouping answers together in a logical sense';


CREATE TABLE `answer_groups_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answerGroupId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clientId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `effectiveTill` timestamp NOT NULL,
  `published` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Grouping answers together in a logical sense';


CREATE TABLE `answer_group_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answerGroupId` int(11) NOT NULL,
  `answerId` int(11) NOT NULL,
  `sequenceNumber` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
  KEY `answer_groups_FK` (`answerId`),
  CONSTRAINT `answer_groups_FK` FOREIGN KEY (`answerId`) REFERENCES `answers` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Grouping answers together in a logical sense';



CREATE TABLE `answer_group_answers_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answerGroupAnswersid` int(11) NOT NULL ,
  `answerGroupId` int(11) NOT NULL,
  `answerId` int(11) NOT NULL,
  `sequenceNumber` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL,
  `effectiveTill` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
  KEY `answer_groups_FK` (`answerId`),
  CONSTRAINT `answer_groups_history_FK` FOREIGN KEY (`answerId`) REFERENCES `answers` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Grouping answers together in a logical sense';


CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question_type` int(11) NOT NULL,
  `clientId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `questions_FK` (`question_type`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'The Question Bank';


CREATE TABLE `questions_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question_type` int(11) NOT NULL,
  `clientId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `effectiveTill` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_history_FK` (`question_type`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'The Question Bank';



CREATE TABLE `question_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL COMMENT 'Question being associated',
  `answerGroupId` int(11) NOT NULL COMMENT 'Answer Group being associated.',
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `questions_answers_FK_1` (`questionId`),
  KEY `questions_answers_FK_2` (`answerGroupId`)
) ENGINE = InnoDB  DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Association between a question and corresponding answer';


CREATE TABLE `question_answers_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionAnswersid` int(11) NOT NULL,
  `questionId` int(11) NOT NULL COMMENT 'Question being associated',
  `answerGroupId` int(11) NOT NULL COMMENT 'Answer Group being associated.',
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL,
  `effectiveTill` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `questions_answers_FK_1` (`questionId`),
  KEY `questions_answers_FK_2` (`answerGroupId`)
) ENGINE = InnoDB  DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Association between a question and corresponding answer';


CREATE TABLE `assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clientId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skipTitleCard` tinyint(1) DEFAULT NULL,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'assessments Master Table';


CREATE TABLE `assessments_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clientId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skipTitleCard` tinyint(1) DEFAULT NULL,
  `effectiveFrom` timestamp NOT NULL,
  `effectiveTill` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'assessments Master Table';


CREATE TABLE `assessment_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `sequenceNumber` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assessment_questions_FK` (`assessmentId`),
  KEY `assessment_questions_FK_1` (`questionId`)
) ENGINE = InnoDB  DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Association between an assessment and the questions in the assessment';


CREATE TABLE `assessment_questions_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentQuestionsid` int(11) NOT NULL,
  `assessmentId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `sequenceNumber` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1,
  `effectiveFrom` timestamp NOT NULL ,
  `effectiveTill` timestamp NULL NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assessment_questions_FK` (`assessmentId`),
  KEY `assessment_questions_FK_1` (`questionId`)
) ENGINE = InnoDB  DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Association between an assessment and the questions in the assessment';


CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessmentId` int(11) NOT NULL,
  `memberId` int(11) NOT NULL,
  `effectiveFrom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `journeyId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_members_FK` (`assessmentId`),
  KEY `assessment_members_FK_1` (`memberId`),
  CONSTRAINT `assessment_members_FK_1` FOREIGN KEY (`memberId`) REFERENCES `members` (`id`)
) ENGINE = InnoDB  DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Association between an assessment and members participating in the assessment';


CREATE TABLE `assignment_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignmentId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `answerId` int(11) DEFAULT NULL COMMENT 'if the answer is selected on the screen',
  `answerText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'if the answer is a manual entry by the member',
  `channelId` int(11) DEFAULT NULL,
  `answered_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contentLanguage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `journeyId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answeredVersionDt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assessment_answers_FK` (`assignmentId`),
  KEY `assessment_answers_FK_1` (`questionId`),
  KEY `assessment_answers_FK_2` (`channelId`),
  KEY `assessment_answers_FK_3` (`answerId`),
  CONSTRAINT `assessment_answers_FK_2` FOREIGN KEY (`channelId`) REFERENCES `channels` (`id`),
  CONSTRAINT `assignment_answers_FK` FOREIGN KEY (`assignmentId`) REFERENCES `assignments` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 39 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Answers submitted by the member for a particular assessment';





