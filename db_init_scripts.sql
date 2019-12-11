CREATE TABLE `answer_group_answers` (
  `answer_group_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sequence_number` int(11) DEFAULT NULL,
  `effective_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effective_till` timestamp NULL DEFAULT NULL,
  `status` varchar(255) GENERATED ALWAYS AS (
    case
      when (
        `effective_from` > 0
        and `effective_till` is null
      ) then 'active'
      when (
        `effective_from` > 0
        and `effective_till` is not null
      ) then 'archived'
      when `effective_from` = 0 then 'draft'
    end
  ) STORED,
  KEY `answer_groups_FK` (`answer_id`),
  CONSTRAINT `answer_groups_FK` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Grouping answers together in a logical sense';



CREATE TABLE `answer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `effective_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effective_till` timestamp NULL DEFAULT NULL,
  `status` varchar(255) GENERATED ALWAYS AS (
    case
      when (
        `effective_from` > 0
        and `effective_till` is null
      ) then 'active'
      when (
        `effective_from` > 0
        and `effective_till` is not null
      ) then 'archived'
      when `effective_from` = 0 then 'draft'
    end
  ) STORED,
  PRIMARY KEY (`id`, `effective_from`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Grouping answers together in a logical sense';



CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effective_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effective_till` timestamp NULL DEFAULT NULL,
  `status` varchar(255) GENERATED ALWAYS AS (
    case
      when (
        `effective_from` > 0
        and `effective_till` is null
      ) then 'active'
      when (
        `effective_from` > 0
        and `effective_till` is not null
      ) then 'archived'
      when `effective_from` = 0 then 'draft'
    end
  ) STORED,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reportingKey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mutex` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`, `effective_from`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Possible answers for the questions';



CREATE TABLE `assessment_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `effective_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effective_till` timestamp NULL DEFAULT NULL,
  `status` varchar(255) GENERATED ALWAYS AS (
    case
      when (
        `effective_from` > 0
        and `effective_till` is null
      ) then 'active'
      when (
        `effective_from` > 0
        and `effective_till` is not null
      ) then 'archived'
      when `effective_from` = 0 then 'draft'
    end
  ) STORED,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_question_effective` (`assessment_id`, `question_id`, `effective_from`),
  KEY `assessment_questions_FK` (`assessment_id`),
  KEY `assessment_questions_FK_1` (`question_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 477 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Association between an assessment and the questions in the assessment';



CREATE TABLE `assessments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `effective_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effective_till` timestamp NULL DEFAULT NULL,
  `status` varchar(255) GENERATED ALWAYS AS (
    case
      when (
        `effective_from` > 0
        and `effective_till` is null
      ) then 'active'
      when (
        `effective_from` > 0
        and `effective_till` is not null
      ) then 'archived'
      when `effective_from` = 0 then 'draft'
    end
  ) STORED,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skipTitleCard` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`, `effective_from`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'assessments Master Table';



CREATE TABLE `assignment_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) DEFAULT NULL COMMENT 'if the answer is selected on the screen',
  `answer_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'if the answer is a manual entry by the member',
  `channel_id` int(11) DEFAULT NULL,
  `answered_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `content_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `journey_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answeredVersionDt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `assessment_answers_FK` (`assignment_id`),
  KEY `assessment_answers_FK_1` (`question_id`),
  KEY `assessment_answers_FK_2` (`channel_id`),
  KEY `assessment_answers_FK_3` (`answer_id`),
  CONSTRAINT `assessment_answers_FK_2` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `assignment_answers_FK` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 39 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Answers submitted by the member for a particular assessment';



CREATE TABLE `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `journey_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_members_FK` (`assessment_id`),
  KEY `assessment_members_FK_1` (`member_id`),
  CONSTRAINT `assessment_members_FK_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 29 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Association between an assessment and members participating in the assessment';



CREATE TABLE `channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version_number` int(11) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Various channels thru which the member can submit for the assessments';



CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secure_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 14 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Members master table';



CREATE TABLE `question_types_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'A lookup table with all the possible question types';



CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question_type` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effective_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effective_till` timestamp NULL DEFAULT NULL,
  `status` varchar(255) GENERATED ALWAYS AS (
    case
      when (
        `effective_from` > 0
        and `effective_till` is null
      ) then 'active'
      when (
        `effective_from` > 0
        and `effective_till` is not null
      ) then 'archived'
      when `effective_from` = 0 then 'draft'
    end
  ) STORED,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`, `effective_from`),
  KEY `questions_FK` (`question_type`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'The Question Bank';



CREATE TABLE `questions_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL COMMENT 'Question being associated',
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `answer_group_id` int(11) DEFAULT NULL COMMENT 'Answer Group being associated. Optional.',
  `effective_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `effective_till` timestamp NULL DEFAULT NULL,
  `status` varchar(255) GENERATED ALWAYS AS (
    case
      when (
        `effective_from` > 0
        and `effective_till` is null
      ) then 'active'
      when (
        `effective_from` > 0
        and `effective_till` is not null
      ) then 'archived'
      when `effective_from` = 0 then 'draft'
    end
  ) STORED,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questions_answers_UN` (`question_id`, `answer_group_id`, `effective_from`),
  KEY `questions_answers_FK_1` (`question_id`),
  KEY `questions_answers_FK_2` (`answer_group_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 137 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Association between a question and corresponding answer';



CREATE TABLE `sequences` (
  `id` int(11) NOT NULL DEFAULT 0,
  `seq_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`seq_name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;