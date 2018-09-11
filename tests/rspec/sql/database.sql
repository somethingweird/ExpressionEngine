#
# SQL Export
# Created by Querious (201038)
# Created: September 11, 2018 at 9:51:19 AM PDT
# Encoding: Unicode (UTF-8)
#


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `exp_upload_prefs_roles`;
DROP TABLE IF EXISTS `exp_upload_prefs`;
DROP TABLE IF EXISTS `exp_update_notices`;
DROP TABLE IF EXISTS `exp_update_log`;
DROP TABLE IF EXISTS `exp_throttle`;
DROP TABLE IF EXISTS `exp_templates_roles`;
DROP TABLE IF EXISTS `exp_templates`;
DROP TABLE IF EXISTS `exp_template_routes`;
DROP TABLE IF EXISTS `exp_template_groups_roles`;
DROP TABLE IF EXISTS `exp_template_groups`;
DROP TABLE IF EXISTS `exp_statuses_roles`;
DROP TABLE IF EXISTS `exp_statuses`;
DROP TABLE IF EXISTS `exp_stats`;
DROP TABLE IF EXISTS `exp_specialty_templates`;
DROP TABLE IF EXISTS `exp_snippets`;
DROP TABLE IF EXISTS `exp_sites`;
DROP TABLE IF EXISTS `exp_sessions`;
DROP TABLE IF EXISTS `exp_security_hashes`;
DROP TABLE IF EXISTS `exp_search_log`;
DROP TABLE IF EXISTS `exp_search`;
DROP TABLE IF EXISTS `exp_rte_toolsets`;
DROP TABLE IF EXISTS `exp_rte_tools`;
DROP TABLE IF EXISTS `exp_roles_role_groups`;
DROP TABLE IF EXISTS `exp_roles`;
DROP TABLE IF EXISTS `exp_role_settings`;
DROP TABLE IF EXISTS `exp_role_groups`;
DROP TABLE IF EXISTS `exp_revision_tracker`;
DROP TABLE IF EXISTS `exp_reset_password`;
DROP TABLE IF EXISTS `exp_remember_me`;
DROP TABLE IF EXISTS `exp_relationships`;
DROP TABLE IF EXISTS `exp_plugins`;
DROP TABLE IF EXISTS `exp_permissions`;
DROP TABLE IF EXISTS `exp_password_lockout`;
DROP TABLE IF EXISTS `exp_online_users`;
DROP TABLE IF EXISTS `exp_modules`;
DROP TABLE IF EXISTS `exp_module_member_roles`;
DROP TABLE IF EXISTS `exp_message_listed`;
DROP TABLE IF EXISTS `exp_message_folders`;
DROP TABLE IF EXISTS `exp_message_data`;
DROP TABLE IF EXISTS `exp_message_copies`;
DROP TABLE IF EXISTS `exp_message_attachments`;
DROP TABLE IF EXISTS `exp_menu_sets`;
DROP TABLE IF EXISTS `exp_menu_items`;
DROP TABLE IF EXISTS `exp_members_roles`;
DROP TABLE IF EXISTS `exp_members_role_groups`;
DROP TABLE IF EXISTS `exp_members`;
DROP TABLE IF EXISTS `exp_member_search`;
DROP TABLE IF EXISTS `exp_member_news_views`;
DROP TABLE IF EXISTS `exp_member_fields`;
DROP TABLE IF EXISTS `exp_member_data_field_1`;
DROP TABLE IF EXISTS `exp_member_data`;
DROP TABLE IF EXISTS `exp_member_bulletin_board`;
DROP TABLE IF EXISTS `exp_layout_publish_member_roles`;
DROP TABLE IF EXISTS `exp_layout_publish`;
DROP TABLE IF EXISTS `exp_html_buttons`;
DROP TABLE IF EXISTS `exp_grid_columns`;
DROP TABLE IF EXISTS `exp_global_variables`;
DROP TABLE IF EXISTS `exp_fluid_field_data`;
DROP TABLE IF EXISTS `exp_files`;
DROP TABLE IF EXISTS `exp_file_watermarks`;
DROP TABLE IF EXISTS `exp_file_dimensions`;
DROP TABLE IF EXISTS `exp_file_categories`;
DROP TABLE IF EXISTS `exp_fieldtypes`;
DROP TABLE IF EXISTS `exp_field_groups`;
DROP TABLE IF EXISTS `exp_extensions`;
DROP TABLE IF EXISTS `exp_entry_versioning`;
DROP TABLE IF EXISTS `exp_email_tracker`;
DROP TABLE IF EXISTS `exp_email_console_cache`;
DROP TABLE IF EXISTS `exp_email_cache_ml`;
DROP TABLE IF EXISTS `exp_email_cache_mg`;
DROP TABLE IF EXISTS `exp_email_cache`;
DROP TABLE IF EXISTS `exp_developer_log`;
DROP TABLE IF EXISTS `exp_cp_log`;
DROP TABLE IF EXISTS `exp_content_types`;
DROP TABLE IF EXISTS `exp_consents`;
DROP TABLE IF EXISTS `exp_consent_requests`;
DROP TABLE IF EXISTS `exp_consent_request_versions`;
DROP TABLE IF EXISTS `exp_consent_audit_log`;
DROP TABLE IF EXISTS `exp_config`;
DROP TABLE IF EXISTS `exp_comments`;
DROP TABLE IF EXISTS `exp_comment_subscriptions`;
DROP TABLE IF EXISTS `exp_channels_statuses`;
DROP TABLE IF EXISTS `exp_channels_channel_fields`;
DROP TABLE IF EXISTS `exp_channels_channel_field_groups`;
DROP TABLE IF EXISTS `exp_channels`;
DROP TABLE IF EXISTS `exp_channel_titles`;
DROP TABLE IF EXISTS `exp_channel_member_roles`;
DROP TABLE IF EXISTS `exp_channel_form_settings`;
DROP TABLE IF EXISTS `exp_channel_fields`;
DROP TABLE IF EXISTS `exp_channel_field_groups_fields`;
DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
DROP TABLE IF EXISTS `exp_channel_data`;
DROP TABLE IF EXISTS `exp_category_posts`;
DROP TABLE IF EXISTS `exp_category_groups`;
DROP TABLE IF EXISTS `exp_category_fields`;
DROP TABLE IF EXISTS `exp_category_field_data`;
DROP TABLE IF EXISTS `exp_categories`;
DROP TABLE IF EXISTS `exp_captcha`;
DROP TABLE IF EXISTS `exp_actions`;


CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  `field_settings` text,
  `legacy_field_data` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_field_groups_fields` (
  `field_id` int(6) unsigned NOT NULL,
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`field_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  `legacy_field_data` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`field_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_member_roles` (
  `role_id` int(10) NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_id` int(4) unsigned NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`),
  KEY `sticky_date_id_idx` (`sticky`,`entry_date`,`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(255) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_records` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `extra_publish_controls` char(1) NOT NULL DEFAULT 'n',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `title_field_label` varchar(100) NOT NULL DEFAULT 'Title',
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `preview_url` varchar(100) DEFAULT NULL,
  `max_entries` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channels_channel_field_groups` (
  `channel_id` int(4) unsigned NOT NULL,
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `exp_channels_channel_fields` (
  `channel_id` int(4) unsigned NOT NULL,
  `field_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `exp_channels_statuses` (
  `channel_id` int(4) unsigned NOT NULL,
  `status_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`),
  KEY `comment_date_idx` (`comment_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_config` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`config_id`),
  KEY `site_id` (`site_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `exp_consent_audit_log` (
  `consent_audit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `action` text NOT NULL,
  `log_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`consent_audit_id`),
  KEY `consent_request_id` (`consent_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_consent_request_versions` (
  `consent_request_version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_id` int(10) unsigned NOT NULL,
  `request` mediumtext,
  `request_format` tinytext,
  `create_date` int(10) NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`consent_request_version_id`),
  KEY `consent_request_id` (`consent_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_consent_requests` (
  `consent_request_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_version_id` int(10) unsigned DEFAULT NULL,
  `user_created` char(1) NOT NULL DEFAULT 'n',
  `title` varchar(200) NOT NULL,
  `consent_name` varchar(50) NOT NULL,
  `double_opt_in` char(1) NOT NULL DEFAULT 'n',
  `retention_period` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`consent_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_consents` (
  `consent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_id` int(10) unsigned NOT NULL,
  `consent_request_version_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `request_copy` mediumtext,
  `request_format` tinytext,
  `consent_given` char(1) NOT NULL DEFAULT 'n',
  `consent_given_via` varchar(32) DEFAULT NULL,
  `expiration_date` int(10) DEFAULT NULL,
  `response_date` int(10) DEFAULT NULL,
  PRIMARY KEY (`consent_id`),
  KEY `consent_request_version_id` (`consent_request_version_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) DEFAULT NULL,
  `template_group` varchar(100) DEFAULT NULL,
  `addon_module` varchar(100) DEFAULT NULL,
  `addon_method` varchar(100) DEFAULT NULL,
  `snippets` text,
  `hash` char(32) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(75) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `attachments` mediumtext,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(75) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(45) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  PRIMARY KEY (`file_id`,`cat_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `quality` tinyint(1) unsigned DEFAULT '90',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_fluid_field_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fluid_field_id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `field_data_id` int(11) unsigned NOT NULL,
  `order` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fluid_field_id` (`fluid_field_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_instructions` text,
  `col_required` char(1) DEFAULT NULL,
  `col_search` char(1) DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `layout_name` varchar(50) NOT NULL,
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_layout_publish_member_roles` (
  `layout_id` int(10) unsigned NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`layout_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_data_field_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `m_field_id_1` int(10) DEFAULT '0',
  `m_field_dt_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_field_ft_1` tinytext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) DEFAULT NULL,
  `m_field_width` varchar(6) DEFAULT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `m_field_exclude_from_anon` char(1) NOT NULL DEFAULT 'n',
  `m_field_order` int(3) unsigned NOT NULL,
  `m_field_text_direction` char(3) DEFAULT 'ltr',
  `m_field_settings` text,
  `m_legacy_field_data` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`m_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_news_views` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(10) DEFAULT NULL,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `time_format` char(2) DEFAULT NULL,
  `date_format` varchar(8) DEFAULT NULL,
  `include_seconds` char(1) DEFAULT NULL,
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `bookmarklets` text,
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) DEFAULT NULL,
  `cp_homepage_channel` varchar(255) DEFAULT NULL,
  `cp_homepage_custom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`role_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_members_role_groups` (
  `member_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `exp_members_roles` (
  `member_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `exp_menu_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `set_id` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `set_id` (`set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_menu_sets` (
  `set_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_module_member_roles` (
  `role_id` int(10) NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_permissions` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `site_id` int(5) unsigned NOT NULL,
  `permission` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `role_id_site_id` (`role_id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `exp_plugins` (
  `plugin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(50) NOT NULL,
  `plugin_package` varchar(50) NOT NULL,
  `plugin_version` varchar(12) NOT NULL,
  `is_typography_related` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `fluid_field_data_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_role_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `exp_role_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `menu_set_id` int(5) unsigned NOT NULL DEFAULT '1',
  `is_locked` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) DEFAULT NULL,
  `cp_homepage_channel` int(10) unsigned NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_roles` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `exp_roles_role_groups` (
  `role_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `fingerprint` varchar(40) NOT NULL,
  `login_state` varchar(32) DEFAULT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `auth_timeout` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `can_debug` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_type` varchar(16) DEFAULT NULL,
  `template_subtype` varchar(16) DEFAULT NULL,
  `template_data` text NOT NULL,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_statuses_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `status_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_template_groups_roles` (
  `role_id` int(10) NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_template_routes` (
  `route_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `route` varchar(512) DEFAULT NULL,
  `route_parsed` varchar(512) DEFAULT NULL,
  `route_required` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`route_id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `protect_javascript` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_templates_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exp_update_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `exp_update_notices` (
  `notice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_header` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `default_modal_view` varchar(5) NOT NULL DEFAULT 'list',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  `module_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_upload_prefs_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `upload_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


LOCK TABLES `exp_actions` WRITE;
ALTER TABLE `exp_actions` DISABLE KEYS;
INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`) VALUES 
	(1,'Channel','submit_entry',0),
	(2,'Channel','filemanager_endpoint',0),
	(3,'Channel','smiley_pop',0),
	(4,'Channel','combo_loader',0),
	(5,'Member','registration_form',0),
	(6,'Member','register_member',0),
	(7,'Member','activate_member',0),
	(8,'Member','member_login',0),
	(9,'Member','member_logout',0),
	(10,'Member','send_reset_token',0),
	(11,'Member','process_reset_password',0),
	(12,'Member','send_member_email',0),
	(13,'Member','update_un_pw',0),
	(14,'Member','member_search',0),
	(15,'Member','member_delete',0),
	(16,'Rte','get_js',0),
	(17,'Email','send_email',0),
	(18,'Comment','insert_new_comment',0),
	(19,'Comment_mcp','delete_comment_notification',0),
	(20,'Comment','comment_subscribe',0),
	(21,'Comment','edit_comment',0),
	(22,'Search','do_search',1);
ALTER TABLE `exp_actions` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_captcha` WRITE;
ALTER TABLE `exp_captcha` DISABLE KEYS;
ALTER TABLE `exp_captcha` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_categories` WRITE;
ALTER TABLE `exp_categories` DISABLE KEYS;
INSERT INTO `exp_categories` (`cat_id`, `site_id`, `group_id`, `parent_id`, `cat_name`, `cat_url_title`, `cat_description`, `cat_image`, `cat_order`) VALUES 
	(1,1,1,0,'News','news','','',2),
	(2,1,1,0,'Bands','bands','','',3),
	(3,1,2,0,'Staff Bios','staff_bios','','',2),
	(4,1,2,0,'Site Info','site_info','','',1);
ALTER TABLE `exp_categories` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_category_field_data` WRITE;
ALTER TABLE `exp_category_field_data` DISABLE KEYS;
INSERT INTO `exp_category_field_data` (`cat_id`, `site_id`, `group_id`) VALUES 
	(1,1,1),
	(2,1,1),
	(3,1,2),
	(4,1,2);
ALTER TABLE `exp_category_field_data` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_category_fields` WRITE;
ALTER TABLE `exp_category_fields` DISABLE KEYS;
ALTER TABLE `exp_category_fields` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_category_groups` WRITE;
ALTER TABLE `exp_category_groups` DISABLE KEYS;
INSERT INTO `exp_category_groups` (`group_id`, `site_id`, `group_name`, `sort_order`, `exclude_group`, `field_html_formatting`, `can_edit_categories`, `can_delete_categories`) VALUES 
	(1,1,'News Categories','a',0,'all','',''),
	(2,1,'About','a',0,'all','','');
ALTER TABLE `exp_category_groups` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_category_posts` WRITE;
ALTER TABLE `exp_category_posts` DISABLE KEYS;
INSERT INTO `exp_category_posts` (`entry_id`, `cat_id`) VALUES 
	(1,1),
	(2,1),
	(3,4),
	(4,3),
	(5,3),
	(6,3),
	(7,3),
	(8,3),
	(9,3),
	(10,2);
ALTER TABLE `exp_category_posts` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channel_data` WRITE;
ALTER TABLE `exp_channel_data` DISABLE KEYS;
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_1`, `field_ft_1`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES 
	(1,1,1,'Thank you for choosing ExpressionEngine! This entry contains helpful resources to help you <a href="https://ellislab.com/expressionengine/user-guide/intro/getting_the_most.html">get the most from ExpressionEngine</a> and the EllisLab Community.\n\n<strong>Learning resources:</strong>\n\n<a href="https://ellislab.com/expressionengine/user-guide/">ExpressionEngine User Guide</a>\n<a href="https://ellislab.com/expressionengine/user-guide/intro/the_big_picture.html">The Big Picture</a>\n<a href="https://ellislab.com/support">EllisLab Support</a>\n\nIf you need to hire a web developer consider our <a href="https://ellislab.com/pro-network/">Professionals Network</a>.\n\nWelcome to our community,\n\n<span style="font-size:16px;">The EllisLab Team</span>','xhtml','','xhtml','{filedir_2}ee_banner_120_240.gif','none','','xhtml','','none','','none','','xhtml'),
	(2,1,1,'Welcome to Agile Records, our Example Site.  Here you will be able to learn ExpressionEngine through a real site, with real features and in-depth comments to assist you along the way.\n\n','xhtml','','xhtml','{filedir_2}map.jpg','none','','xhtml','','none','','none','','xhtml'),
	(3,1,2,'',NULL,'',NULL,'',NULL,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis congue accumsan tellus. Aliquam diam arcu, suscipit eu, condimentum sed, ultricies accumsan, massa.\n','xhtml','{filedir_2}map2.jpg','none','','none','Donec et ante. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vestibulum dignissim dolor nec erat dictum posuere. Vivamus lacinia, quam id fringilla dapibus, ante ante bibendum nulla, a ornare nisl est congue purus. Duis pulvinar vehicula diam.\n\nSed vehicula. Praesent vitae nisi. Phasellus molestie, massa sed varius ultricies, dolor lectus interdum felis, ut porta eros nibh at magna. Cras aliquam vulputate lacus. Nullam tempus vehicula mi. Quisque posuere, erat quis iaculis consequat, tortor ipsum varius mauris, sit amet pulvinar nibh mauris sed lectus. Cras vitae arcu sit amet nunc luctus molestie. Nam neque orci, tincidunt non, semper convallis, sodales fringilla, nulla. Donec non nunc. Sed condimentum urna hendrerit erat. Curabitur in felis in neque fermentum interdum.\n\nProin magna. In in orci. Curabitur at lectus nec arcu vehicula bibendum. Duis euismod sollicitudin augue. Maecenas auctor cursus odio.\n','xhtml'),
	(4,1,2,'',NULL,'',NULL,'',NULL,'','xhtml','{filedir_2}staff_randell.png','none','Co-Owner/Label Manager','none','','xhtml'),
	(5,1,2,'',NULL,'',NULL,'',NULL,'','xhtml','{filedir_2}staff_chloe.png','none','Co-Owner / Press &amp; Marketing','none','','xhtml'),
	(6,1,2,'',NULL,'',NULL,'',NULL,'','xhtml','{filedir_2}staff_howard.png','none','Tours/Publicity/PR','none','','xhtml'),
	(7,1,2,'',NULL,'',NULL,'',NULL,'','xhtml','{filedir_2}staff_jane.png','none','Sales/Accounts','none','','xhtml'),
	(8,1,2,'',NULL,'',NULL,'',NULL,'','xhtml','{filedir_2}staff_josh.png','none','Product Manager','none','','xhtml'),
	(9,1,2,'',NULL,'',NULL,'',NULL,'','xhtml','{filedir_2}staff_jason.png','none','Graphic/Web Designer','none','','xhtml'),
	(10,1,1,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin congue mi a sapien. Duis augue erat, fringilla ac, volutpat ut, venenatis vitae, nisl. Phasellus lorem. Praesent mi. Suspendisse imperdiet felis a libero. uspendisse placerat tortor in ligula vestibulum vehicula.\n','xhtml','','xhtml','{filedir_2}testband300.jpg','none','',NULL,'',NULL,'',NULL,'',NULL);
ALTER TABLE `exp_channel_data` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channel_entries_autosave` WRITE;
ALTER TABLE `exp_channel_entries_autosave` DISABLE KEYS;
ALTER TABLE `exp_channel_entries_autosave` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channel_field_groups_fields` WRITE;
ALTER TABLE `exp_channel_field_groups_fields` DISABLE KEYS;
INSERT INTO `exp_channel_field_groups_fields` (`field_id`, `group_id`) VALUES 
	(1,1),
	(2,1),
	(3,1),
	(4,2),
	(5,2),
	(6,2),
	(7,2);
ALTER TABLE `exp_channel_field_groups_fields` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channel_fields` WRITE;
ALTER TABLE `exp_channel_fields` DISABLE KEYS;
INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`, `legacy_field_data`) VALUES 
	(1,1,'news_body','Body','','textarea','','n',0,0,10,0,'n','ltr','y','n','xhtml','y',2,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToieSI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6InkiO30=','y'),
	(2,1,'news_extended','Extended text','','textarea','','n',0,0,12,0,'n','ltr','n','y','xhtml','y',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToieSI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6InkiO30=','y'),
	(3,1,'news_image','News Image','','file','','n',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czo1OiJpbWFnZSI7fQ==','y'),
	(4,1,'about_body','Body','','textarea','','n',0,0,6,128,'n','ltr','n','n','xhtml','y',4,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToieSI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6InkiO30=','y'),
	(5,1,'about_image','Image','URL Only','file','','n',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YTo3OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czo1OiJpbWFnZSI7fQ==','y'),
	(6,1,'about_staff_title','Staff Member\'s Title','This is the Title that the staff member has within the company.  Example: CEO','text','','n',0,0,6,128,'n','ltr','y','n','none','n',6,'any','YTo4OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbnkiO30=','y'),
	(7,1,'about_extended','Extended','','textarea','','n',0,0,6,128,'n','ltr','y','y','xhtml','y',7,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToieSI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJ5IjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToieSI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6InkiO30=','y');
ALTER TABLE `exp_channel_fields` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channel_form_settings` WRITE;
ALTER TABLE `exp_channel_form_settings` DISABLE KEYS;
ALTER TABLE `exp_channel_form_settings` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channel_member_roles` WRITE;
ALTER TABLE `exp_channel_member_roles` DISABLE KEYS;
ALTER TABLE `exp_channel_member_roles` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channel_titles` WRITE;
ALTER TABLE `exp_channel_titles` DISABLE KEYS;
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `status_id`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES 
	(1,1,1,1,NULL,'127.0.0.1','Getting to Know ExpressionEngine','getting_to_know_expressionengine','open',1,'n',0,0,0,0,'y','n',1409242029,'2014','08','28',0,0,20140828160710,NULL,0),
	(2,1,1,1,NULL,'127.0.0.1','Welcome to the Example Site!','welcome_to_the_example_site','open',1,'n',0,0,0,0,'y','n',1409242030,'2014','08','28',0,0,20140828160710,NULL,0),
	(3,1,2,1,NULL,'127.0.0.1','About the Label','about_the_label','open',1,'n',0,0,0,0,'y','n',1409242030,'2014','08','28',0,0,20140828160710,NULL,0),
	(4,1,2,1,NULL,'127.0.0.1','Randell','randell','open',1,'n',0,0,0,0,'y','n',1409242030,'2014','08','28',0,0,20140828160710,NULL,0),
	(5,1,2,1,NULL,'127.0.0.1','Chloe','chloe','open',1,'n',0,0,0,0,'y','n',1409242030,'2014','08','28',0,0,20140828160710,NULL,0),
	(6,1,2,1,NULL,'127.0.0.1','Howard','howard','open',1,'n',0,0,0,0,'y','n',1409242030,'2014','08','28',0,0,20140828160710,NULL,0),
	(7,1,2,1,NULL,'127.0.0.1','Jane','jane','open',1,'n',0,0,0,0,'y','n',1409242030,'2014','08','28',0,0,20140828160710,NULL,0),
	(8,1,2,1,NULL,'127.0.0.1','Josh','josh','open',1,'n',0,0,0,0,'y','n',1409242030,'2014','08','28',0,0,20140828160710,NULL,0),
	(9,1,2,1,NULL,'127.0.0.1','Jason','jason','open',1,'n',0,0,0,0,'y','n',1409242030,'2014','08','28',0,0,20140828160710,NULL,0),
	(10,1,1,1,NULL,'127.0.0.1','Band Title','band_title','Featured',3,'n',0,0,0,0,'y','n',1409242030,'2014','08','28',0,0,20140828160710,NULL,0);
ALTER TABLE `exp_channel_titles` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channels` WRITE;
ALTER TABLE `exp_channels` DISABLE KEYS;
INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_records`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `deft_status`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `extra_publish_controls`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `title_field_label`, `url_title_prefix`, `preview_url`, `max_entries`) VALUES 
	(1,1,'news','News','http://ee2/index.php/news',NULL,'en',3,0,0,1409242030,0,'1','open',2,'2','y','y',0,'all','n','y','y','n','','http://ee2/index.php/news/comments','y','n','n',0,0,'y','xhtml','safe','n','y','n','n','',0,'http://ee2/index.php/news/comments','','n',10,'','Title','',NULL,0),
	(2,1,'about','Information Pages','http://ee2/index.php/about',NULL,'en',7,0,0,1409242030,0,'2','open',7,'','y','y',0,'all','n','y','n','n','','http://ee2/index.php/news/comments','n','n','n',0,0,'y','xhtml','safe','n','y','n','n','',0,'http://ee2/index.php/news/comments','','n',10,'','Title','',NULL,0);
ALTER TABLE `exp_channels` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channels_channel_field_groups` WRITE;
ALTER TABLE `exp_channels_channel_field_groups` DISABLE KEYS;
INSERT INTO `exp_channels_channel_field_groups` (`channel_id`, `group_id`) VALUES 
	(1,1),
	(2,2);
ALTER TABLE `exp_channels_channel_field_groups` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channels_channel_fields` WRITE;
ALTER TABLE `exp_channels_channel_fields` DISABLE KEYS;
ALTER TABLE `exp_channels_channel_fields` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_channels_statuses` WRITE;
ALTER TABLE `exp_channels_statuses` DISABLE KEYS;
INSERT INTO `exp_channels_statuses` (`channel_id`, `status_id`) VALUES 
	(1,1),
	(1,2),
	(1,3);
ALTER TABLE `exp_channels_statuses` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_comment_subscriptions` WRITE;
ALTER TABLE `exp_comment_subscriptions` DISABLE KEYS;
ALTER TABLE `exp_comment_subscriptions` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_comments` WRITE;
ALTER TABLE `exp_comments` DISABLE KEYS;
ALTER TABLE `exp_comments` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_config` WRITE;
ALTER TABLE `exp_config` DISABLE KEYS;
INSERT INTO `exp_config` (`config_id`, `site_id`, `key`, `value`) VALUES 
	(1,1,'image_resize_protocol','gd2'),
	(2,1,'image_library_path',''),
	(3,1,'thumbnail_prefix','thumb'),
	(4,1,'word_separator','dash'),
	(5,1,'use_category_name','n'),
	(6,1,'reserved_category_word','category'),
	(7,1,'auto_convert_high_ascii','n'),
	(8,1,'new_posts_clear_caches','y'),
	(9,1,'auto_assign_cat_parents','y'),
	(10,1,'enable_comments','y'),
	(11,1,'comment_word_censoring','n'),
	(12,1,'comment_moderation_override','n'),
	(13,1,'comment_edit_time_limit','0'),
	(14,1,'un_min_len','4'),
	(15,1,'pw_min_len','5'),
	(16,1,'allow_member_registration','n'),
	(17,1,'allow_member_localization','y'),
	(18,1,'req_mbr_activation','email'),
	(19,1,'new_member_notification','n'),
	(20,1,'mbr_notification_emails',''),
	(21,1,'require_terms_of_service','y'),
	(22,1,'default_member_group','5'),
	(23,1,'profile_trigger','member'),
	(24,1,'member_theme','default'),
	(25,1,'enable_avatars','y'),
	(26,1,'allow_avatar_uploads','n'),
	(27,1,'avatar_url','http://ee2/images/avatars/'),
	(28,1,'avatar_path','../images/avatars/'),
	(29,1,'avatar_max_width','100'),
	(30,1,'avatar_max_height','100'),
	(31,1,'avatar_max_kb','50'),
	(32,1,'enable_photos','n'),
	(33,1,'photo_url','http://ee2/images/member_photos/'),
	(34,1,'photo_path','/private/var/www/expressionengine/images/member_photos/'),
	(35,1,'photo_max_width','100'),
	(36,1,'photo_max_height','100'),
	(37,1,'photo_max_kb','50'),
	(38,1,'allow_signatures','y'),
	(39,1,'sig_maxlength','500'),
	(40,1,'sig_allow_img_hotlink','n'),
	(41,1,'sig_allow_img_upload','n'),
	(42,1,'sig_img_url','http://ee2/images/signature_attachments/'),
	(43,1,'sig_img_path','/private/var/www/expressionengine/images/signature_attachments/'),
	(44,1,'sig_img_max_width','480'),
	(45,1,'sig_img_max_height','80'),
	(46,1,'sig_img_max_kb','30'),
	(47,1,'prv_msg_upload_path','../images/pm_attachments/'),
	(48,1,'prv_msg_max_attachments','3'),
	(49,1,'prv_msg_attach_maxsize','250'),
	(50,1,'prv_msg_attach_total','100'),
	(51,1,'prv_msg_html_format','safe'),
	(52,1,'prv_msg_auto_links','y'),
	(53,1,'prv_msg_max_chars','6000'),
	(54,1,'memberlist_order_by','member_id'),
	(55,1,'memberlist_sort_order','desc'),
	(56,1,'memberlist_row_limit','20'),
	(57,1,'site_index','index.php'),
	(58,1,'site_url','http://ee2/'),
	(59,1,'theme_folder_url','http://ee2/themes/'),
	(60,1,'webmaster_email','kevin.cupp@gmail.com'),
	(61,1,'webmaster_name',''),
	(62,1,'channel_nomenclature','channel'),
	(63,1,'max_caches','150'),
	(64,1,'captcha_url','http://ee2/images/captchas/'),
	(65,1,'captcha_path','/private/var/www/expressionengine/images/captchas/'),
	(66,1,'captcha_font','y'),
	(67,1,'captcha_rand','y'),
	(68,1,'captcha_require_members','n'),
	(69,1,'enable_db_caching','n'),
	(70,1,'enable_sql_caching','n'),
	(71,1,'force_query_string','n'),
	(72,1,'show_profiler','n'),
	(73,1,'template_debugging','n'),
	(74,1,'include_seconds','n'),
	(75,1,'cookie_domain',''),
	(76,1,'cookie_path',''),
	(77,1,'website_session_type','c'),
	(78,1,'cp_session_type','c'),
	(79,1,'allow_username_change','y'),
	(80,1,'allow_multi_logins','y'),
	(81,1,'password_lockout','y'),
	(82,1,'password_lockout_interval','1'),
	(83,1,'require_ip_for_login','y'),
	(84,1,'require_ip_for_posting','y'),
	(85,1,'require_secure_passwords','n'),
	(86,1,'allow_dictionary_pw','y'),
	(87,1,'name_of_dictionary_file',''),
	(88,1,'xss_clean_uploads','y'),
	(89,1,'redirect_method','redirect'),
	(90,1,'deft_lang','english'),
	(91,1,'xml_lang','en'),
	(92,1,'send_headers','y'),
	(93,1,'gzip_output','n'),
	(94,1,'log_referrers','n'),
	(95,1,'max_referrers','500'),
	(96,1,'date_format','%n/%j/%Y'),
	(97,1,'time_format','12'),
	(98,1,'server_offset',''),
	(99,1,'default_site_timezone','America/New_York'),
	(100,1,'mail_protocol','mail'),
	(101,1,'smtp_server',''),
	(102,1,'smtp_username',''),
	(103,1,'smtp_password',''),
	(104,1,'email_debug','n'),
	(105,1,'email_charset','utf-8'),
	(106,1,'email_batchmode','n'),
	(107,1,'email_batch_size',''),
	(108,1,'mail_format','plain'),
	(109,1,'word_wrap','y'),
	(110,1,'email_console_timelock','5'),
	(111,1,'log_email_console_msgs','y'),
	(112,1,'cp_theme','default'),
	(113,1,'log_search_terms','y'),
	(114,1,'deny_duplicate_data','y'),
	(115,1,'redirect_submitted_links','n'),
	(116,1,'enable_censoring','n'),
	(117,1,'censored_words',''),
	(118,1,'censor_replacement',''),
	(119,1,'banned_ips',''),
	(120,1,'banned_emails',''),
	(121,1,'banned_usernames',''),
	(122,1,'banned_screen_names',''),
	(123,1,'ban_action','restrict'),
	(124,1,'ban_message','This site is currently unavailable'),
	(125,1,'ban_destination','http://www.yahoo.com/'),
	(126,1,'enable_emoticons','y'),
	(127,1,'emoticon_url','http://ee2/images/smileys/'),
	(128,1,'recount_batch_total','1000'),
	(129,1,'new_version_check','y'),
	(130,1,'enable_throttling','n'),
	(131,1,'banish_masked_ips','y'),
	(132,1,'max_page_loads','10'),
	(133,1,'time_interval','8'),
	(134,1,'lockout_time','30'),
	(135,1,'banishment_type','message'),
	(136,1,'banishment_url',''),
	(137,1,'banishment_message','You have exceeded the allowed page load frequency.'),
	(138,1,'enable_search_log','y'),
	(139,1,'max_logged_searches','500'),
	(140,1,'theme_folder_path','/private/var/www/expressionengine/themes/'),
	(141,1,'is_site_on','y'),
	(142,1,'rte_enabled','y'),
	(143,1,'rte_default_toolset_id','1'),
	(144,1,'cookie_httponly','y'),
	(145,1,'cookie_secure','n'),
	(146,1,'require_captcha','n'),
	(147,1,'email_newline','\\n'),
	(148,1,'email_smtp_crypto','ssl'),
	(149,1,'enable_template_routes','y'),
	(150,1,'strict_urls','y'),
	(151,1,'site_404','about/404'),
	(152,1,'save_tmpl_revisions','n'),
	(153,1,'max_tmpl_revisions','5'),
	(154,1,'tmpl_file_basepath','/'),
	(155,0,'cache_driver','dummy'),
	(156,0,'debug','1'),
	(157,0,'force_redirect','n'),
	(158,0,'is_system_on','y'),
	(159,0,'multiple_sites_enabled','y');
ALTER TABLE `exp_config` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_consent_audit_log` WRITE;
ALTER TABLE `exp_consent_audit_log` DISABLE KEYS;
ALTER TABLE `exp_consent_audit_log` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_consent_request_versions` WRITE;
ALTER TABLE `exp_consent_request_versions` DISABLE KEYS;
ALTER TABLE `exp_consent_request_versions` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_consent_requests` WRITE;
ALTER TABLE `exp_consent_requests` DISABLE KEYS;
ALTER TABLE `exp_consent_requests` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_consents` WRITE;
ALTER TABLE `exp_consents` DISABLE KEYS;
ALTER TABLE `exp_consents` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_content_types` WRITE;
ALTER TABLE `exp_content_types` DISABLE KEYS;
INSERT INTO `exp_content_types` (`content_type_id`, `name`) VALUES 
	(2,'channel'),
	(1,'grid');
ALTER TABLE `exp_content_types` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_cp_log` WRITE;
ALTER TABLE `exp_cp_log` DISABLE KEYS;
INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES 
	(1,1,0,'0','127.0.0.1',1536684571,'Changed password for "admin" (1)'),
	(2,1,1,'admin','127.0.0.1',1536684571,'Logged in');
ALTER TABLE `exp_cp_log` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_developer_log` WRITE;
ALTER TABLE `exp_developer_log` DISABLE KEYS;
ALTER TABLE `exp_developer_log` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_email_cache` WRITE;
ALTER TABLE `exp_email_cache` DISABLE KEYS;
ALTER TABLE `exp_email_cache` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_email_cache_mg` WRITE;
ALTER TABLE `exp_email_cache_mg` DISABLE KEYS;
ALTER TABLE `exp_email_cache_mg` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_email_cache_ml` WRITE;
ALTER TABLE `exp_email_cache_ml` DISABLE KEYS;
ALTER TABLE `exp_email_cache_ml` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_email_console_cache` WRITE;
ALTER TABLE `exp_email_console_cache` DISABLE KEYS;
ALTER TABLE `exp_email_console_cache` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_email_tracker` WRITE;
ALTER TABLE `exp_email_tracker` DISABLE KEYS;
ALTER TABLE `exp_email_tracker` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_entry_versioning` WRITE;
ALTER TABLE `exp_entry_versioning` DISABLE KEYS;
ALTER TABLE `exp_entry_versioning` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_extensions` WRITE;
ALTER TABLE `exp_extensions` DISABLE KEYS;
INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES 
	(1,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0.1','y'),
	(2,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0.1','y');
ALTER TABLE `exp_extensions` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_field_groups` WRITE;
ALTER TABLE `exp_field_groups` DISABLE KEYS;
INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES 
	(1,1,'News'),
	(2,1,'About');
ALTER TABLE `exp_field_groups` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_fieldtypes` WRITE;
ALTER TABLE `exp_fieldtypes` DISABLE KEYS;
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES 
	(1,'select','1.0.0','YTowOnt9','n'),
	(2,'text','1.0.0','YTowOnt9','n'),
	(3,'textarea','1.0.0','YTowOnt9','n'),
	(4,'date','1.0.0','YTowOnt9','n'),
	(5,'file','1.0.0','YTowOnt9','n'),
	(6,'grid','1.0.0','YTowOnt9','n'),
	(7,'multi_select','1.0.0','YTowOnt9','n'),
	(8,'checkboxes','1.0.0','YTowOnt9','n'),
	(9,'radio','1.0.0','YTowOnt9','n'),
	(10,'relationship','1.0.0','YTowOnt9','n'),
	(11,'rte','1.0.0','YTowOnt9','n'),
	(12,'url','1.0.0','YTowOnt9','n'),
	(13,'email_address','1.0.0','YTowOnt9','n'),
	(14,'toggle','1.0.0','YTowOnt9','n'),
	(15,'fluid_field','1.0.0','YTowOnt9','n');
ALTER TABLE `exp_fieldtypes` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_file_categories` WRITE;
ALTER TABLE `exp_file_categories` DISABLE KEYS;
ALTER TABLE `exp_file_categories` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_file_dimensions` WRITE;
ALTER TABLE `exp_file_dimensions` DISABLE KEYS;
ALTER TABLE `exp_file_dimensions` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_file_watermarks` WRITE;
ALTER TABLE `exp_file_watermarks` DISABLE KEYS;
ALTER TABLE `exp_file_watermarks` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_files` WRITE;
ALTER TABLE `exp_files` DISABLE KEYS;
INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES 
	(1,1,'staff_jane.png',2,'image/png','staff_jane.png',51612,NULL,NULL,NULL,1,1302889304,1,1302889304,''),
	(2,1,'staff_jason.png',2,'image/png','staff_jason.png',51430,NULL,NULL,NULL,1,1302888304,1,1302888304,''),
	(3,1,'staff_josh.png',2,'image/png','staff_josh.png',50638,NULL,NULL,NULL,1,1302887304,1,1302887304,''),
	(4,1,'staff_randell.png',2,'image/png','staff_randell.png',51681,NULL,NULL,NULL,1,1302886304,1,1302886304,''),
	(5,1,'ee_banner_120_240.gif',2,'image/gif','ee_banner_120_240.gif',9257,NULL,NULL,NULL,1,1302885304,1,1302885304,''),
	(6,1,'testband300.jpg',2,'image/jpeg','testband300.jpg',23986,NULL,NULL,NULL,1,1302884304,1,1302884304,''),
	(7,1,'map.jpg',2,'image/jpeg','map.jpg',71299,NULL,NULL,NULL,1,1302883304,1,1302883304,''),
	(8,1,'map2.jpg',2,'image/jpeg','map2.jpg',49175,NULL,NULL,NULL,1,1302882304,1,1302882304,''),
	(9,1,'staff_chloe.png',2,'image/png','staff_chloe.png',50262,NULL,NULL,NULL,1,1302881304,1,1302881304,''),
	(10,1,'staff_howard.png',2,'image/png','staff_howard.png',51488,NULL,NULL,NULL,1,1302880304,1,1302880304,''),
	(11,1,'avatar_tree_hugger_color.png',3,'image/png','avatar_tree_hugger_color.png',7529,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(12,1,'bad_fur_day.jpg',3,'image/jpeg','bad_fur_day.jpg',15766,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(13,1,'big_horns.jpg',3,'image/jpeg','big_horns.jpg',20631,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(14,1,'eat_it_up.jpg',3,'image/jpeg','eat_it_up.jpg',23085,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(15,1,'ee_paint.jpg',3,'image/jpeg','ee_paint.jpg',24029,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(16,1,'expression_radar.jpg',3,'image/jpeg','expression_radar.jpg',3692,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(17,1,'flying_high.jpg',3,'image/jpeg','flying_high.jpg',13743,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(18,1,'hair.png',3,'image/png','hair.png',4974,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(19,1,'hanging_out.jpg',3,'image/jpeg','hanging_out.jpg',19150,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(20,1,'hello_prey.jpg',3,'image/jpeg','hello_prey.jpg',14282,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(21,1,'light_blur.jpg',3,'image/jpeg','light_blur.jpg',23949,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(22,1,'ninjagirl.png',3,'image/png','ninjagirl.png',9756,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(23,1,'procotopus.png',3,'image/png','procotopus.png',6456,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(24,1,'sneak_squirrel.jpg',3,'image/jpeg','sneak_squirrel.jpg',19542,NULL,NULL,NULL,1,1432910425,1,1432910425,''),
	(25,1,'zombie_bunny.png',3,'image/png','zombie_bunny.png',6830,NULL,NULL,NULL,1,1432910425,1,1432910425,'');
ALTER TABLE `exp_files` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_fluid_field_data` WRITE;
ALTER TABLE `exp_fluid_field_data` DISABLE KEYS;
ALTER TABLE `exp_fluid_field_data` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_global_variables` WRITE;
ALTER TABLE `exp_global_variables` DISABLE KEYS;
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`, `edit_date`) VALUES 
	(1,1,'.htaccess','deny from all',0),
	(2,1,'branding_begin','<div id="branding">\n	<div id="branding_logo"></div>\n	<div id="branding_sub">\n		<h1><a href="{site_url}" title="Agile Records Home"></a></h1>',0),
	(3,1,'branding_end','</div> <!-- ending #branding_sub -->\n</div> <!-- ending #branding -->',0),
	(4,1,'comment_guidelines','<div id="comment_guidelines">\n	<h6>Comment Guidelines</h6>\n	<p>Basic HTML formatting permitted - <br />\n		<code>&lt;ul&gt;</code>, <code>&lt;li&gt;</code>, <code>&lt;strong&gt;</code>, <code>&lt;em&gt;</code>, <code>&lt;a href&gt;</code>, <code>&lt;blockquote&gt;</code>, <code>&lt;code&gt;</code></p>\n</div>',0),
	(5,1,'favicon','<!-- Favicon -->\n',0),
	(6,1,'html_close','</body>\n</html>',0),
	(7,1,'html_head','<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n',0),
	(8,1,'html_head_end','</head>\n',0),
	(9,1,'js','<!-- JS -->\n<script src="http://code.jquery.com/jquery-1.12.1.min.js" type="text/javascript"></script>\n<script src="{site_url}themes/site/default/js/onload.js" type="text/javascript"></script>',0),
	(10,1,'nav_access','<ul id="nav_access">\n	<li><a href="#navigation">Skip to navigation</a></li>\n	<li><a href="#primary_content_wrapper">Skip to content</a></li>\n</ul>',0),
	(11,1,'rss','<!-- RSS -->\n<link href="{path=news/rss}" rel="alternate" type="application/rss+xml" title="RSS Feed" />',0),
	(12,1,'rss_links','<h5>RSS Feeds <img src="{site_url}themes/site/default/images/rss12.gif" alt="RSS Icon" class="rssicon" /></h5>\n		<div id="news_rss">\n			<p>Subscribe to our RSS Feeds</p>\n			<ul>\n				<li><a href="{path=\'news/rss\'}">News RSS Feed</a></li>\n				<li><a href="{path=\'news/atom\'}">News ATOM Feed</a></li>\n			</ul>\n		</div>',0),
	(13,1,'wrapper_begin','<div id="page">\n<div id="content_wrapper">',0),
	(14,1,'wrapper_close','</div> <!-- ending #content_wrapper -->\n</div> <!-- ending #page -->',0);
ALTER TABLE `exp_global_variables` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_grid_columns` WRITE;
ALTER TABLE `exp_grid_columns` DISABLE KEYS;
ALTER TABLE `exp_grid_columns` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_html_buttons` WRITE;
ALTER TABLE `exp_html_buttons` DISABLE KEYS;
INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES 
	(1,1,0,'Bold text','<strong>','</strong>','b',1,'1','html-bold'),
	(2,1,0,'Italic text','<em>','</em>','i',2,'1','html-italic'),
	(3,1,0,'Blockquote','<blockquote>','</blockquote>','q',3,'1','html-quote'),
	(4,1,0,'Link','<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>','</a>','a',4,'1','html-link'),
	(5,1,0,'Image','<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />','','',5,'1','html-upload');
ALTER TABLE `exp_html_buttons` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_layout_publish` WRITE;
ALTER TABLE `exp_layout_publish` DISABLE KEYS;
ALTER TABLE `exp_layout_publish` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_layout_publish_member_roles` WRITE;
ALTER TABLE `exp_layout_publish_member_roles` DISABLE KEYS;
ALTER TABLE `exp_layout_publish_member_roles` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_member_bulletin_board` WRITE;
ALTER TABLE `exp_member_bulletin_board` DISABLE KEYS;
ALTER TABLE `exp_member_bulletin_board` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_member_data` WRITE;
ALTER TABLE `exp_member_data` DISABLE KEYS;
INSERT INTO `exp_member_data` (`member_id`) VALUES 
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7);
ALTER TABLE `exp_member_data` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_member_data_field_1` WRITE;
ALTER TABLE `exp_member_data_field_1` DISABLE KEYS;
INSERT INTO `exp_member_data_field_1` (`id`, `member_id`, `m_field_id_1`, `m_field_dt_1`, `m_field_ft_1`) VALUES 
	(1,1,0,NULL,NULL),
	(2,2,-24966000,NULL,NULL),
	(3,3,0,NULL,NULL),
	(4,4,0,NULL,NULL),
	(5,5,0,NULL,NULL),
	(6,6,0,NULL,NULL),
	(7,7,0,NULL,NULL);
ALTER TABLE `exp_member_data_field_1` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_member_fields` WRITE;
ALTER TABLE `exp_member_fields` DISABLE KEYS;
INSERT INTO `exp_member_fields` (`m_field_id`, `m_field_name`, `m_field_label`, `m_field_description`, `m_field_type`, `m_field_list_items`, `m_field_ta_rows`, `m_field_maxl`, `m_field_width`, `m_field_search`, `m_field_required`, `m_field_public`, `m_field_reg`, `m_field_cp_reg`, `m_field_fmt`, `m_field_show_fmt`, `m_field_exclude_from_anon`, `m_field_order`, `m_field_text_direction`, `m_field_settings`, `m_legacy_field_data`) VALUES 
	(1,'birthday','Birthday','','date','',8,NULL,NULL,'y','n','y','n','n','none','y','n',1,'ltr',NULL,'n');
ALTER TABLE `exp_member_fields` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_member_news_views` WRITE;
ALTER TABLE `exp_member_news_views` DISABLE KEYS;
ALTER TABLE `exp_member_news_views` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_member_search` WRITE;
ALTER TABLE `exp_member_search` DISABLE KEYS;
ALTER TABLE `exp_member_search` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_members` WRITE;
ALTER TABLE `exp_members` DISABLE KEYS;
INSERT INTO `exp_members` (`member_id`, `role_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `include_seconds`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`) VALUES 
	(1,1,'admin','Admin','747457c3815a37196393e7a33eaa3cace09d9f2a46ce4ca4befa99c6527b7e9b666d7a82208ca65125bf15351bb430ede79e3466a6451933359e5b63bcc72899','4EWnhiBpyw$+q?P+NO7IcPJS}";gP!WGv2RT&XP7)The*.=OY#,Z=W8B%iR)JAT9dQ~(_/rn\\R?DO0T~iK*|JXRc#AgCh"1Tybz8mnuz}+~AEi\'{vq1X`q99Qsein!IJ','bc62f762437a95f19b722924b85f76bc19fb6430','996c9188208037b2c026f72e04b7b6e13d415fbb',NULL,'kevin.cupp@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.0.1',1409242030,1536684571,1536684571,10,0,0,0,1409242030,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/New_York','12','%n/%j/%Y','n',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,'',NULL,'n',0,'y',0,NULL,NULL,NULL),
	(2,1,'robin','Robin Screen','5zaa61e4c9b93f3f0682250b6cf8331b7ee68fd8','','bz62f762437a95f19b722924b85f76bc19fb6430',NULL,NULL,'mediacow@localhost',NULL,'procotopus.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',1,'y',0,0,'127.0.0.1',1465853984,1491259180,1491324114,83,10,7,4,0,1469650137,1487020433,0,'n','y','y','y','y','y','y','n','y','english','America/New_York','12','%n/%j/%Y','n',NULL,NULL,'Shares',NULL,'28',NULL,'18',NULL,'Query Results|index.php?/cp/utilities/query|1\nOffsite 2|http://test.com|4',NULL,'n',0,'y',0,'entries_edit','{"1":"1","2":"14","3":"8"}',''),
	(3,2,'banned1','Banned 1','5aaa61e4c9b93f3f0682250b6cf8331b7ee68fd8','','by62f762437a95f19b722924b85f76bc19fb6430',NULL,NULL,'edit2@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.0.1',1484840926,0,0,2,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL),
	(4,4,'pending1','Pending 1','5daa61e4c9b93f3f0682250b6cf8331b7ee68fd8','','bx62f762437a95f19b722924b85f76bc19fb6430',NULL,NULL,'edit5@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.0.1',1484841088,0,0,2,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL),
	(5,4,'pending2','Pending 2','5eaa61e4c9b93f3f0682250b6cf8331b7ee68fd8','','bm62f762437a95f19b722924b85f76bc19fb6430',NULL,NULL,'edit6@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.0.1',1485306436,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL),
	(6,5,'member1','Member 1','5faa61e4c9b93f3f0682250b6cf8331b7ee68fd8','','bn62f762437a95f19b722924b85f76bc19fb6430',NULL,NULL,'editor7@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.0.1',1485306584,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL),
	(7,5,'member2','Member 2','5gaa61e4c9b93f3f0682250b6cf8331b7ee68fd8','','bo62f762437a95f19b722924b85f76bc19fb6430',NULL,NULL,'editor8@localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.0.1',1485307720,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,NULL,'n',0,'y',0,NULL,NULL,NULL);
ALTER TABLE `exp_members` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_members_role_groups` WRITE;
ALTER TABLE `exp_members_role_groups` DISABLE KEYS;
ALTER TABLE `exp_members_role_groups` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_members_roles` WRITE;
ALTER TABLE `exp_members_roles` DISABLE KEYS;
INSERT INTO `exp_members_roles` (`member_id`, `role_id`) VALUES 
	(1,1),
	(2,1),
	(3,2),
	(4,4),
	(5,4),
	(6,5),
	(7,5);
ALTER TABLE `exp_members_roles` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_menu_items` WRITE;
ALTER TABLE `exp_menu_items` DISABLE KEYS;
ALTER TABLE `exp_menu_items` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_menu_sets` WRITE;
ALTER TABLE `exp_menu_sets` DISABLE KEYS;
ALTER TABLE `exp_menu_sets` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_message_attachments` WRITE;
ALTER TABLE `exp_message_attachments` DISABLE KEYS;
ALTER TABLE `exp_message_attachments` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_message_copies` WRITE;
ALTER TABLE `exp_message_copies` DISABLE KEYS;
ALTER TABLE `exp_message_copies` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_message_data` WRITE;
ALTER TABLE `exp_message_data` DISABLE KEYS;
ALTER TABLE `exp_message_data` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_message_folders` WRITE;
ALTER TABLE `exp_message_folders` DISABLE KEYS;
ALTER TABLE `exp_message_folders` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_message_listed` WRITE;
ALTER TABLE `exp_message_listed` DISABLE KEYS;
ALTER TABLE `exp_message_listed` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_module_member_roles` WRITE;
ALTER TABLE `exp_module_member_roles` DISABLE KEYS;
ALTER TABLE `exp_module_member_roles` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_modules` WRITE;
ALTER TABLE `exp_modules` DISABLE KEYS;
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES 
	(1,'Emoticon','2.0.0','n','n'),
	(2,'Jquery','1.0.0','n','n'),
	(3,'Channel','2.0.1','n','n'),
	(4,'Member','2.1.0','n','n'),
	(5,'Stats','2.0.0','n','n'),
	(6,'Rte','1.0.1','y','n'),
	(7,'Email','2.0.0','n','n'),
	(8,'Rss','2.0.0','n','n'),
	(9,'Comment','2.3.2','y','n'),
	(10,'Search','2.2.2','n','n'),
	(11,'FilePicker','1.0.0','y','n');
ALTER TABLE `exp_modules` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_online_users` WRITE;
ALTER TABLE `exp_online_users` DISABLE KEYS;
ALTER TABLE `exp_online_users` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_password_lockout` WRITE;
ALTER TABLE `exp_password_lockout` DISABLE KEYS;
ALTER TABLE `exp_password_lockout` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_permissions` WRITE;
ALTER TABLE `exp_permissions` DISABLE KEYS;
INSERT INTO `exp_permissions` (`permission_id`, `role_id`, `site_id`, `permission`) VALUES 
	(1,1,1,'can_view_offline_system'),
	(2,1,1,'can_view_online_system'),
	(3,1,1,'can_access_cp'),
	(4,1,1,'can_access_footer_report_bug'),
	(5,1,1,'can_access_footer_new_ticket'),
	(6,1,1,'can_access_footer_user_guide'),
	(7,1,1,'can_view_homepage_news'),
	(8,1,1,'can_access_files'),
	(9,1,1,'can_access_design'),
	(10,1,1,'can_access_addons'),
	(11,1,1,'can_access_members'),
	(12,1,1,'can_access_sys_prefs'),
	(13,1,1,'can_access_comm'),
	(14,1,1,'can_access_utilities'),
	(15,1,1,'can_access_data'),
	(16,1,1,'can_access_logs'),
	(17,1,1,'can_admin_channels'),
	(18,1,1,'can_admin_design'),
	(19,1,1,'can_delete_members'),
	(20,1,1,'can_admin_mbr_groups'),
	(21,1,1,'can_admin_mbr_templates'),
	(22,1,1,'can_ban_users'),
	(23,1,1,'can_admin_addons'),
	(24,1,1,'can_edit_categories'),
	(25,1,1,'can_delete_categories'),
	(26,1,1,'can_view_other_entries'),
	(27,1,1,'can_edit_other_entries'),
	(28,1,1,'can_assign_post_authors'),
	(29,1,1,'can_delete_self_entries'),
	(30,1,1,'can_delete_all_entries'),
	(31,1,1,'can_view_other_comments'),
	(32,1,1,'can_edit_own_comments'),
	(33,1,1,'can_delete_own_comments'),
	(34,1,1,'can_edit_all_comments'),
	(35,1,1,'can_delete_all_comments'),
	(36,1,1,'can_moderate_comments'),
	(37,1,1,'can_send_cached_email'),
	(38,1,1,'can_email_member_groups'),
	(39,1,1,'can_email_from_profile'),
	(40,1,1,'can_view_profiles'),
	(41,1,1,'can_edit_html_buttons'),
	(42,1,1,'can_delete_self'),
	(43,1,1,'can_send_private_messages'),
	(44,1,1,'can_attach_in_private_messages'),
	(45,1,1,'can_send_bulletins'),
	(46,1,1,'can_upload_new_files'),
	(47,1,1,'can_edit_files'),
	(48,1,1,'can_delete_files'),
	(49,1,1,'can_upload_new_toolsets'),
	(50,1,1,'can_edit_toolsets'),
	(51,1,1,'can_delete_toolsets'),
	(52,1,1,'can_create_upload_directories'),
	(53,1,1,'can_edit_upload_directories'),
	(54,1,1,'can_delete_upload_directories'),
	(55,1,1,'can_create_channels'),
	(56,1,1,'can_edit_channels'),
	(57,1,1,'can_delete_channels'),
	(58,1,1,'can_create_channel_fields'),
	(59,1,1,'can_edit_channel_fields'),
	(60,1,1,'can_delete_channel_fields'),
	(61,1,1,'can_create_statuses'),
	(62,1,1,'can_delete_statuses'),
	(63,1,1,'can_edit_statuses'),
	(64,1,1,'can_create_categories'),
	(65,1,1,'can_create_member_groups'),
	(66,1,1,'can_delete_member_groups'),
	(67,1,1,'can_edit_member_groups'),
	(68,1,1,'can_create_members'),
	(69,1,1,'can_edit_members'),
	(70,1,1,'can_create_new_templates'),
	(71,1,1,'can_edit_templates'),
	(72,1,1,'can_delete_templates'),
	(73,1,1,'can_create_template_groups'),
	(74,1,1,'can_edit_template_groups'),
	(75,1,1,'can_delete_template_groups'),
	(76,1,1,'can_create_template_partials'),
	(77,1,1,'can_edit_template_partials'),
	(78,1,1,'can_delete_template_partials'),
	(79,1,1,'can_create_template_variables'),
	(80,1,1,'can_delete_template_variables'),
	(81,1,1,'can_edit_template_variables'),
	(82,1,1,'can_moderate_spam'),
	(83,1,1,'can_manage_consents'),
	(84,2,1,'can_view_homepage_news'),
	(85,3,1,'can_view_online_system'),
	(86,3,1,'can_view_homepage_news'),
	(87,4,1,'can_view_online_system'),
	(88,4,1,'can_view_homepage_news'),
	(89,5,1,'can_view_online_system'),
	(90,5,1,'can_view_homepage_news'),
	(91,5,1,'can_email_from_profile'),
	(92,5,1,'can_view_profiles'),
	(93,5,1,'can_edit_html_buttons'),
	(94,5,1,'can_delete_self'),
	(95,5,1,'can_send_private_messages'),
	(96,5,1,'can_attach_in_private_messages');
ALTER TABLE `exp_permissions` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_plugins` WRITE;
ALTER TABLE `exp_plugins` DISABLE KEYS;
ALTER TABLE `exp_plugins` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_relationships` WRITE;
ALTER TABLE `exp_relationships` DISABLE KEYS;
ALTER TABLE `exp_relationships` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_remember_me` WRITE;
ALTER TABLE `exp_remember_me` DISABLE KEYS;
ALTER TABLE `exp_remember_me` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_reset_password` WRITE;
ALTER TABLE `exp_reset_password` DISABLE KEYS;
ALTER TABLE `exp_reset_password` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_revision_tracker` WRITE;
ALTER TABLE `exp_revision_tracker` DISABLE KEYS;
ALTER TABLE `exp_revision_tracker` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_role_groups` WRITE;
ALTER TABLE `exp_role_groups` DISABLE KEYS;
ALTER TABLE `exp_role_groups` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_role_settings` WRITE;
ALTER TABLE `exp_role_settings` DISABLE KEYS;
INSERT INTO `exp_role_settings` (`id`, `role_id`, `site_id`, `menu_set_id`, `is_locked`, `mbr_delete_notify_emails`, `exclude_from_moderation`, `search_flood_control`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`) VALUES 
	(1,1,1,1,'n',NULL,'y',0,20,60,'y','y',NULL,0,NULL),
	(2,2,1,1,'n',NULL,'n',60,20,60,'n','n',NULL,0,NULL),
	(3,3,1,1,'n',NULL,'n',10,20,60,'n','y',NULL,0,NULL),
	(4,4,1,1,'n',NULL,'n',10,20,60,'n','y',NULL,0,NULL),
	(5,5,1,1,'n',NULL,'n',10,20,60,'n','y',NULL,0,NULL);
ALTER TABLE `exp_role_settings` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_roles` WRITE;
ALTER TABLE `exp_roles` DISABLE KEYS;
INSERT INTO `exp_roles` (`role_id`, `name`, `description`) VALUES 
	(1,'Super Admin',''),
	(2,'Banned',''),
	(3,'Guests',''),
	(4,'Pending',''),
	(5,'Members','');
ALTER TABLE `exp_roles` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_roles_role_groups` WRITE;
ALTER TABLE `exp_roles_role_groups` DISABLE KEYS;
ALTER TABLE `exp_roles_role_groups` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_rte_tools` WRITE;
ALTER TABLE `exp_rte_tools` DISABLE KEYS;
INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`) VALUES 
	(1,'Blockquote','Blockquote_rte','y'),
	(2,'Bold','Bold_rte','y'),
	(3,'Headings','Headings_rte','y'),
	(4,'Image','Image_rte','y'),
	(5,'Italic','Italic_rte','y'),
	(6,'Link','Link_rte','y'),
	(7,'Ordered List','Ordered_list_rte','y'),
	(8,'Underline','Underline_rte','y'),
	(9,'Unordered List','Unordered_list_rte','y'),
	(10,'View Source','View_source_rte','y');
ALTER TABLE `exp_rte_tools` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_rte_toolsets` WRITE;
ALTER TABLE `exp_rte_toolsets` DISABLE KEYS;
INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`) VALUES 
	(1,0,'Default','3|2|5|1|9|7|6|4|10','y');
ALTER TABLE `exp_rte_toolsets` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_search` WRITE;
ALTER TABLE `exp_search` DISABLE KEYS;
ALTER TABLE `exp_search` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_search_log` WRITE;
ALTER TABLE `exp_search_log` DISABLE KEYS;
ALTER TABLE `exp_search_log` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_security_hashes` WRITE;
ALTER TABLE `exp_security_hashes` DISABLE KEYS;
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES 
	(1,1536684571,'a89ccd7d2aa8a5284b787c1db4fb972f668d0892','9b88257b83b75c5f09e4572ed2bd04380428f81e');
ALTER TABLE `exp_security_hashes` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_sessions` WRITE;
ALTER TABLE `exp_sessions` DISABLE KEYS;
INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `fingerprint`, `login_state`, `sess_start`, `auth_timeout`, `last_activity`, `can_debug`) VALUES 
	('a89ccd7d2aa8a5284b787c1db4fb972f668d0892',1,1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15','787fea869f36cb95787a904d018d22cd',NULL,1536684571,0,1536684571,'0');
ALTER TABLE `exp_sessions` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_sites` WRITE;
ALTER TABLE `exp_sites` DISABLE KEYS;
INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_bootstrap_checksums`, `site_pages`) VALUES 
	(1,'EE3','default_site',NULL,'YToxOntzOjc6ImVtYWlsZWQiO2E6MDp7fX0=','');
ALTER TABLE `exp_sites` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_snippets` WRITE;
ALTER TABLE `exp_snippets` DISABLE KEYS;
INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`, `edit_date`) VALUES 
	(1,1,'.htaccess','deny from all',0),
	(2,1,'global_edit_this','{if author_id == logged_in_member_id OR logged_in_group_id == "1"}&bull; <a href="{cp_url}?S={cp_session_id}&amp;D=cp&amp;C=content_publish&amp;M=entry_form&amp;channel_id={channel_id}&amp;entry_id={entry_id}">Edit This</a>{/if}',0),
	(3,1,'global_featured_band','<div id="featured_band">\n    <h2>Featured Band</h2>\n    {exp:channel:entries channel="news" limit="1" status="featured" rdf="off" disable="trackbacks" category="2" dynamic="no"}\n    <div class="image">\n        <h4><a href="{comment_url_title_auto_path}"><span>{title}</span></a></h4>\n        {if news_image}\n			<img src="{news_image}" alt="{title}"/>\n		{/if}\n    </div>\n    {news_body}\n    {/exp:channel:entries}\n</div>',0),
	(4,1,'global_featured_welcome','<div id="welcome">\n    {exp:channel:entries channel="about" url_title="about_the_label" dynamic="no"  limit="1" disable="pagination|member_date|categories|category_fields|trackbacks"}\n    {if about_image != ""}\n        <img src="{about_image}" alt="map" width="210" height="170" />\n    {/if}\n    {about_body}\n    <a href="{comment_url_title_auto_path}">Read more about us</a>\n    {/exp:channel:entries}\n</div>',0),
	(5,1,'global_footer','<div id="siteinfo">\n    <p>Copyright @ {exp:channel:entries limit="1" sort="asc" disable="custom_fields|comments|pagination|categories"}\n\n{if "{entry_date format=\'%Y\'}" != "{current_time format=\'%Y\'}"}{entry_date format="%Y"} - {/if}{/exp:channel:entries} {current_time format="%Y"}, powered by <a href="http://expressionengine.com">ExpressionEngine</a></p>\n    <p class="logo"><a href="#">Agile Records</a></p>\n	{if group_id == "1"}<p>{total_queries} queries in {elapsed_time} seconds</p>{/if}\n</div> <!-- ending #siteinfo -->',0),
	(6,1,'global_strict_urls','<!-- Strict URLS: https://ellislab.com/expressionengine/user-guide/cp/templates/global_template_preferences.html -->\n{if segment_2 != \'\'}\n  {redirect="404"}\n{/if}',0),
	(7,1,'global_stylesheets','<!-- CSS -->\n<!-- This makes use of the stylesheet= parameter, which automatically appends a time stamp to allow for the browser\'s caching mechanism to cache the stylesheet.  This allows for faster page-loads times.\nStylesheet linking is documented at https://ellislab.com/expressionengine/user-guide/templates/globals/stylesheet.html -->\n    <link href="{stylesheet=global_embeds/site_css}" type="text/css" rel="stylesheet" media="screen" />\n    <!--[if IE 6]><link href="{stylesheet=global_embeds/css_screen-ie6}" type="text/css" rel="stylesheet" media="screen" /><![endif]-->\n    <!--[if IE 7]><link href="{stylesheet=global_embeds/css_screen-ie7}" type="text/css" rel="stylesheet" media="screen" /><![endif]-->\n',0),
	(8,1,'global_top_member','<div id="member">\n\n	<!-- Utilized member conditionals: https://ellislab.com/expressionengine/user-guide/templates/globals/conditionals.html-->\n            <h4>Hello{if logged_in} {screen_name}{/if}!</h4>\n            {if is_core == FALSE}\n			<ul>\n				{if logged_in}\n                <li><a href="{path=\'member/profile\'}">Your Home</a></li>\n                <li><a href="{path=LOGOUT}">Log out</a></li>\n				{/if}\n				{if logged_out}\n				<li><a href="{path=\'member/register\'}">Register</a></li>\n				<li><a href="{path=\'member/login\'}">Log in</a></li>\n				{/if}\n            </ul>\n			{/if}\n        </div> <!-- ending #member -->',0),
	(9,1,'global_top_search','<!-- Simple Search Form: https://ellislab.com/expressionengine/user-guide/modules/search/index.html#simple \n\nThe parameters here help to identify what templates to use and where to search:\n\nResults page - result_page: https://ellislab.com/expressionengine/user-guide/modules/search/simple.html#par_result_page\n\nNo Results found: no_result_page: https://ellislab.com/expressionengine/user-guide/modules/search/simple.html#par_no_result_page\n\nsearch_in - search in titles? titles and entries? titles, entries?  https://ellislab.com/expressionengine/user-guide/modules/search/simple.html#par_search_in-->\n\n{exp:search:simple_form channel="news" result_page="search/results" no_result_page="search/no_results" search_in="everywhere"}\n<fieldset>\n    <label for="search">Search:</label>\n    <input type="text" name="keywords" id="search" value=""  />\n	<input type="image" id="submit" name="submit" class="submit" src="{site_url}themes/site/default/images/spacer.gif" />\n</fieldset>\n{/exp:search:simple_form}',0),
	(10,1,'news_calendar','<h5>Calendar</h5>\n		<div id="news_calendar">\n			\n			<!-- Channel Calendar Tag: https://ellislab.com/expressionengine/user-guide/modules/channel/calendar.html -->\n			\n			{exp:channel:calendar switch="calendarToday|calendarCell" channel="news"}\n			<table class="calendarBG" border="0" cellpadding="6" cellspacing="1" summary="My Calendar">\n			<tr class="calendarHeader">\n			<th><div class="calendarMonthLinks"><a href="{previous_path=\'news/archives\'}">&lt;&lt;</a></div></th>\n			<th colspan="5">{date format="%F %Y"}</th>\n			<th><div class="calendarMonthLinks"><a class="calendarMonthLinks" href="{next_path=\'news/archives\'}">&gt;&gt;</a></div></th>\n			</tr>\n			<tr>\n			{calendar_heading}\n			<td class="calendarDayHeading">{lang:weekday_abrev}</td>\n			{/calendar_heading}\n			</tr>\n\n			{calendar_rows }\n			{row_start}<tr>{/row_start}\n\n			{if entries}\n			<td class=\'{switch}\' align=\'center\'><a href="{day_path=\'news/archives\'}">{day_number}</a></td>\n			{/if}\n\n			{if not_entries}\n			<td class=\'{switch}\' align=\'center\'>{day_number}</td>\n			{/if}\n\n			{if blank}\n			<td class=\'calendarBlank\'>{day_number}</td>\n			{/if}\n\n			{row_end}</tr>{/row_end}\n			{/calendar_rows}\n			</table>\n			{/exp:channel:calendar}\n		</div> <!-- ending #news_calendar -->',0),
	(11,1,'news_categories','<div id="sidebar_category_archives">\n      		<h5>Categories</h5>\n  			<ul id="categories">\n  				<!-- Weblog Categories tag: https://ellislab.com/expressionengine/user-guide/modules/weblog/categories.html -->\n				\n  				{exp:channel:categories channel="news" style="linear"}\n  				<li><a href="{path=\'news/archives\'}">{category_name}</a></li>\n  				{/exp:channel:categories}\n  			</ul>\n  		</div>',0),
	(12,1,'news_month_archives','<div id="sidebar_date_archives">\n    	    <h5>Date Archives</h5>\n    		<ul id="months">\n    			{!-- Archive Month Link Tags: https://ellislab.com/expressionengine/user-guide/modules/weblog/archive_month_links.html --}\n		\n    			{exp:channel:month_links channel="news" limit="50"}\n    			<li><a href="{path=\'news/archives\'}">{month}, {year}</a></li>\n    			{/exp:channel:month_links}\n    		</ul>\n    	</div>',0),
	(13,1,'news_popular','<h5>Popular News Items</h5>\n\n<!-- Channel Entries tag ordered by track views for "popular posts".  See Tracking Entry Views at https://ellislab.com/expressionengine/user-guide/modules/weblog/entry_tracking.html -->\n\n{exp:channel:entries channel="news" limit="4" disable="categories|custom_fields|category_fields|trackbacks|pagination|member_data" dynamic="no"}\n	{if count == "1"}<ul>{/if}\n		<li><a href="{comment_url_title_auto_path}">{title}</a> </li>\n	{if count == total_results}</ul>{/if}\n{/exp:channel:entries}',0);
ALTER TABLE `exp_snippets` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_specialty_templates` WRITE;
ALTER TABLE `exp_specialty_templates` DISABLE KEYS;
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`) VALUES 
	(1,1,'y','offline_template','','system',NULL,'<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>',NULL,0,0),
	(2,1,'y','message_template','','system',NULL,'<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type="text/css">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>',NULL,0,0),
	(3,1,'y','admin_notify_reg','Notification of new member registration','email','members','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}',NULL,0,0),
	(4,1,'y','admin_notify_entry','A new channel entry has been posted','email','content','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n',NULL,0,0),
	(6,1,'y','admin_notify_comment','You have just received a comment','email','comments','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}',NULL,0,0),
	(7,1,'y','mbr_activation_instructions','Enclosed is your activation code','email','members','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}',NULL,0,0),
	(8,1,'y','forgot_password_instructions','Login information','email','members','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}',NULL,0,0),
	(9,1,'y','validated_member_notify','Your membership account has been activated','email','members','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}',NULL,0,0),
	(10,1,'y','decline_member_validation','Your membership account has been declined','email','members','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}',NULL,0,0),
	(12,1,'y','comment_notification','Someone just responded to your comment','email','comments','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}',NULL,0,0),
	(13,1,'y','comments_opened_notification','New comments have been added','email','comments','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}',NULL,0,0),
	(14,1,'y','private_message_notification','Someone has sent you a Private Message','email','private_messages','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}',NULL,0,0),
	(15,1,'y','pm_inbox_full','Your private message mailbox is full','email','private_messages','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}',NULL,0,0);
ALTER TABLE `exp_specialty_templates` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_stats` WRITE;
ALTER TABLE `exp_stats` DISABLE KEYS;
INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES 
	(1,1,1,1,'Admin',1,0,0,0,1409242030,0,0,0,0,0,1409242030);
ALTER TABLE `exp_stats` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_statuses` WRITE;
ALTER TABLE `exp_statuses` DISABLE KEYS;
INSERT INTO `exp_statuses` (`status_id`, `status`, `status_order`, `highlight`) VALUES 
	(1,'open',1,'009933'),
	(2,'closed',2,'990000'),
	(3,'Featured',3,'000000');
ALTER TABLE `exp_statuses` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_statuses_roles` WRITE;
ALTER TABLE `exp_statuses_roles` DISABLE KEYS;
INSERT INTO `exp_statuses_roles` (`role_id`, `status_id`) VALUES 
	(5,1),
	(5,2),
	(5,3);
ALTER TABLE `exp_statuses_roles` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_template_groups` WRITE;
ALTER TABLE `exp_template_groups` DISABLE KEYS;
INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES 
	(1,1,'about',1,'n'),
	(2,1,'global_embeds',2,'n'),
	(3,1,'news',3,'y'),
	(4,1,'search',4,'n');
ALTER TABLE `exp_template_groups` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_template_groups_roles` WRITE;
ALTER TABLE `exp_template_groups_roles` DISABLE KEYS;
ALTER TABLE `exp_template_groups_roles` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_template_routes` WRITE;
ALTER TABLE `exp_template_routes` DISABLE KEYS;
ALTER TABLE `exp_template_routes` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_templates` WRITE;
ALTER TABLE `exp_templates` DISABLE KEYS;
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES 
	(1,1,1,'index','n','webpage','{!-- Explanations and learning materials can be found in news/index and the other news template groups.  In-line comments here are only for features not introduced in news/index. --}\n{html_head}\n	<title>{site_name}: Contact Us</title>\n{global_stylesheets}\n\n{rss}\n{favicon}\n{html_head_end}\n	<body>\n{nav_access}\n	{branding_begin}\n			{embed="global_embeds/_top_nav" loc="about"}\n			{global_top_search}\n			{global_top_member}\n	{branding_end}\n	{wrapper_begin}\n{embed="global_embeds/_page_header" header="About"}\n\n\n<div id="feature" class="about">\n	{exp:channel:entries channel="about" url_title="about_the_label" dynamic="no"  limit="1" disable="pagination|member_data|categories|category_fields"}\n		<h3 class="about">{title}</h3>\n		{about_body}\n	{/exp:channel:entries}\n</div> <!-- ending #feature -->\n\n	<div class="feature_end"></div>\n\n<div id="content_pri" class="about"> <!-- This is where all primary content, left column gets entered -->\n\n		<!-- Standard Channel Entries tag, but instead of relying on the URL for what to display, we request a specific entry for display via url-title:\n	https://ellislab.com/expressionengine/user-guide/modules/channel/parameters.html#par_url_title\n\n	and we force the channel entries tag to ignore the URL and always deliver the same content by using dynamic="no":\n\n	https://ellislab.com/expressionengine/user-guide/modules/channel/parameters.html#par_dynamic\n	-->\n\n		{exp:channel:entries channel="about" dynamic="no" url_title="about_the_label" limit="1" disable="pagination|member_data|categories|category_fields"}\n			{about_extended}\n		{/exp:channel:entries}\n</div>\n\n<div id="content_sec" class="staff_profiles right green40">\n		<h3 class="staff">Staff Profiles</h3>\n		{exp:channel:entries channel="about" limit="6" category="3" dynamic="off" orderby="date" sort="asc"}\n			{if count == "1"}<ul class="staff_member">{/if}\n				<li class="{switch="||end"}">\n					<h4>{title} <a href="#">i</a></h4>\n					<div class="profile">\n						{about_staff_title}\n					</div>\n					<img src="{about_image}" alt="{title}" />\n				</li>\n			{if count == total_results}</ul>{/if}\n		{/exp:channel:entries}\n\n</div>	<!-- ending #content_sec -->\n\n\n\n{global_footer}\n{wrapper_close}\n{js}\n{html_close}\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(2,1,1,'404','n','webpage','{!-- Explanations and learning materials can be found in news/index and the other news template groups.  In-line comments here are only for features not introduced in news/index. --}\n{html_head}\n	<title>{site_name}: Not Found</title>\n{global_stylesheets}\n\n{rss}\n{favicon}\n{html_head_end}\n	<body>\n{nav_access}\n	{branding_begin}\n			{embed="global_embeds/_top_nav" loc="contact"}\n			{global_top_search}\n			{global_top_member}\n	{branding_end}\n	{wrapper_begin}\n{embed="global_embeds/_page_header" header="Not Found"}\n\n\n	<div id="content_pri"> <!-- This is where all primary content, left column gets entered -->\n		<h4>Not Found</h4>\n				 <p>The page you attempted to load was Not Found.  Please try again.</p>\n	</div>\n\n\n		<div id="content_sec" class="right green40">\n			<h3 class="oldernews">Browse Older News</h3>\n			<div id="news_archives">\n				<div id="categories_box">\n				{news_categories}\n				</div>\n				<div id="month_box">\n				{news_month_archives}\n				</div>\n			</div> <!-- ending #news_archives -->\n\n			{news_calendar}\n\n			{news_popular}\n\n		{rss_links}\n\n		</div>	<!-- ending #content_sec -->\n\n	{global_footer}\n	{wrapper_close}\n	{js}\n	{html_close}\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(3,1,1,'contact','n','webpage','{!-- Explanations and learning materials can be found in news/index and the other news template groups.  In-line comments here are only for features not introduced in news/index. --}\n{html_head}\n	<title>{site_name}: Contact Us</title>\n{global_stylesheets}\n\n{rss}\n{favicon}\n{html_head_end}\n	<body>\n{nav_access}\n	{branding_begin}\n			{embed="global_embeds/_top_nav" loc="contact"}\n			{global_top_search}\n			{global_top_member}\n	{branding_end}\n	{wrapper_begin}\n{embed="global_embeds/_page_header" header="Contact Us"}\n    <div id="feature" class="contact">\n		<h3 class="getintouch">Get in Touch</h3>\n\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat .</p>\n</div> <!-- ending #feature -->\n\n	<div class="feature_end"></div>\n\n	<div id="content_pri" class="contact"> <!-- This is where all primary content, left column gets entered -->\n\n			<!-- This uses the Email Module\'s Contact Form: https://ellislab.com/expressionengine/user-guide/modules/email/contact_form.html -->\n			{exp:email:contact_form user_recipients="false" recipients="admin@example.com" charset="utf-8"}\n			<fieldset id="contact_fields">\n			<label for="from">\n				<span>Your Email:</span>\n				<input type="text" id="from" name="from" value="{member_email}" />\n			</label>\n\n			<label for="subject">\n				<span>Subject:</span>\n				<input type="text" id="subject" name="subject" size="40" value="Contact Form" />\n			</label>\n\n			<label for="message">\n				<span>Message:</span>\n				<textarea id="message" name="message" rows="18" cols="40">Email from: {member_name}, Sent at: {current_time format="%Y %m %d"}</textarea>\n			</label>\n			</fieldset>\n\n			<fieldset id="contact_action">\n				<p>We will never pass on your details to third parties.</p>\n				<input name="submit" type=\'submit\' value=\'Submit\' id=\'contactSubmit\' />\n			</fieldset>\n			{/exp:email:contact_form}\n	</div>\n\n	<div id="content_sec" class="contact">\n		<h3 class="address">Address</h3>\n		 <p>\n			12343 Valencia Street,<br />\n			Mission District,<br />\n			San Francisco,<br />\n			California,<br />\n			ZIP 123\n			 </p>\n	<p><img src="{site_url}images/about/map2.jpg" alt="" /></p>\n\n	</div>	<!-- ending #content_sec -->\n\n{global_footer}\n{wrapper_close}\n{js}\n{html_close}\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(4,1,2,'index','n','webpage','',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(5,1,2,'_page_header','n','webpage','<div id="page_header">\n        <h2>{embed:header}</h2>\n    </div>\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(6,1,2,'_top_nav','n','webpage',' <ul id="navigation_pri">\n            <li id="home" {if embed:loc== "home"}class="cur"{/if}><a href="{homepage}">Home</a></li>\n            <li id="events" {if embed:loc == "about"}class="cur"{/if}><a href="{path=\'about/index\'}">About</a></li>\n            <li id="contact" {if embed:loc=="contact"}class="cur"{/if}><a href="{path=\'about/contact\'}">Contact</a></li>\n        </ul>',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(7,1,2,'css_screen-ie6','n','css','/*\n\n	AGILE RECORDS, EE2.0 EXAMPLE SITE by ERSKINE DESIGN\n	VERSION 1.0\n	IE6 OVERRIDE STYLES\n	\n	CONTENTS ----------\n	\n	\n	\n	-------------------\n	\n*/\n\n\n\nul#nav_access { position:static; display:none; }\n\ndiv#feature { margin-bottom:10px !important; }\nhr.legend_start,\nhr.feature_end { display:none !important; }\n\n/* TABLES */\n\ntable { background-image:none; background-color:#ddd; font-size:12px; }\ntr.alt { background-image:none; background-color:#eee; }\nth { background-image:none; background-color:#ddd; }\n\n\n\n/* LAYOUT */\n\ndiv#feature { width:950px; overflow:hidden; float:none; padding:30px 0; position:static; margin:0; background:url({site_url}themes/site/default/images/feature_bg.jpg); margin-bottom:30px; }\ndiv#page_header { background-image:none; background-color:#6b5f57; height:40px; z-index:3; position:static; top:0px; margin-bottom:0; padding-bottom:10px; }\n\ndiv#branding { height:290px; background:url({site_url}themes/site/default/images/ie_branding_bg.gif) repeat-x center top; position:relative; z-index:2; }\ndiv#branding_sub { width:930px; margin:0 auto; position:relative; }\n\ndiv#page { background:url({site_url}themes/site/default/images/page_bg.jpg); }\n\ndiv#content_pri { display:inline; }\ndiv#content_sec { }\n\n\n\n/* BRANDING/MASTHEAD */\n\ndiv#branding_logo { background:url({site_url}themes/site/default/images/ie_branding_sub_bg.gif) no-repeat left top; }\ndiv#branding_sub h1 a { position:static; background:url({site_url}themes/site/default/images/logo_bg.jpg) no-repeat bottom left; }\ndiv#branding_sub div#member { background:none; }\ndiv#branding_sub form { background:url({site_url}themes/site/default/images/ie_search_bg.jpg) no-repeat; }\n\n\n\n\n/* NAVIGATION */\n\nul#navigation_pri { background-image:none; background-color:#2f261d; }\nul#navigation_pri li { height:auto; text-indent:0; font-family:"Cooper Black",Arial; font-weight:bold; }\nul#navigation_pri li a:link,\nul#navigation_pri li a:visited { background:none; text-decoration:none; color:#a09f9d;}\nul#navigation_pri li a:hover,\nul#navigation_pri li a:focus { color:#ccc;}\nul#navigation_pri li.cur a:link,\nul#navigation_pri li.cur a:visited,\nul#navigation_pri li.cur a:hover,\nul#navigation_pri li.cur a:focus { color:#d55401; }\nul#navigation_pri li#home,\nul#navigation_pri li#events,\nul#navigation_pri li#contact { top:8px; }\nul#navigation_pri li#bands,\nul#navigation_pri li#news,\nul#navigation_pri li#forums { top:30px; }\nul#navigation_pri li#releases,\nul#navigation_pri li#about,\nul#navigation_pri li#wiki { top:54px; }\n\n\n\n/* HEADINGS */\ndiv#page_header { height:1px; z-index:99; position:static; top:0; margin-bottom:0; }\ndiv#page_header h2 { text-indent:0 !important; background:none !important; color:#e6e6e6 !important; padding-top:15px !important; float:left;}\ndiv#page_header ol#breadcrumbs { margin-top:10px; padding:0; background:none; }\ndiv#page_header ol#breadcrumbs li { margin-left:10px; }\n\nh2,h3 { text-indent:0 !important; background:none !important; width:auto !important; height:auto !important; }\n\n\n\n/* HOMEPAGE */\n\n.home div#feature div#featured_band { width:450px; float:left; position:static; margin:0px; }\n.home div#feature div#featured_band h2 { margin-bottom:5px; width:auto; height:auto; text-indent:0; background:none; }\n\n.home div#content_sec { display:inline; margin:0 30px 0 10px; }\n\n.home div#feature div#featured_band div.image { width:300px; height:200px; left:0; bottom:-10px; margin:0 10px 0 10px; padding:0; display:inline; }\n.home div#feature div#featured_band div.image h4 { height:auto; width:auto; background:none; margin:0; top:auto; bottom:0; }\n.home div#feature div#featured_band div.image h4 span { position:static; background:none; }\n.home div#feature div#featured_band div.image img { top:0; left:0; }\n\n.home div#homepage_events ul { padding-bottom:30px; }\n.home div#homepage_events ul li a { background:none !important; text-indent:0 !important; text-align:center; color:#fff; font-weight:bold; }\n\n.home div#homepage_forums ul,\n.home div#homepage_rss p,\n.home div#homepage_rss ul { background-image:none; background-color:#eee; }\n\n\n\n/* BANDS */\n\n.bands ul#bands1 li.one { width:450px; height:300px; left:-480px; top:0; margin-right:-450px; margin-bottom:30px; }\n.bands ul#bands1 li.one img { top:0; left:0; }\n \n.bands ul#bands1 li.two img,\n.bands ul#bands1 li.three img { padding:0; background:none; position:static; margin:0; margin:0 10px; }\n\n.band div#band_image { width:450px; height:300px; float:left; position:relative; left:10px; top:0px; margin:0 30px 30px 0; display:inline; }\n.band div#band_image img { top:0; left:0; }\n\ndiv#band_latestrelease { padding:20px; overflow:hidden; color:#d6d6d6; margin-left:10px; }\ndiv#band_latestrelease h3 { padding-top:20px; }\n\n.band div#content_pri { display:inline; }\n\n.band div#band_events ul { padding-bottom:30px; }\n.band div#band_events ul li a { background:none !important; text-indent:0 !important; text-align:center; color:#fff; font-weight:bold; }\n\n.band div#band_more ul { background-image:none; background-color:#eee; }\n\n\n\n/* RELEASES */\n\n.releases div#content_pri table th { background:none; text-indent:0; color:#fff; }\n.releases div#content_pri table th.release_details { width:360px; padding-right:30px; background:none; }\n.releases div#content_pri table th.release_catno { width:80px; background:none; }\n.releases div#content_pri table th.release_format { width:120px; background:none; text-align:center; }\n\n.releases div#content_pri table tr { background-image:none; background-color:#a3a39c; }\n.releases div#content_pri table tr.releases_head { background:none; }\n.releases div#content_pri table tr.alt { background-image:none; background-color:#c1c1bc; }\n\n.release div#content_pri { display:inline; padding-top:30px;}\n.release div#content_sec { padding:0; padding-top:30px; background:none; position:relative; left:-10px; }\n\n.release div#release_details { border-bottom:1px solid blue; }\n.release div#release_details span { font-family:Georgia,serif; font-style:italic; }\n.release div#release_details ul { list-style:url({site_url}themes/site/default/images/pixel.gif); }\n\n.release div#release_tracks div.release_format { float:left; padding-bottom:20px; margin-bottom:20px; }\n\n\n\n/* EVENTS */\n\n.events div#content_pri { display:inline; }\n\n\n\n/* NEWS */\n\n.news div#content_pri { display:inline; padding:30px 0; }\n.news div#content_sec { margin:30px 0 ; }\n\n.news div#news_calendar h6 a.prev { position:static; }\n.news div#news_calendar h6 a.next { position:static; }\n\n.news div#news_calendar { background-image:none; background-color:#cfcfcb; }\n.news div#news_calendar table td.post { background-image:none; background-color:#d7d7d3; }\n\n.news div#news_rss { background-image:none; background-color:#cfcfcb; }\n\ndiv#news_comments ol li { background-image:none; background-color:#f1f1f1; }\ndiv#news_comments ol li.alt { background-image:none; background-color:#e7e7e7; }\n\ndiv#news_comments fieldset#comment_fields label { display:block; width:320px; }\ndiv#news_comments fieldset#comment_fields label.comment { width:530px; }\ndiv#news_comments fieldset#comment_fields label span { width:80px; float:none; position:relative; top:20px; }\ndiv#news_comments fieldset#comment_fields label input { float:right; }\ndiv#news_comments fieldset#comment_fields label textarea { float:right; }\n\ndiv#news_comments fieldset#comment_fields label input,\ndiv#news_comments fieldset#comment_fields label textarea { background-image:none; background-color:#f1f1f1; }\n\n\n\n/* FORUMS */\n\n.forums div#content_pri { display:inline; }\n.forums div#content_sec { background-image:none; background-color:#f1f1f1; }\n\n.forums #page_header form { position:absolute; left:770px; padding-top:5px; }\n.forums #page_header form input.search { padding:1px; margin-right:10px;}\n.forums #page_header form input.submit { padding:0; position:relative; top:5px; }\n\n.forums div#content_pri h3 { background-color:#71715f !important; }\n\ndiv.forum_posts { background-image:none; background-color:#9e9e94; }\ndiv.forum_posts table tr td { background-image:none; background-color:#d0d0cc;}\ndiv.forum_posts table tr.alt td { background-image:none; background-color:#b3b3ab; }\n\ndiv.forum_posts table tr th { text-indent:0; color:#fff; }\ndiv.forum_posts table tr th.forum_name,\ndiv.forum_posts table tr th.forum_topics,\ndiv.forum_posts table tr th.forum_replies,\ndiv.forum_posts table tr th.forum_latest { background-image:none; }\n\ndiv.forum_posts table td.forum_newpostindicator img { position:static; }\n\n.forums div#legend div#forum_stats ul.legend { float:left; background-image:none; background-color:#cecec8; }\n.forums div#legend div#forum_stats p.most_visitors { background-image:none; background-color:#ecd2c3; }\n\n\n\n/* WIKI */\n\n.wiki div#navigation_sec { padding-top:57px; display:inline;  behavior: url(css/iepngfix/iepngfix.htc); }\n.wiki div#navigation_sec ul { background:url({site_url}themes/site/default/images/ie_wiki_menubg.jpg) repeat-y 5px top ; }\n.wiki div#navigation_sec div.bottom { behavior: url(css/iepngfix/iepngfix.htc); }\n\n\n\n/* MEMBERS CONTROL PANEL */\n\n.member_cp div#navigation_sec { display:inline; background-image:none; background-color:#9c9b92; }\n.member_cp div#navigation_sec h4 a.expand { display:none; }\n\n.member_cp div#content_pri table tr { background-image:none; background-color:#f1f1f1; }\n.member_cp div#content_pri table tr.alt { background-image:none; background-color:#e7e7e7; }\n.member_cp div#content_pri table tr th { background-image:none; background-color:#f1f1f1; }\n.member_cp div#content_pri table tr.alt th { background-image:none; background-color:#e7e7e7; }\n\n\n\n/* MEMBER PROFILE */\n\n.member_profile div#feature div#memberprofile_main { background-image:none; background-color:#cecec8; margin:20px 0 0 10px; }\n.member_profile div#feature div#memberprofile_main ul { padding:0 0 10px 0; }\n\n.member_profile div#feature div#memberprofile_photo { float:left; width:210px; height:180px; background:none; position:relative; left:-20px; }\n.member_profile div#feature div#memberprofile_photo img { width:206px; height:176px; border:3px solid #6b5f57; position:static; }\n\n.member_profile div#feature div#memberprofile_communicate { background-image:none; background-color:#adada3; margin-top:5px; } \n.member_profile div#feature div#memberprofile_communicate table tr { background-image:none; background-color:#cdcdc7; }\n.member_profile div#feature div#memberprofile_communicate table tr.alt { background-image:none; background-color:#bebeb7; }\n\n.member_profile div#content_pri table tr,\n.member_profile div#content_sec table tr { background-image:none; background-color:#f1f1f1; }\n.member_profile div#content_pri table tr.alt,\n.member_profile div#content_sec table tr.alt { background-image:none; background-color:#e7e7e7; }\n\n.member_profile div#content_pri table tr th,\n.member_profile div#content_sec table tr th { background-image:none; background-color:#f1f1f1; }\n.member_profile div#content_pri table tr.alt th,\n.member_profile div#content_sec table tr.alt th { background-image:none; background-color:#e7e7e7; }\n\n\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(8,1,2,'css_screen-ie7','n','css','body {position:relative;}\ndiv#branding {margin:0 auto;}\n\n\ndiv#content_wrapper {position:relative;}\n\ndiv.feature_end {margin-top:0; }\ndiv#content_pri {float:left;margin:0 30px 0 10px;width:600px; padding-left:10px;}\ndiv#content_sec {float:left;width:270px; position:relative; z-index:999;}\n\ndiv#content_pri.contact {width:520px; margin-right:110px;}\ndiv#content_sec.contact {float:right; margin: 0 10px -140px auto; }\n\n\ndiv#page_header {position:relative;z-index:1;}\n\ndiv#feature{top:-10px;float:none;margin-bottom:30px;padding-top:25px;padding-top:10px;position:relative;width:950px;z-index:900;display:block;}\n\ndiv.feature_end {clear:none;height:35px;margin-bottom:20px;margin-top:-40px;width:950px;}\n\n/*#content_wrapper.member_cp {padding:0 10px;} */\n#content_wrapper.member_cp table {width:550px;}\n\ndiv#navigation_sec.member_cp { \n	width:150px; \n	left:10px;\n}\n\ndiv#content_wrapper.member_cp form {margin-left:200px;}',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(9,1,2,'site_css','n','css','html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,font,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,hr{margin:0;padding:0;border:0;outline:0;font-weight:inherit;font-style:inherit;font-size:100%;font-family:inherit;vertical-align:baseline;}:focus{outline:0;}body{line-height:1;color:black;background:white;}ol,ul{list-style:none;}table{border-collapse:collapse;border-spacing:0;}caption,th,td{text-align:left;font-weight:normal;}blockquote:before,blockquote:after,q:before,q:after{content:"";}blockquote,q{quotes:"""";}@font-face{font-family:\'miso\';src:url(\'{site_url}themes/site/default/fonts/miso-bold.ttf\');}body{background:#ccc url({site_url}themes/site/default/images/body_bg.jpg) top center;font-size:13px;font-family:Arial,sans-serif;}ul#nav_access{position:absolute;top:-9999px;left:-9999px;}p,ul,dl,ol{margin-bottom:22px;line-height:22px;}ul{list-style:url({site_url}themes/site/default/images/bullet.jpg);}ul li{margin-left:12px;}ol{list-style:decimal;list-style-position:inside;}hr{height:0;border-top:1px solid #ccc;margin-bottom:22px;}abbr{border-bottom:1px dotted;}strong{font-weight:bold;}em{font-style:italic;}h1,h2,h3,h4,h5{font-weight:bold;}h2{color:#48482d;font-size:16px;margin-bottom:10px;}h3{margin-bottom:20px;}h4{margin-bottom:10px;}h5{margin-bottom:10px;}h6{text-transform:uppercase;font-size:11px;color:#666;letter-spacing:1px;margin-bottom:10px;}a:link,a:visited{color:#333;text-decoration:underline;}a:hover,a:focus{color:#111;}h2 a:link,h2 a:visited,h3 a:link,h3 a:visited,h4 a:link,h4 a:visited{text-decoration:none;}\n\n/* Tables */\n/* site_url explanation: https://ellislab.com/expressionengine/user-guide/templates/globals/single_variables.html#var_site_url */\n/* only site_url will be parsed, other variables will not be parsed unless you call the stylesheet using path= instead of stylesheet=:\n\nhttps://ellislab.com/expressionengine/user-guide/templates/globals/stylesheet.html */\n\ntable{background:url({site_url}themes/site/default/images/white_40.png);font-size:12px;}\ntr{border-bottom:1px dotted #999;}\ntr.alt{background:url({site_url}themes/site/default/images/white_20.png);}\nth,td{padding:10px;}\nth{background:url({site_url}themes/site/default/images/white_20.png);color:#666;font-weight:bold;font-size:13px;}\n.member_table{width:60%; margin:10px;}\n.member_console{width:100%;}\n\n/* Page Styles */\ndiv#branding{height:290px;background:url({site_url}themes/site/default/images/branding_bg.png) repeat-x center top;position:relative;z-index:2;}\ndiv#branding_sub{width:930px;margin:0 auto;position:relative;}\ndiv#page{width:950px;padding-top:50px;margin:0 auto;position:relative;top:0px;margin-top:-80px;z-index:1;background:url({site_url}themes/site/default/images/white_40.png);}\ndiv#content_wrapper{padding-top:30px;}\ndiv#feature{width:950px;background:url({site_url}themes/site/default/images/white_70.png);float:left;padding-top:30px;position:relative;bottom:30px;margin-bottom:-30px;}\n\ndiv.feature_end {background:transparent url({site_url}themes/site/default/images/agile_sprite.png) no-repeat scroll left -747px; border:none;outline:none;clear:both;height:35px;margin-top:-6px;margin-bottom:20px;width:950px;}\n\ndiv#legend{width:950px;background:url({site_url}themes/site/default/images/white_70.png);overflow:hidden;position:relative;top:30px;margin-top:-30px;padding:10px 0 30px 0;font-size:11px;}\nhr.legend_start{width:950px;clear:both;background:url({site_url}themes/site/default/images/white_70_top.png) no-repeat top left;height:35px;margin:0;margin-top:20px;border:none;}\ndiv#content_pri{width:610px;float:left;margin:0 30px 0 10px;}\ndiv#content_sec{width:270px;float:left;}\n\ninput.input { border:1px solid #aaa; position:relative; left:5px; background:url({site_url}themes/site/default/images/white_50.png);}\ninput.input:focus { background:url({site_url}themes/site/default/images/white_70.png); }\ntextarea { border:1px solid #aaa; background:url({site_url}themes/site/default/images/white_50.png); }\ntextarea:focus { background:url({site_url}themes/site/default/images/white_70.png); }\n\n\n\n\n/* Branding */\ndiv#branding_logo{background:url({site_url}themes/site/default/images/agile_sprite.png) no-repeat 9px -428px;margin:0 auto;position:relative;left:-80px;margin-bottom:-230px;height:230px;width:950px;}\ndiv#branding_logo img{display:none;}\ndiv#branding_sub h1 a {width:182px;height:196px;display:block;text-indent:-9999em;background:url({site_url}themes/site/default/images/agile_sprite.png) no-repeat -264px 15px;  padding-top:15px;}\ndiv#branding_sub form{position:absolute; right:130px;top:25px;width:240px;height:51px;background:url({site_url}themes/site/default/images/agile_sprite.png) no-repeat -534px -21px;}\ndiv#branding_sub form fieldset{position:relative;}\ndiv#branding_sub form label{text-indent:-9999em;margin-top:10px;width:60px;padding:5px;position:absolute;left:0px;display:inline;}\ndiv#branding_sub form input#search{background:none;border:none;position:absolute;top:13px;left:70px;width:100px;padding:2px 5px;font-size:11px;color:#fff;}\n\ndiv#branding_sub form input#submit{position:absolute;right:30px;top:6px; background:transparent url({site_url}themes/site/default/images/agile_sprite.png) no-repeat -587px -77px; width:24px; height:24px; display:block; font-size:1px; border:none; outline:none;}\n\ndiv#branding_sub div#member{position:absolute;right:0;top:20px;background:url({site_url}themes/site/default/images/brown_40.png);border:1px solid #846f65;color:#ccc;font-size:11px;padding:8px;}\ndiv#branding_sub div#member ul{margin:0;line-height:13px;list-style:disc;}\ndiv#branding_sub div#member h4{margin-bottom:4px;}\ndiv#branding_sub div#member a:link, div#branding_sub div#member a:visited{color:#ccc;}\ndiv#branding_sub div#member a:hover, div#branding_sub div#member a:focus{color:#fff;}\n\n/* Navigation */\nul#navigation_pri{list-style:none;margin:0 auto;padding:5px 15px;width:340px;max-height:100px;background:#2f261d;position:absolute;right:0;bottom:20px;}\nul#navigation_pri li{margin:0;float:left;font-size:16px;width:33%;}\nul#navigation_pri li a{font-family:\'Cooper Black\',miso,\'Georgia\',serif;font-weight:bold;color:#999999;text-decoration:none}\nul#navigation_pri li a:hover{color:#efefef;}\nul#navigation_pri li.cur a{color:#f47424}\n\n/* Footer */\ndiv#siteinfo{background:url({site_url}themes/site/default/images/agile_sprite.png) no-repeat left -287px;height:80px;padding-top:40px;position:relative;clear:both;font-size:12px;z-index:3;}\ndiv#siteinfo p{color:#5b5b42;font-weight:bold;margin:0 0 0 10px;}\ndiv#siteinfo p.logo{width:65px;height:70px;background:url({site_url}themes/site/default/images/agile_sprite.png); text-indent:-9999em;position:absolute;left:865px;bottom:15px;}\ndiv#siteinfo a {color:#5b5b42;text-decoration:underline;}\ndiv#siteinfo a:hover {color:#3B3A25;text-decoration:underline;}\ndiv#siteinfo p.logo a{display:block;}\n\n\n/* 11.PAGEHEADERS\n---------------------------------------------------------------------- */\n\ndiv#page_header { background:url({site_url}themes/site/default/images/agile_sprite.png) no-repeat left -205px; height:72px; z-index:3; position:relative; top:-25px; margin-bottom:-15px; }\n\ndiv#page_header h2 { float:left; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-weight: normal; text-transform:uppercase; color:#ebebeb; letter-spacing: -0.01em; }\ndiv#page_header h2 a { display:block; }\n\ndiv#page_header h2 { margin:0; width:400px; height:15px; padding-top:30px; margin-left:10px;}\n\ndiv#page_header ol#breadcrumbs { float:left; list-style:none; margin:0; margin-left:10px; margin-top:26px; padding:0px 0 0 20px; background:url({site_url}themes/site/default/images/breadcrumbs_bg.png) no-repeat left center; }\ndiv#page_header ol#breadcrumbs li { margin:0; float:left; font-weight:bold; color:#d6d6d6; text-transform:uppercase; font-size:12px; }\ndiv#page_header ol#breadcrumbs li a { color:#d6d6d6; text-decoration:none; }\n\n\n/*  Featured Band / Welcome\n-------------------------------- */\ndiv#featured_band {width:450px; float:left; position:relative; z-index:5; bottom:52px; margin-bottom:-52px;}\ndiv#welcome {width:450px; float:left; margin:0 30px 0 10px;}\ndiv#welcome img {float:left; margin:0 30px 10px 0;}\ndiv#featured_band h2 {margin-bottom:38px; width:135px; height:14px; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-weight: normal; text-transform:uppercase; color:#ebebeb; letter-spacing: -0.01em;}\n\ndiv#featured_band div.image { float:right; width:323px; height:243px; position:relative; left:50px; bottom:75px; margin: 0 0 -75px -50px; }\ndiv#featured_band div.image h4 { width:324px; height:243px; background:url({site_url}themes/site/default/images/featuredband_border.png) no-repeat top left; position:absolute; top:0; left:0; z-index:2; }\ndiv#featured_band div.image h4 span { position:absolute; top:177px; left:30px; background:url({site_url}themes/site/default/images/white_70.png); font-size:11px; padding:2px; padding-left:60px; }\ndiv#featured_band div.image img { position:absolute; top:20px; left:15px;}\n.green40 {background:transparent url({site_url}themes/site/default/images/green_40.png) repeat scroll 0 0; color:#EEEEEE; float:left; padding:10px;}\ndiv#feature p {margin-left:10px;}\n\n/* News\n---------------- */\nh3.oldernews {}\nul#news_listing { list-style:none; }\nul#news_listing li { margin:0 0 30px 0; overflow:hidden; }\nul#news_listing li img { float:left; margin:0 10px 10px 0;}\nul#news_listing li p { margin-bottom:10px; }\n\ndiv#news_archives { overflow:hidden; }\ndiv#news_archives div#categories_box {width:120px; float: left;}\ndiv#news_archives div#months_box {width:120px; float: right;}\ndiv#news_archives ul#categories { width:120px; float:left; margin-right:30px; }\ndiv#news_archives ul#months { width:120px; float:left; }\n\ndiv#news_calendar { padding:10px; background:url({site_url}themes/site/default/images/white_50.png); margin-bottom:40px; }\n\ndiv#news_calendar a:link,\ndiv#news_calendar a:visited { color:#666; }\ndiv#news_calendar a:hover,\ndiv#news_calendar a:focus { color:#333; }\n\ndiv#news_calendar h6 { position:relative; text-align:center; text-transform:uppercase; color:#666; padding:0 0 10px 0; }\ndiv#news_calendar h6 a.prev { position:absolute; left:0; top:-3px; font-size:16px; }\ndiv#news_calendar h6 a.next { position:absolute; right:0; top:-3px; font-size:16px; }\n\ndiv#news_calendar table { background:none; font-size:11px; width:250px; color:#666; }\ndiv#news_calendar table th { background:url({site_url}themes/site/default/images/green_50.png); color:#ccc; }\ndiv#news_calendar table th,\ndiv#news_calendar table td  { padding:5px 0; text-align:center; }\ndiv#news_calendar table tr { border:none; }\ndiv#news_calendar table td.unused { color:#999; }\ndiv#news_calendar table td.post { background:url({site_url}themes/site/default/images/white_20.png); }\ndiv#news_calendar table td.post:hover { background:url({site_url}themes/site/default/images/white_40.png); }\n\ndiv#news_rss { padding:10px; background:url({site_url}themes/site/default/images/white_50.png); color:#666; }\ndiv#news_rss ul { list-style:url({site_url}themes/site/default/images/bullet.jpg); margin:0; }\ndiv#news_rss a:link,\ndiv#news_rss a:visited { color:#666; }\ndiv#news_rss a:hover,\ndiv#news_rss a:focus { color:#333; }\n\n\n/* Staff Profiles */\ndiv#content_sec.staff_profiles {\nbackground:transparent url({site_url}themes/site/default/images/staff_bg.jpg) repeat scroll 0 0;float:right;margin-bottom:-110px;padding:10px;position:relative;top:-140px; right:10px; width:430px;}\n\n/* Comments */\ndiv#news_comments { border-top:#bfbebf 1px solid; padding-top:20px; }\n\ndiv#news_comments ol { list-style:none; border-top:1px dotted #ccc; margin-bottom:30px; }\ndiv#news_comments ol li { border-bottom:1px dotted #ccc; background:url({site_url}themes/site/default/images/white_70.png); padding:20px 10px 0 160px; font-size:12px; line-height:20px; }\ndiv#news_comments ol li.alt { background:url({site_url}themes/site/default/images/white_50.png); }\n\ndiv#news_comments ol li h5.commentdata { width:120px; float:left; position:relative; left:-150px; margin-right:-150px; font-size:13px; line-height:20px; }\ndiv#news_comments ol li h5.commentdata span { display:block; font-weight:normal; font-size:11px; }\ndiv#news_comments ol li h5.commentdata img { margin-top:10px; }\n\ndiv#news_comments h3.leavecomment {color:#47472C; font-family:\'Cooper Black\', miso, \'Georgia\', serif; font-size:20px;}\ndiv#news_comments form { position:relative; margin-bottom:30px; }\n\ndiv#news_comments fieldset#comment_fields label { display:block; overflow:hidden; font-size:12px; margin-bottom:20px; }\ndiv#news_comments fieldset#comment_fields label span { width:80px; float:left; position:relative; top:5px; }\ndiv#news_comments fieldset#comment_fields label input { border:1px solid #aaa; width:228px; float:left; background:url({site_url}themes/site/default/images/white_50.png); }\ndiv#news_comments fieldset#comment_fields label input:focus { background:url({site_url}themes/site/default/images/white_70.png); }\ndiv#news_comments fieldset#comment_fields label textarea { border:1px solid #aaa; float:left; height:150px; width:438px; background:url({site_url}themes/site/default/images/white_50.png); }\ndiv#news_comments fieldset#comment_fields label textarea:focus { background:url({site_url}themes/site/default/images/white_70.png); }\n\ndiv#news_comments div#comment_guidelines { width:418px; padding:10px; margin:10px 0 10px 80px; color:#fff; background:#9f9995; }\ndiv#news_comments div#comment_guidelines h6 { font-weight:normal; font-size:12px; margin-bottom:0; }\ndiv#news_comments div#comment_guidelines p { margin:10px 0 0 0 ; font-size:11px; line-height:16px; font-style:italic; }\n\ndiv#news_comments fieldset#comment_action { background:url({site_url}themes/site/default/images/orange_20.png); padding:10px; font-size:11px; position:relative; }\ndiv#news_comments fieldset#comment_action label { display:block; padding:5px 0; }\ndiv#news_comments fieldset#comment_action label input { position:relative; left:5px; }\ndiv#news_comments fieldset#comment_action input#submit_comment { position:absolute; bottom:10px; right:10px; font-size:12px; }\n\ndiv#captcha_box img {margin-left: 5px;}\n\ninput#captcha {display:block; margin: 5px 0 0 0; border:1px solid #aaa; width:228px; background:url({site_url}themes/site/default/images/white_50.png);}\ninput#captcha:focus {background:url({site_url}themes/site/default/images/white_70.png);}\n\n/* News Archive Page */\ndiv.archive ul#news_listing li img {float:right; margin:auto auto 10px 10px;}\ndiv.archive ul#news_listing li p {margin-bottom:10px; padding-left:0;}\n\n/* About */\ndiv#content_pri.about {width:450px;}\ndiv#feature.about p {color:#666666;font-weight:bold;margin-left:10px;width:450px;}\ndiv#feature h3.about {font-size:22px; font-family:\'Cooper Black\',miso,\'Georgia\',serif;font-weight:bold;color:#47472C;text-decoration:none; margin:10px 0 20px 10px; width:300px;}\n\n\ndiv#content_sec ul.staff_member li {float:left;height:180px;margin:0 35px 40px 0;overflow:hidden;position:relative;width:120px;}\n\ndiv#content_sec ul.staff_member { list-style:none; overflow:hidden; margin-bottom:-20px; }\ndiv#content_sec ul.staff_member li { width:120px; height:180px; overflow:hidden; position:relative; float:left; margin:0 35px 40px 0; }\ndiv#content_sec ul.staff_member li.end { margin-right:0; }\ndiv#content_sec ul.staff_member li h4 { font-size:12px; padding:5px 5px; background:#afafa8; position:absolute; bottom:0; left:0; z-index:3; color:#fff; width:110px; height:20px; cursor:pointer; }\ndiv#content_sec ul.staff_member li h4 a { position:absolute; right:5px; color:#eee; font-family:Georgia, "Times New Roman", Times, serif; font-style:italic; font-weight:bold; }\ndiv#content_sec ul.staff_member li div.profile { position:absolute; bottom:40px; left:0; background:url({site_url}themes/site/default/images/white_50.png); z-index:2; padding:5px; width:110px; }\ndiv#content_sec ul.staff_member li img { position:absolute; top:0; left:0; }\ndiv.profile {color:#000;}\n\n\n/* Contact */\ndiv#content_pri.contact { width:530px; margin-right:110px; }\ndiv#content_sec.contact {  width:270px; float:left; padding:10px; padding-bottom:0; background:url({site_url}themes/site/default/images/staff_bg.jpg); position:relative; top:-170px; margin-bottom:-140px; color:#eee; }\ndiv#feature.contact p {color:#666666;font-weight:bold;margin-left:10px;width:600px;}\n\n/*div#feature { padding-left:10px; padding-right:410px; width:530px; }*/\ndiv#feature h3.getintouch { width:140px; font-family:\'Cooper Black\',miso,\'Georgia\',serif;font-size:20px; color:#47472C;text-decoration:none; margin-left:10px;}\n\ndiv#content_pri form { position:relative; margin-bottom:30px; }\n\ndiv#content_pri fieldset#contact_fields label { display:block; overflow:hidden; font-size:12px; margin-bottom:20px; }\ndiv#content_pri fieldset#contact_fields label span { width:80px; float:left; position:relative; top:5px; }\ndiv#content_pri fieldset#contact_fields label input { border:1px solid #aaa; width:228px; float:left; background:url({site_url}themes/site/default/images/white_50.png); }\ndiv#content_pri fieldset#contact_fields label input:focus { background:url({site_url}themes/site/default/images/white_70.png); }\ndiv#content_pri fieldset#contact_fields label textarea { border:1px solid #aaa; float:left; height:150px; width:438px; background:url({site_url}themes/site/default/images/white_50.png); }\ndiv#content_pri fieldset#contact_fields label textarea:focus { background:url({site_url}themes/site/default/images/white_70.png); }\n\ndiv#content_pri div#contact_guidelines { position:absolute; top:0; right:0; width:170px; padding:10px; color:#fff; background:#9f9995; }\ndiv#content_pri div#contact_guidelines h6 { font-weight:normal; font-size:12px; margin-bottom:10px; }\ndiv#content_pri div#contact_guidelines p { margin:0; font-size:11px; line-height:16px; font-style:italic; }\n\ndiv#content_pri fieldset#contact_action { background:url({site_url}themes/site/default/images/orange_20.png); padding:10px; font-size:11px; position:relative; }\ndiv#content_pri fieldset#contact_action label { display:block; padding:5px 0; }\ndiv#content_pri fieldset#contact_action label input { position:relative; left:5px; }\ndiv#content_pri fieldset#contact_action input#contactSubmit { position:absolute; bottom:10px; right:10px; font-size:12px; }\n\n\n\n\n/*  Member Templates */\n/* 22.MEMBERS\n---------------------------------------------------------------------- */\n\n/* CONTROL PANEL */\ndiv#navigation_sec.member_cp { width:270px; padding:10px; float:left; background:url({site_url}themes/site/default/images/green_40.png); margin:35px 30px 30px 10px; font-size:11px; line-height:16px; }\n/*div#content_pri.member_cp  { width:610px; margin:0 0 0 10px; }*/\n\ndiv#page_header.member_cp  a.viewprofile { display:block; width:182px; height:22px; background:url({site_url}themes/site/default/images/member_viewprofile.jpg) no-repeat left top; text-indent:-9999em; position:absolute; right:10px; top:25px; }\n.member_cp div#page_header a.viewprofile:hover,\n.member_cp div#page_header a.viewprofile:focus { background-position:left bottom; }\n\ndiv#navigation_sec.member_cp h4 { color:#fff; border-bottom:1px solid #b1b1a9; font-size:12px; padding-bottom:5px; position:relative; }\ndiv#navigation_sec.member_cp h4 a.expand { position:absolute; right:0; top:0; display:block; height:14px; width:14px; background:url({site_url}themes/site/default/images/controlpanel_expand.jpg) no-repeat bottom left; text-indent:-9999em; }\ndiv#navigation_sec.member_cp h4 a.expand.open { background:url({site_url}themes/site/default/images/controlpanel_expand.jpg) no-repeat top left; }\ndiv#navigation_sec.member_cp a:link,\ndiv#navigation_sec.member_cp a:visited { color:#ddd; }\ndiv#navigation_sec.member_cp a:hover,\ndiv#navigation_sec.member_cp a:focus { color:#fff; }\n\ndiv#content_pri table { width:610px; background:none;}\ndiv#content_pri table th { background:none; }\ndiv#content_pri table tr { background:url({site_url}themes/site/default/images/white_60.png); }\ndiv#content_pri table tr.alt { background:url({site_url}themes/site/default/images/white_40.png); }\n\n/* PROFILE */\ndiv#content_pri.member_profile, div#content_pri.member_cp  { width:450px; float:left; margin:0 30px 30px 10px; }\ndiv#content_sec.member_profile, div#content_sec.member_cp  { width:450px; float:left; margin:0 0 30px 0; }\n\nh3.statistics {height:11px; font-family:\'Cooper Black\',miso,\'Georgia\',serif; color:#f47424; font-size:18px; }\nh3.personalinfo {height:11px; color:#47472C; font-family:\'Cooper Black\',miso,\'Georgia\',serif; font-size:18px;}\nh3.biography {height:11px; color:#47472C; font-family:\'Cooper Black\',miso,\'Georgia\',serif; font-size:18px; margin-top:20px;}\n\ndiv#memberprofile_main { background:url({site_url}themes/site/default/images/green_20.png); width:300px; padding:10px; margin:40px 0 0 10px; float:left; }\ndiv#memberprofile_main img { float:left; margin:0 10px 10px 0; }\ndiv#memberprofile_main h3 { margin:5px 0 10px 0; }\ndiv#memberprofile_main ul { clear:both; margin:0; padding:10px 0; font-size:12px; }\ndiv#memberprofile_main ul a { color:#666; }\n\ndiv#memberprofile_photo { float:left; width:250px; height:220px; background:url({site_url}themes/site/default/images/memberprofile_photo_bg.png) no-repeat center center; position:relative; left:-20px; }\ndiv#memberprofile_photo img { width:206px; height:176px; border:3px solid #6b5f57; position:absolute; top:20px; left:20px; }\n\ndiv#memberprofile_communicate { width:270px; padding:10px; margin:20px 10px 0 0; float:right; background:url({site_url}themes/site/default/images/green_40.png); }\ndiv#memberprofile_communicate h3.communicate { width:83px; height:12px; font-family:"Helvetica Neue",Helvetica,Arial,sans-serif; color:#EBEBEB; text-transform: uppercase; margin-bottom:10px; }\ndiv#memberprofile_communicate table { width:270px; font-size:10px; background:none; }\ndiv#memberprofile_communicate table tr { background:url({site_url}themes/site/default/images/white_40.png); }\ndiv#memberprofile_communicate table tr.alt { background:url({site_url}themes/site/default/images/white_20.png); }\ndiv#memberprofile_communicate table th { font-weight:normal; font-size:10px; background:none; padding:4px; }\ndiv#feature div#memberprofile_communicate table td { padding:4px; color:#444;}\n\ndiv#content_pri.member_cp table,\ndiv#content_sec.member_cp table { width:100%; background:none; margin-bottom:30px; }\ndiv#content_pri.member_cp table th,\ndiv#content_sec.member_cp table th { background:none; }\ndiv#content_pri.member_cp table tr,\ndiv#content_sec.member_cp table tr { background:url({site_url}themes/site/default/images/white_60.png); }\ndiv#content_pri.member_cp table tr.alt,\ndiv#content_sec.member_cp table tr.alt  { background:url({site_url}themes/site/default/images/white_40.png); }\n\n/* Private Messages: Move and Copy pop-up menu control */\n#movemenu {position: absolute !important; top: 410px !important; left: 390px !important; border: 0 !important;}\n#copymenu {position: absolute !important; top: 410px !important; left: 332px !important; border: 0 !important;}\n\n/* Search Results */\n.pagination ul { overflow: auto; }\n.pagination li { float: left; list-style: none; background: transparent url(http://expressionengine2/themes/site/default/images/green_40.png) repeat scroll 0 0; padding: 1px 7px; margin: 0 3px; }\n.pagination li.active { background: none; }\n.pagination li.active a { text-decoration: none; }',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(10,1,3,'index','n','webpage','{if segment_2 != \'\'}\n  {redirect="404"}\n{/if}\n{html_head}\n	<title>{site_name}</title>\n{global_stylesheets}\n{rss}\n{favicon}\n{html_head_end}\n	<body>\n	{nav_access}\n	{branding_begin}\n			{embed="global_embeds/_top_nav" loc="home"}\n			{global_top_search}\n			{global_top_member}\n	{branding_end}\n	{wrapper_begin}\n{embed="global_embeds/_page_header" header="News"}\n	<div id="feature" class="news">\n			{global_featured_welcome}\n			{global_featured_band}\n	    </div> <!-- ending #feature -->\n\n        	<div class="feature_end"></div>\n\n	<div id="content_pri"> <!-- This is where all primary content, left column gets entered -->\n		<!--  This is the channel entries tag.  Documentation for this parameter can be found at https://ellislab.com/expressionengine/user-guide/modules/channel/channel_entries.html\n				 Parameter Explanation:\n		channel= which channel to output, multiple channels may be piped in (channel_1|channel_2)\n		limit= limits the number of entries output in this instance of the tag\n		disable= turns off parsing of un-needed data -->\n\n		{exp:channel:entries channel="news" limit="3" disable="categories|member_data|category_fields|pagination"}\n\n		<!-- if no_results is a conditional variable, it can not be combined with advanced conditionals.  https://ellislab.com/expressionengine/user-guide/modules/channel/conditional_variables.html#cond_if_no_results -->\n\n		{if no_results}<p>Sample No Results Information</p>{/if}\n		{if count == "1"}\n		<h3 class="recentnews">Recent News</h3>\n		<ul id="news_listing">\n		{/if}\n			<li>\n				<h4><a href="{comment_url_title_auto_path}">{title}</a>  //  <!-- entry_date is a variable, and date formatting variables can be found at https://ellislab.com/expressionengine/user-guide/templates/date_variable_formatting.html -->{entry_date format="%F %d %Y"}</h4>\n\n				<!-- the following two lines are custom channel fields. https://ellislab.com/expressionengine/user-guide/cp/admin/channel_administration/custom_channel_fields.html -->\n\n				{if news_image}\n					<img src="{news_image}" alt="{title}" />\n				{/if}\n				{news_body}\n				<p><a href="{comment_url_title_auto_path}#news_comments">{comment_total} comments</a> {global_edit_this}\n								{if news_extended != ""}  |  <a href="{comment_url_title_auto_path}">Read more</a>{/if}</p>\n\n			</li>\n		{if count == total_results}</ul>{/if}\n		{/exp:channel:entries}\n\n\n\n\n	</div>\n\n	<div id="content_sec" class="right green40">\n		<h3 class="oldernews">Browse Older News</h3>\n		<div id="news_archives">\n			<div id="categories_box">\n			{news_categories}\n			</div>\n			<div id="month_box">\n			{news_month_archives}\n			</div>\n		</div> <!-- ending #news_archives -->\n\n		{news_calendar}\n\n		{news_popular}\n\n	{rss_links}\n\n	</div>	<!-- ending #content_sec -->\n\n{global_footer}\n{wrapper_close}\n{js}\n{html_close}\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(11,1,3,'archives','n','webpage','{html_head}\n	<title>{site_name}: News Archives</title>\n{global_stylesheets}\n{rss}\n{favicon}\n{html_head_end}\n	<body>\n	{nav_access}\n	{branding_begin}\n			{embed="global_embeds/_top_nav" loc="home"}\n			{global_top_search}\n			{global_top_member}\n	{branding_end}\n	{wrapper_begin}\n{embed="global_embeds/_page_header" header="News"}\n	<div id="feature">\n			{global_featured_welcome}\n			{global_featured_band}\n	    </div> <!-- ending #feature -->\n\n        	<div class="feature_end"></div>\n\n	<div id="content_pri" class="archive"> <!-- This is where all primary content, left column gets entered -->\n\n			<!--  This is the channel entries tag.  Documentation for this tag can be found at https://ellislab.com/expressionengine/user-guide/modules/weblog/parameters.html\n\n			channel= which channel to output, multiple channels may be piped in (channel_1|channel_2)\n			limit= limits the number of entries output in this instance of the tag\n			disable= turns off parsing of un-needed data\n			relaxed_categories= allows you use the category indicator in your URLs with an entries tag specifying multiple weblogs that do not share category groups.\n\n			-->\n\n		{exp:channel:entries channel="news" limit="3" disable="member_data|category_fields|pagination" status="open|featured" relaxed_categories="yes"}\n\n		<!-- if no_results is a conditional variable, it can not be combined with advanced conditionals.  https://ellislab.com/expressionengine/user-guide/modules/channel/conditional_variables.html#cond_if_no_results -->\n\n		{if no_results}<p>No Results</p>{/if}\n		{if count == "1"}\n		<h3 class="recentnews">Recent News</h3>\n		<ul id="news_listing">\n		{/if}\n			<li>\n				<h4><a href="{comment_url_title_auto_path}">{title}</a>  //  {!-- entry_date is a variable, and date formatting variables can be found at https://ellislab.com/expressionengine/user-guide/templates/date_variable_formatting.html --}{entry_date format="%F %d %Y"}</h4>\n\n				<!-- the following two lines are custom channel fields. https://ellislab.com/expressionengine/user-guide/cp/admin/channel_administration/custom_channel_fields.html -->\n\n				{if news_image}\n					<img src="{news_image}" alt="{title}" />\n				{/if}\n				{news_body}\n				<p><a href="{comment_url_title_auto_path}#news_comments">{comment_total} comments</a> {global_edit_this}\n								{if news_extended != ""}  |  <a href="{comment_url_title_auto_path}">Read more</a>{/if}</p>\n\n			</li>\n		{if count == total_results}</ul>{/if}\n		{/exp:channel:entries}\n\n\n\n\n	</div>\n\n	<div id="content_sec" class="right green40">\n		<h3 class="oldernews">Browse Older News</h3>\n		<div id="news_archives">\n			<div id="categories_box">\n			{news_categories}\n			</div>\n			<div id="month_box">\n			{news_month_archives}\n			</div>\n		</div> <!-- ending #news_archives -->\n\n		{news_calendar}\n\n		{news_popular}\n\n	{rss_links}\n\n	</div>	<!-- ending #content_sec -->\n\n{global_footer}\n{wrapper_close}\n{js}\n{html_close}\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(12,1,3,'atom','n','feed','{exp:rss:feed channel="news"}\n\n<?xml version="1.0" encoding="{encoding}"?>\n<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="{channel_language}">\n\n	<title type="text">{exp:xml_encode}{channel_name}{/exp:xml_encode}</title>\n	<subtitle type="text">{exp:xml_encode}{channel_name}:{channel_description}{/exp:xml_encode}</subtitle>\n	<link rel="alternate" type="text/html" href="{channel_url}" />\n	<link rel="self" type="application/atom+xml" href="{path={atom_feed_location}}" />\n	<updated>{gmt_edit_date format=\'%Y-%m-%dT%H:%i:%sZ\'}</updated>\n	<rights>Copyright (c) {gmt_date format="%Y"}, {author}</rights>\n	<generator uri="https://ellislab.com/" version="{version}">ExpressionEngine</generator>\n	<id>tag:{trimmed_url},{gmt_date format="%Y:%m:%d"}</id>\n\n{exp:channel:entries channel="news" limit="15" dynamic_start="on" disable="member_data"}\n	<entry>\n	  <title>{exp:xml_encode}{title}{/exp:xml_encode}</title>\n	  <link rel="alternate" type="text/html" href="{comment_url_title_auto_path}" />\n	  <id>tag:{trimmed_url},{gmt_entry_date format="%Y"}:{relative_url}/{channel_id}.{entry_id}</id>\n	  <published>{gmt_entry_date format="%Y-%m-%dT%H:%i:%sZ"}</published>\n	  <updated>{gmt_edit_date format=\'%Y-%m-%dT%H:%i:%sZ\'}</updated>\n	  <author>\n			<name>{author}</name>\n			<email>{email}</email>\n			{if url}<uri>{url}</uri>{/if}\n	  </author>\n{categories}\n	  <category term="{exp:xml_encode}{category_name}{/exp:xml_encode}"\n		scheme="{path=news/index}"\n		label="{exp:xml_encode}{category_name}{/exp:xml_encode}" />{/categories}\n	  <content type="html"><![CDATA[\n		{news_body} {news_extended}\n	  ]]></content>\n	</entry>\n{/exp:channel:entries}\n\n</feed>\n\n{/exp:rss:feed}						',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(13,1,3,'comment_preview','n','webpage','{!-- Explanations and learning materials can be found in news/index and the other news template groups.  In-line comments here are only for features not introduced in news/index.\n	 NOTE:  This is an ExpressionEngine Comment and it will not appear in the rendered source.\n			https://ellislab.com/expressionengine/user-guide/templates/commenting.html\n--}\n{html_head}\n<!-- Below we use a channel entries tag to deliver a dynamic title element. -->\n	<title>{site_name}: Comment Preview for\n		{exp:channel:entries channel="news|about" limit="1" disable="categories|member_data|category_fields|pagination"}{title}{/exp:channel:entries}</title>\n{global_stylesheets}\n{rss}\n{favicon}\n{html_head_end}\n	<body>\n{nav_access}\n	{branding_begin}\n			{embed="global_embeds/_top_nav" loc="home"}\n			{global_top_search}\n			{global_top_member}\n	{branding_end}\n	{wrapper_begin}\n{embed="global_embeds/_page_header" header="News"}\n	<div id="feature">\n		{global_featured_welcome}\n		{global_featured_band}\n	    </div> <!-- ending #feature -->\n\n        	<div class="feature_end"></div>\n\n	<div id="content_pri"> <!-- This is where all primary content, left column gets entered -->\n		<!--  This is the channel entries tag.  Documentation for this parameter can be found at https://ellislab.com/expressionengine/user-guide/modules/channel/channel_entries.html\n				 Parameters are the items inside the opening exp:channel:entries tag that allow limiting, filtering, and sorting. They go in the format item="limiter".  ie: channel="news". Below are links to the parameters used in this particular instance of the channel entries tag.  These are documented here:\n\n				https://ellislab.com/expressionengine/user-guide/channels/weblog/parameters.html\n\n		channel= which channel to output, multiple channels may be piped in (channel_1|channel_2)\n		limit= limits the number of entries output in this instance of the tag\n		disable= turns off parsing of un-needed data\n		require_entry= forces ExpressionEngine to compare Segment 3 to existing URL titles.  If there is no match, then nothing is output.  Use this in combination with if no_results to force a redirect to 404. -->\n\n		{exp:channel:entries channel="news|about" disable="categories|member_data|category_fields|pagination" status="open|featured"}\n		<!-- count is a single variable: https://ellislab.com/expressionengine/user-guide/modules/weblog/variables.html#var_count\n\n		In this case we\'ve combined the count single variable with a Conditional Global Variable:\n\n		https://ellislab.com/expressionengine/user-guide/templates/globals/conditionals.html\n\n		to create code that shows up only once, at the top of the list of outputted channel entries and only if there is 1 or more entries -->\n\n		{if count == "1"}\n		<h3 class="recentnews">Recent News</h3>\n		<ul id="news_listing">\n\n			<!-- Here we close the conditional after all of the conditional data is processed. -->\n\n		{/if}\n			<li>\n					<!-- comment_url_title_auto_path is a channel entries variable:\n\n					https://ellislab.com/expressionengine/user-guide/modules/channel/variables.html#var_comment_url_title_auto_path\n\n					This allows you to outpt a per-channel link to a single-entry page.  This can be used even if you are not using comments as a way to get a per-channel "permalink" page without writing your own conditional. -->\n\n				<h4><a href="{comment_url_title_auto_path}">{title}</a>  //  <!-- entry_date is a variable, and date formatting variables can be found at https://ellislab.com/expressionengine/user-guide/templates/date_variable_formatting.html -->{entry_date format="%F %d %Y"}</h4>\n\n				<!-- the following two lines are custom channel fields. https://ellislab.com/expressionengine/user-guide/cp/admin/channel_administration/custom_channel_fields.html -->\n\n				{if news_image}\n					<img src="{news_image}" alt="{title}" />\n				{/if}\n\n				<!-- Here we come a custom field variable with a global conditional to output the HTML only if he custom field is _not_ blank -->\n\n				{if about_image != ""}<img src="{about_image}" alt="{title}"  />{/if}\n				{news_body}\n				{about_body}\n				{news_extended}\n\n				<!-- Here we compare the channel short-name to a predefined word to output some information only if the entry occurs in a particular channel -->\n				{if channel_short_name == "news"}<p><a href="{comment_url_title_auto_path}#news_comments">{comment_total} comments</a> <!-- edit_this is a Snippet: https://ellislab.com/expressionengine/user-guide/templates/globals/snippets.html --> {global_edit_this} </p> {/if}\n			</li>\n		<!-- Comparing two channel entries variables to output data only at the end of the list of outputted channel entries -->\n		{if count == total_results}</ul>{/if}\n		<!-- Closing the Channel Entries tag -->\n		{/exp:channel:entries}\n\n			<div id="news_comments">\n			<!-- Comment Entries Tag outputs comments: https://ellislab.com/expressionengine/user-guide/ https://ellislab.com/expressionengine/user-guide/\n			Parameters found here: https://ellislab.com/expressionengine/user-guide/modules/comment/entries.html#parameters\n			sort= defines in what order to sort the comments\n			limit= how many comments to output\n			channel= what channels to show comments from\n			-->\n			{exp:comment:preview channel="news|about"}\n			<h3>Comments</h3>\n			<ol>\n				<li>\n					<h5 class="commentdata">\n						<!-- Comment Entries variable: https://ellislab.com/expressionengine/user-guide/modules/comment/entries.html#url_as_author\n						url_as_author outputs the URL if entered/in the member profile (if registered) or just the name if no URL-->\n						{url_as_author}\n						<!-- Comment date:\n						 https://ellislab.com/expressionengine/user-guide/modules/comment/entries.html#var_comment_date\n\n						Formatted with Date Variable Formatting:\n\n	https://ellislab.com/expressionengine/user-guide//templates/date_variable_formatting.html -->\n\n						<span>{comment_date format="%h:%i%a"}, {comment_date format=" %m/%d/%Y"}</span>\n						<!-- Checks if the member has chosen an avatar and displays it if so\n\n	https://ellislab.com/expressionengine/user-guide/modules/comment/entries.html#conditionals\n						-->\n						{if avatar}\n							<img src="{avatar_url}" width="{avatar_image_width}" height="{avatar_image_height}" alt="{author}\'s avatar" />\n						{/if}\n					</h5>\n					{comment}\n\n                    <div style="clear: both;"></div>\n				</li>\n			</ol>\n			{/exp:comment:preview}\n\n			<!-- Comment Submission Form:\n\n			https://ellislab.com/expressionengine/user-guide/ modules/comment/entries.html#submission_form\n\n			channel= parameter says which channel to submit this comment too.  This is very important to include if you use multiple channels that may have the same URL title.  It will stop the comment from being attached to the wrong entry.  channel= should always be included.\n			-->\n\n\n			{exp:comment:form channel="news"}\n			<h3 class="leavecomment">Leave a comment</h3>\n			<fieldset id="comment_fields">\n			<!-- Show inputs only if the member is logged out.  If logged in, this information is pulled from the member\'s account details -->\n			{if logged_out}\n				<label for="name">\n					<span>Name:</span>\n					<input type="text" id="name" name="name" value="{name}" size="50" />\n				</label>\n				<label for="email">\n					<span>Email:</span>\n					<input type="text" id="email" name="email" value="{email}" size="50" />\n				</label>\n				<label for="location">\n					<span>Location:</span>\n					 <input type="text" id="location" name="location" value="{location}" size="50" />\n				</label>\n				<label for="url">\n					<span>URL:</span>\n					<input type="text" id="url" name="url" value="{url}" size="50" />\n				</label>\n			{/if}\n				<!-- comment_guidelines is a User Defined Global Variable: https://ellislab.com/expressionengine/user-guide/templates/globals/user_defined.html -->\n				{comment_guidelines}\n				<label for="comment" class="comment">\n					<span>Comment:</span>\n					<textarea id="comment" name="comment" rows="10" cols="70">{comment}</textarea>\n				</label>\n			</fieldset>\n\n				<fieldset id="comment_action">\n				{if logged_out}\n				<label for="save_info">Remember my personal info? <input type="checkbox" name="save_info" value="yes" {save_info} /> </label>\n				{/if}\n				<label for="notify_me">Notify me of follow-up comments? <input type="checkbox" id="notify_me" name="notify_me" value="yes" {notify_me} /></label>\n\n				<!-- Insert CAPTCHA.  Will show for those that are not exempt from needing the CAPTCHA as set in the member group preferences\n\n				-->\n				{if captcha}\n				<div id="captcha_box">\n					<span>{captcha}</span>\n				</div>\n					<label for="captcha">Please enter the word you see in the image above:\n<input type="text" id="captcha" name="captcha" value="{captcha_word}" maxlength="20" />\n					</label>\n				{/if}\n				<input type="submit" name="preview" value="Preview Comment" />\n				<input type="submit" name="submit" value="Submit" id="submit_comment" />\n			</fieldset>\n			{/exp:comment:form}\n\n	</div> <!-- ending #news_comments -->\n	</div> <!-- ending #content_pri -->\n\n	<div id="content_sec" class="right green40">\n		<h3 class="oldernews">Browse Older News</h3>\n		<div id="news_archives">\n			<!-- The period before the template in this embed indicates a "hidden template".  Hidden templates can not be viewed directly but can only be viewed when embedded in another template: https://ellislab.com/expressionengine/user-guide/templates/hidden_templates.html -->\n			<div id="categories_box">\n			{news_categories}\n			</div>\n			<div id="month_box">\n			{news_month_archives}\n			</div>\n		</div> <!-- ending #news_archives -->\n\n		{news_calendar}\n\n		{news_popular}\n\n	{rss_links}\n\n	</div>	<!-- ending #content_sec -->\n\n{global_footer}\n{wrapper_close}\n{js}\n{html_close}\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(14,1,3,'comments','n','webpage','{!-- Explanations and learning materials can be found in news/index and the other news template groups.  In-line comments here are only for features not introduced in news/index.\n	 NOTE:  This is an ExpressionEngine Comment and it will not appear in the rendered source.\n			https://ellislab.com/expressionengine/user-guide/templates/commenting.html\n--}\n{html_head}\n<!-- Below we use a channel entries tag to deliver a dynamic title element. -->\n	<title>{site_name}: Comments  on\n		{exp:channel:entries channel="news|about" limit="1" disable="categories|member_data|category_fields|pagination"}{title}{/exp:channel:entries}</title>\n{global_stylesheets}\n{rss}\n{favicon}\n{html_head_end}\n	<body>\n{nav_access}\n	{branding_begin}\n			{embed="global_embeds/_top_nav" loc="home"}\n			{global_top_search}\n			{global_top_member}\n	{branding_end}\n	{wrapper_begin}\n{embed="global_embeds/_page_header" header="News"}\n	<div id="feature">\n			{global_featured_welcome}\n			{global_featured_band}\n	    </div> <!-- ending #feature -->\n\n        	<div class="feature_end"></div>\n\n	<div id="content_pri"> <!-- This is where all primary content, left column gets entered -->\n		<!--  This is the channel entries tag.  Documentation for this parameter can be found at https://ellislab.com/expressionengine/user-guide/modules/channel/channel_entries.html\n				 Parameters are the items inside the opening exp:channel:entries tag that allow limiting, filtering, and sorting. They go in the format item="limiter".  ie: channel="news". Below are links to the parameters used in this particular instance of the channel entries tag.  These are documented here:\n\n				https://ellislab.com/expressionengine/user-guide/channels/weblog/parameters.html\n\n		channel= which channel to output, multiple channels may be piped in (channel_1|channel_2)\n		limit= limits the number of entries output in this instance of the tag\n		disable= turns off parsing of un-needed data\n		require_entry= forces ExpressionEngine to compare Segment 3 to existing URL titles.  If there is no match, then nothing is output.  Use this in combination with if no_results to force a redirect to 404. -->\n\n		{exp:channel:entries channel="news|about" limit="3" disable="categories|member_data|category_fields|pagination" require_entry="yes" status="open|featured"}\n\n		<!-- if no_results is a conditional variable, it can not be combined with advanced conditionals.  https://ellislab.com/expressionengine/user-guide/modules/channel/conditional_variables.html#cond_if_no_results\n\n		This is used here in combination with the require_entry parameter to ensure correct delivery of information or redirect to a 404 -->\n\n		{if no_results}{redirect="404"}{/if}\n		<!-- count is a single variable: https://ellislab.com/expressionengine/user-guide/modules/weblog/variables.html#var_count\n\n		In this case we\'ve combined the count single variable with a Conditional Global Variable:\n\n		https://ellislab.com/expressionengine/user-guide/templates/globals/conditionals.html\n\n		to create code that shows up only once, at the top of the list of outputted channel entries and only if there is 1 or more entries -->\n\n		{if count == "1"}\n		<h3 class="recentnews">Recent News</h3>\n		<ul id="news_listing">\n\n			<!-- Here we close the conditional after all of the conditional data is processed. -->\n\n		{/if}\n			<li>\n					<!-- comment_url_title_auto_path is a channel entries variable:\n\n					https://ellislab.com/expressionengine/user-guide/modules/channel/variables.html#var_comment_url_title_auto_path\n\n					This allows you to outpt a per-channel link to a single-entry page.  This can be used even if you are not using comments as a way to get a per-channel "permalink" page without writing your own conditional. -->\n\n				<h4><a href="{comment_url_title_auto_path}">{title}</a>  //  <!-- entry_date is a variable, and date formatting variables can be found at https://ellislab.com/expressionengine/user-guide/templates/date_variable_formatting.html -->{entry_date format="%F %d %Y"}</h4>\n\n				<!-- the following two lines are custom channel fields. https://ellislab.com/expressionengine/user-guide/cp/admin/channel_administration/custom_channel_fields.html -->\n\n				{if news_image}\n					<img src="{news_image}" alt="{title}" />\n				{/if}\n\n				<!-- Here we come a custom field variable with a global conditional to output the HTML only if he custom field is _not_ blank -->\n\n				{if about_image != ""}<img src="{about_image}" alt="{title}"  />{/if}\n				{news_body}\n				{about_body}\n				{news_extended}\n\n				<!-- Here we compare the channel short-name to a predefined word to output some information only if the entry occurs in a particular channel -->\n				{if channel_short_name == "news"}<p><a href="{comment_url_title_auto_path}#news_comments">{comment_total} comments</a> <!-- edit_this is a Snippet: https://ellislab.com/expressionengine/user-guide/templates/globals/snippets.html --> {global_edit_this} </p> {/if}\n			</li>\n		<!-- Comparing two channel entries variables to output data only at the end of the list of outputted channel entries -->\n		{if count == total_results}</ul>{/if}\n		<!-- Closing the Channel Entries tag -->\n		{/exp:channel:entries}\n\n			<div id="news_comments">\n			<!-- Comment Entries Tag outputs comments: https://ellislab.com/expressionengine/user-guide/ https://ellislab.com/expressionengine/user-guide/\n			Parameters found here: https://ellislab.com/expressionengine/user-guide/modules/comment/entries.html#parameters\n			sort= defines in what order to sort the comments\n			limit= how many comments to output\n			channel= what channels to show comments from\n			-->\n			{exp:comment:entries sort="asc" limit="20" channel="news"}\n			{if count == "1"}\n			<h3>Comments</h3>\n			<ol>{/if}\n				<li>\n					<h5 class="commentdata">\n						<!-- Comment Entries variable: https://ellislab.com/expressionengine/user-guide/modules/comment/entries.html#url_as_author\n						url_as_author outputs the URL if entered/in the member profile (if registered) or just the name if no URL-->\n						{url_as_author}\n						<!-- Comment date:\n						 https://ellislab.com/expressionengine/user-guide/modules/comment/entries.html#var_comment_date\n\n						Formatted with Date Variable Formatting:\n\n	https://ellislab.com/expressionengine/user-guide//templates/date_variable_formatting.html -->\n\n						<span>{comment_date format="%h:%i%a"}, {comment_date format=" %m/%d/%Y"}</span>\n						<!-- Checks if the member has chosen an avatar and displays it if so\n\n	https://ellislab.com/expressionengine/user-guide/modules/comment/entries.html#conditionals\n						-->\n						{if avatar}\n							<img src="{avatar_url}" width="{avatar_image_width}" height="{avatar_image_height}" alt="{author}\'s avatar" />\n						{/if}\n					</h5>\n					{comment}\n\n                    <div style="clear: both;"></div>\n				</li>\n			{if count == total_results}</ol>{/if}\n			{/exp:comment:entries}\n\n			<!-- Comment Submission Form:\n\n			https://ellislab.com/expressionengine/user-guide/ modules/comment/entries.html#submission_form\n\n			channel= parameter says which channel to submit this comment too.  This is very important to include if you use multiple channels that may have the same URL title.  It will stop the comment from being attached to the wrong entry.  channel= should always be included.\n\n			-->\n\n			{exp:comment:form channel="news" preview="news/comment_preview"}\n			<h3 class="leavecomment">Leave a comment</h3>\n			<fieldset id="comment_fields">\n			<!-- Show inputs only if the member is logged out.  If logged in, this information is pulled from the member\'s account details -->\n			{if logged_out}\n				<label for="name">\n					<span>Name:</span>\n					<input type="text" id="name" name="name" value="{name}" size="50" />\n				</label>\n				<label for="email">\n					<span>Email:</span>\n					<input type="text" id="email" name="email" value="{email}" size="50" />\n				</label>\n				<label for="location">\n					<span>Location:</span>\n					 <input type="text" id="location" name="location" value="{location}" size="50" />\n				</label>\n				<label for="url">\n					<span>URL:</span>\n					<input type="text" id="url" name="url" value="{url}" size="50" />\n				</label>\n			{/if}\n				<!-- comment_guidelines is a User Defined Global Variable: https://ellislab.com/expressionengine/user-guide/templates/globals/user_defined.html -->\n				{comment_guidelines}\n				<label for="comment" class="comment">\n					<span>Comment:</span>\n					<textarea id="comment" name="comment" rows="10" cols="70">{comment}</textarea>\n				</label>\n			</fieldset>\n\n				<fieldset id="comment_action">\n				{if logged_out}\n				<label for="save_info">Remember my personal info? <input type="checkbox" name="save_info" value="yes" {save_info} /> </label>\n				{/if}\n				<label for="notify_me">Notify me of follow-up comments? <input type="checkbox" id="notify_me" name="notify_me" value="yes" {notify_me} /></label>\n\n				<!-- Insert CAPTCHA.  Will show for those that are not exempt from needing the CAPTCHA as set in the member group preferences\n\n				-->\n				{if captcha}\n				<div id="captcha_box">\n					<span>{captcha}</span>\n				</div>\n					<label for="captcha">Please enter the word you see in the image above:\n<input type="text" id="captcha" name="captcha" value="{captcha_word}" maxlength="20" />\n					</label>\n				{/if}\n				<input type="submit" name="preview" value="Preview Comment" />\n				<input type="submit" name="submit" value="Submit" id="submit_comment" />\n			</fieldset>\n			{/exp:comment:form}\n\n	</div> <!-- ending #news_comments -->\n	</div> <!-- ending #content_pri -->\n\n	<div id="content_sec" class="right green40">\n		<h3 class="oldernews">Browse Older News</h3>\n		<div id="news_archives">\n			<!-- The period before the template in this embed indicates a "hidden template".  Hidden templates can not be viewed directly but can only be viewed when embedded in another template: https://ellislab.com/expressionengine/user-guide/templates/hidden_templates.html -->\n			<div id="categories_box">\n			{news_categories}\n			</div>\n			<div id="month_box">\n			{news_month_archives}\n			</div>\n		</div> <!-- ending #news_archives -->\n\n		{news_calendar}\n\n		{news_popular}\n\n	{rss_links}\n\n	</div>	<!-- ending #content_sec -->\n\n{global_footer}\n{wrapper_close}\n{js}\n{html_close}\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(15,1,3,'rss','n','feed','{exp:rss:feed channel="news"}\n\n<?xml version="1.0" encoding="{encoding}"?>\n<rss version="2.0"\n	xmlns:dc="http://purl.org/dc/elements/1.1/"\n	xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"\n	xmlns:admin="http://webns.net/mvcb/"\n	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"\n	xmlns:content="http://purl.org/rss/1.0/modules/content/">\n\n	<channel>\n	\n	<title>{exp:xml_encode}{channel_name}{/exp:xml_encode}</title>\n	<link>{channel_url}</link>\n	<description>{channel_description}</description>\n	<dc:language>{channel_language}</dc:language>\n	<dc:creator>{email}</dc:creator>\n	<dc:rights>Copyright {gmt_date format="%Y"}</dc:rights>\n	<dc:date>{gmt_date format="%Y-%m-%dT%H:%i:%s%Q"}</dc:date>\n	<admin:generatorAgent rdf:resource="https://ellislab.com/" />\n	\n{exp:channel:entries channel="news" limit="10" dynamic_start="on" disable="member_data"}\n	<item>\n	  <title>{exp:xml_encode}{title}{/exp:xml_encode}</title>\n	  <link>{comment_url_title_auto_path}</link>\n	  <guid>{comment_url_title_auto_path}#When:{gmt_entry_date format="%H:%i:%sZ"}</guid>\n	  <description><![CDATA[{news_body}]]></description> \n	  <dc:subject>{exp:xml_encode}{categories backspace="1"}{category_name}, {/categories}{/exp:xml_encode}</dc:subject>\n	  <dc:date>{gmt_entry_date format="%Y-%m-%dT%H:%i:%s%Q"}</dc:date>\n	</item>\n{/exp:channel:entries}\n	\n	</channel>\n</rss>\n\n{/exp:rss:feed}						',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(16,1,4,'index','n','webpage','<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"\n"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{lang}" lang="{lang}">\n\n<head>\n<title>{site_name}{lang:search}</title>\n\n<meta http-equiv="content-type" content="text/html; charset={charset}" />\n\n<link rel=\'stylesheet\' type=\'text/css\' media=\'all\' href=\'{stylesheet=search/search_css}\' />\n<style type=\'text/css\' media=\'screen\'>@import "{stylesheet=search/search_css}";</style>\n\n</head>\n<body>\n\n<div id=\'pageheader\'>\n<div class="heading">{lang:search_engine}</div>\n</div>\n\n<div id="content">\n\n<div class=\'breadcrumb\'>\n<span class="defaultBold">&nbsp; <a href="{homepage}">{site_name}</a>&nbsp;&#8250;&nbsp;&nbsp;{lang:search}</span>\n</div>\n\n<div class=\'outerBorder\'>\n<div class=\'tablePad\'>\n\n{exp:search:advanced_form result_page="search/results" cat_style="nested"}\n\n<table cellpadding=\'4\' cellspacing=\'6\' border=\'0\' width=\'100%\'>\n<tr>\n<td width="50%">\n\n<fieldset class="fieldset">\n<legend>{lang:search_by_keyword}</legend>\n\n<input type="text" class="input" maxlength="100" size="40" name="keywords" style="width:100%;" />\n\n<div class="default">\n<select name="search_in">\n<option value="titles" selected="selected">{lang:search_in_titles}</option>\n<option value="entries">{lang:search_in_entries}</option>\n<option value="everywhere" >{lang:search_everywhere}</option>\n</select>\n\n</div>\n\n<div class="default">\n<select name="where">\n<option value="exact" selected="selected">{lang:exact_phrase_match}</option>\n<option value="any">{lang:search_any_words}</option>\n<option value="all" >{lang:search_all_words}</option>\n<option value="word" >{lang:search_exact_word}</option>\n</select>\n</div>\n\n</fieldset>\n\n<div class="default"><br /></div>\n\n<table cellpadding=\'0\' cellspacing=\'0\' border=\'0\'>\n<tr>\n<td valign="top">\n\n<div class="defaultBold">{lang:channels}</div>\n\n<select id="channel_id" name=\'channel_id[]\' class=\'multiselect\' size=\'12\' multiple=\'multiple\' onchange=\'changemenu(this.selectedIndex);\'>\n{channel_names}\n</select>\n\n</td>\n<td valign="top" width="16">&nbsp;</td>\n<td valign="top">\n\n<div class="defaultBold">{lang:categories}</div>\n\n<select name=\'cat_id[]\' size=\'12\'  class=\'multiselect\' multiple=\'multiple\'>\n<option value=\'all\' selected="selected">{lang:any_category}</option>\n</select>\n\n</td>\n</tr>\n</table>\n\n\n\n</td><td width="50%" valign="top">\n\n\n<fieldset class="fieldset">\n<legend>{lang:search_by_member_name}</legend>\n\n<input type="text" class="input" maxlength="100" size="40" name="member_name" style="width:100%;" />\n<div class="default"><input type="checkbox" class="checkbox" name="exact_match" value="y"  /> {lang:exact_name_match}</div>\n\n</fieldset>\n\n<div class="default"><br /></div>\n\n\n<fieldset class="fieldset">\n<legend>{lang:search_entries_from}</legend>\n\n<select name="date" style="width:150px">\n<option value="0" selected="selected">{lang:any_date}</option>\n<option value="1" >{lang:today_and}</option>\n<option value="7" >{lang:this_week_and}</option>\n<option value="30" >{lang:one_month_ago_and}</option>\n<option value="90" >{lang:three_months_ago_and}</option>\n<option value="180" >{lang:six_months_ago_and}</option>\n<option value="365" >{lang:one_year_ago_and}</option>\n</select>\n\n<div class="default">\n<input type=\'radio\' name=\'date_order\' value=\'newer\' class=\'radio\' checked="checked" />&nbsp;{lang:newer}\n<input type=\'radio\' name=\'date_order\' value=\'older\' class=\'radio\' />&nbsp;{lang:older}\n</div>\n\n</fieldset>\n\n<div class="default"><br /></div>\n\n<fieldset class="fieldset">\n<legend>{lang:sort_results_by}</legend>\n\n<select name="orderby">\n<option value="date" >{lang:date}</option>\n<option value="title" >{lang:title}</option>\n<option value="most_comments" >{lang:most_comments}</option>\n<option value="recent_comment" >{lang:recent_comment}</option>\n</select>\n\n<div class="default">\n<input type=\'radio\' name=\'sort_order\' class="radio" value=\'desc\' checked="checked" /> {lang:descending}\n<input type=\'radio\' name=\'sort_order\' class="radio" value=\'asc\' /> {lang:ascending}\n</div>\n</fieldset>\n\n</td>\n</tr>\n</table>\n\n\n<div class=\'searchSubmit\'>\n\n<input type=\'submit\' value=\'Search\' class=\'submit\' />\n\n</div>\n\n{/exp:search:advanced_form}\n\n<div class=\'copyright\'><a href="https://ellislab.com/">Powered by ExpressionEngine</a></div>\n\n\n</div>\n</div>\n</div>\n\n</body>\n</html>',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(17,1,4,'no_results','n','webpage','{!-- Explanations and learning materials can be found in news/index and the other news template groups.  In-line comments here are only for features not introduced in news/index. --}\n{html_head}\n	<title>{site_name}: No Search Results</title>\n{global_stylesheets}\n{rss}\n{favicon}\n{html_head_end}\n	<body>\n{nav_access}\n	{branding_begin}\n			{embed="global_embeds/_top_nav" loc="not_found"}\n			{global_top_search}\n			{global_top_member}\n	{branding_end}\n	{wrapper_begin}\n{embed="global_embeds/_page_header" header="Search Results"}\n\n\n	<div id="content_pri"> <!-- This is where all primary content, left column gets entered -->\n\n		<!-- No search results: https://ellislab.com/expressionengine/user-guide/modules/search/simple.html#par_no_result_page -->\n		<!-- This is delivered based on the no_result_page parameter of the search form  -->\n\n				<h3>Search Results</h3>\n\n				<!-- exp:search:keywords: https://ellislab.com/expressionengine/user-guide/modules/search/keywords.html -->\n				<!-- exp:search:keywords lets you echo out what search term was used -->\n					<p>Sorry, no results were found for "<strong>{exp:search:keywords}</strong>".  Please try again.</p>\n	</div>\n\n	<div id="content_sec" class="right green40">\n		<h3 class="oldernews">Browse Older News</h3>\n		<div id="news_archives">\n			<div id="categories_box">\n			{news_categories}\n			</div>\n			<div id="month_box">\n			{news_month_archives}\n			</div>\n		</div> <!-- ending #news_archives -->\n\n		{news_calendar}\n\n		{news_popular}\n\n	{rss_links}\n\n	</div>	<!-- ending #content_sec -->\n\n{global_footer}\n{wrapper_close}\n{js}\n{html_close}\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n'),
	(18,1,4,'results','n','webpage','{!-- Explanations and learning materials can be found in news/index and the other news template groups.  In-line comments here are only for features not introduced in news/index. --}\n{html_head}\n	<title>{site_name}: {exp:search:search_results}\n		{if count == "1"}\n			Search Results for "{exp:search:keywords}"\n		{/if}\n		{/exp:search:search_results}\n	</title>\n{global_stylesheets}\n{rss}\n{favicon}\n{html_head_end}\n	<body>\n{nav_access}\n	{branding_begin}\n		{embed="global_embeds/_top_nav" loc="not_found"}\n		{global_top_search}\n		{global_top_member}\n	{branding_end}\n	{wrapper_begin}\n	{embed="global_embeds/_page_header" header="Search Results"}\n\n	<div id="content_pri"> <!-- This is where all primary content, left column gets entered -->\n\n		<!-- Search Results tag: https://ellislab.com/expressionengine/user-guide/modules/search/index.html#results -->\n\n		{exp:search:search_results}\n			{if count == "1"}\n				<!-- exp:search:keywords: https://ellislab.com/expressionengine/user-guide/modules/search/keywords.html -->\n				<!-- exp:search:keywords lets you echo out what search term was used -->\n\n				<h3>Search Results for "<strong>{exp:search:keywords}</strong>":</h3>\n				<ul id="news_listing">\n			{/if}\n\n			<li>\n				<h4>\n					<a href="{comment_url_title_auto_path}">{title}</a>  //\n					<!-- entry_date is a variable, and date formatting variables can be found at https://ellislab.com/expressionengine/user-guide/templates/date_variable_formatting.html -->\n					{entry_date format="%F %d %Y"}\n				</h4>\n\n				<!-- news_body and news_image are  custom channel fields. https://ellislab.com/expressionengine/user-guide/cp/admin/channel_administration/custom_channel_fields.html -->\n				{if news_image}\n					<img src="{news_image}" alt="{title}" />\n				{/if}\n				{news_body}\n			</li>\n			{if count == total_results}</ul>{/if}\n\n			{paginate}\n				<div class="pagination">\n					{pagination_links}\n						<ul>\n							{first_page}\n								<li><a href="{pagination_url}" class="page-first">First Page</a></li>\n							{/first_page}\n\n							{previous_page}\n								<li><a href="{pagination_url}" class="page-previous">Previous Page</a></li>\n							{/previous_page}\n\n							{page}\n								<li><a href="{pagination_url}" class="page-{pagination_page_number} {if current_page}active{/if}">{pagination_page_number}</a></li>\n							{/page}\n\n							{next_page}\n								<li><a href="{pagination_url}" class="page-next">Next Page</a></li>\n							{/next_page}\n\n							{last_page}\n								<li><a href="{pagination_url}" class="page-last">Last Page</a></li>\n							{/last_page}\n						</ul>\n					{/pagination_links}\n				</div> <!-- ending .pagination -->\n			{/paginate}\n		{/exp:search:search_results}\n	</div>\n\n	<div id="content_sec" class="right green40">\n		<h3 class="oldernews">Browse Older News</h3>\n		<div id="news_archives">\n			<div id="categories_box">\n			{news_categories}\n			</div>\n			<div id="month_box">\n			{news_month_archives}\n			</div>\n		</div> <!-- ending #news_archives -->\n\n		{news_calendar}\n\n		{news_popular}\n\n	{rss_links}\n\n	</div>	<!-- ending #content_sec -->\n\n{global_footer}\n{wrapper_close}\n{js}\n{html_close}\n',NULL,1409242030,1,'n',0,'','n','n','o',0,'n');
ALTER TABLE `exp_templates` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_templates_roles` WRITE;
ALTER TABLE `exp_templates_roles` DISABLE KEYS;
INSERT INTO `exp_templates_roles` (`role_id`, `template_id`) VALUES 
	(3,1),
	(3,2),
	(3,3),
	(3,5),
	(3,6),
	(3,7),
	(3,8),
	(3,9),
	(3,10),
	(3,11),
	(3,12),
	(3,13),
	(3,14),
	(3,15),
	(3,17),
	(3,18),
	(4,1),
	(4,2),
	(4,3),
	(4,5),
	(4,6),
	(4,7),
	(4,8),
	(4,9),
	(4,10),
	(4,11),
	(4,12),
	(4,13),
	(4,14),
	(4,15),
	(4,17),
	(4,18),
	(5,1),
	(5,2),
	(5,3),
	(5,5),
	(5,6),
	(5,7),
	(5,8),
	(5,9),
	(5,10),
	(5,11),
	(5,12),
	(5,13),
	(5,14),
	(5,15),
	(5,17),
	(5,18);
ALTER TABLE `exp_templates_roles` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_throttle` WRITE;
ALTER TABLE `exp_throttle` DISABLE KEYS;
ALTER TABLE `exp_throttle` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_update_log` WRITE;
ALTER TABLE `exp_update_log` DISABLE KEYS;
INSERT INTO `exp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`) VALUES 
	(1,1503524902,'Updating to 4.0.0',NULL,NULL,NULL),
	(2,1503524902,'Could not add column \'exp_file_dimensions.quality\'. Column already exists.','Smartforge::add_column',305,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(3,1503524904,'Update complete. Now running version 4.0.0.',NULL,NULL,NULL),
	(4,1505759243,'Updating to 4.0.0',NULL,NULL,NULL),
	(5,1505759243,'Could not modify column \'exp_channel_fields.group_id\'. Column does not exist.','Smartforge::modify_column',54,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(6,1505759243,'Could not create table \'exp_channels_channel_field_groups\'. Table already exists.','Smartforge::create_table',93,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(7,1505759243,'Could not create table \'exp_channels_channel_fields\'. Table already exists.','Smartforge::create_table',112,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(8,1505759243,'Could not create table \'exp_channel_field_groups_fields\'. Table already exists.','Smartforge::create_table',131,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(9,1505759243,'Smartforge::drop_table failed. Table \'exp_member_homepage\' does not exist.','Smartforge::drop_table',228,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(10,1505759243,'Could not drop column \'exp_members.birthday\'. Column does not exist.','Smartforge::drop_column',449,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(11,1505759243,'Could not create key \'sticky_date_id_idx\' on table \'exp_channel_titles\'. Key already exists.','Smartforge::add_key',592,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(12,1505759243,'Could not add column \'exp_file_dimensions.quality\'. Column already exists.','Smartforge::add_column',603,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(13,1505759243,'Could not add column \'exp_member_groups.can_moderate_spam\'. Column already exists.','Smartforge::add_column',618,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(14,1505759243,'Could not drop key \'file_id\' from table \'exp_file_categories\'. Key does not exist.','Smartforge::drop_key',679,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(15,1505759243,'Could not create key \'PRIMARY\' on table \'exp_file_categories\'. Key already exists.','Smartforge::add_key',682,'/Users/seth/EllisLab/ExpressionEngine/system/ee/installer/updates/ud_4_00_00.php'),
	(16,1505759245,'Update complete. Now running version 4.0.0.',NULL,NULL,NULL),
	(17,1536684550,'Updating to 5.0.0',NULL,NULL,NULL),
	(18,1536684559,'Update complete. Now running version 5.0.0.',NULL,NULL,NULL);
ALTER TABLE `exp_update_log` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_update_notices` WRITE;
ALTER TABLE `exp_update_notices` DISABLE KEYS;
INSERT INTO `exp_update_notices` (`notice_id`, `message`, `version`, `is_header`) VALUES 
	(1,'{birthday} member field variable is now a date type variable','4.0',1),
	(2,' Checking for templates to review ...','4.0',0),
	(3,'No templates contain the {birthday} variable.','4.0',0),
	(4,'Done.','4.0',0);
ALTER TABLE `exp_update_notices` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_upload_prefs` WRITE;
ALTER TABLE `exp_upload_prefs` DISABLE KEYS;
INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`) VALUES 
	(1,1,'Main Upload Directory','../images/uploads/','/images/uploads/','all','list','','','','style="border: 0;" alt="image"','','','','','',NULL,NULL,0),
	(2,1,'About','../images/about/','/images/about/','img','list','','','','','','','','','',NULL,NULL,0),
	(3,1,'Avatars','../images/avatars/','/images/avatars/','img','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),
	(4,1,'Default Avatars','../images/avatars/default/','/images/avatars/default/','img','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),
	(5,1,'Signature Attachments','../images/signature_attachments/','/images/signature_attachments/','img','list','30','80','480',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4),
	(6,1,'PM Attachments','../images/pm_attachments/','/images/pm_attachments/','img','list','250',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4);
ALTER TABLE `exp_upload_prefs` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `exp_upload_prefs_roles` WRITE;
ALTER TABLE `exp_upload_prefs_roles` DISABLE KEYS;
INSERT INTO `exp_upload_prefs_roles` (`role_id`, `upload_id`) VALUES 
	(5,1),
	(5,2);
ALTER TABLE `exp_upload_prefs_roles` ENABLE KEYS;
UNLOCK TABLES;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


