SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `access_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_status` (`mid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `level` int(11) NOT NULL,
  `parent_id` int(10) unsigned DEFAULT '0',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `account_access` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 => Not deleted, 1 => Deleted',
  `unionid` varchar(255) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL DEFAULT '0',
  `answer` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `open_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`),
  KEY `open_id` (`open_id`),
  KEY `option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `api_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `response` longtext CHARACTER SET utf8mb4,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(255) NOT NULL DEFAULT '',
  `location` text,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `api_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `personal_menu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid_tag_id` (`mid`,`tag_id`),
  KEY `mid_personal_menu_id` (`mid`,`personal_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `api_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expire_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `api_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `article_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_date` date NOT NULL,
  `user_source` tinyint(4) NOT NULL,
  `msgid_part1` int(11) NOT NULL,
  `msgid_part2` tinyint(4) NOT NULL,
  `title` varchar(255) NOT NULL,
  `int_page_read_user` int(11) NOT NULL,
  `int_page_read_count` int(11) NOT NULL,
  `ori_page_read_user` int(11) NOT NULL,
  `ori_page_read_count` int(11) NOT NULL,
  `share_user` int(11) NOT NULL,
  `share_count` int(11) NOT NULL,
  `add_to_fav_user` int(11) NOT NULL,
  `add_to_fav_count` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `article_total` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `mid` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `msgid` varchar(255) DEFAULT NULL,
  `msgid_part1` varchar(255) DEFAULT NULL,
  `msgid_part2` varchar(2) DEFAULT NULL,
  `ref_date` date DEFAULT NULL,
  `stat_date` date DEFAULT NULL,
  `target_user` int(11) DEFAULT '0',
  `int_page_read_user` int(11) DEFAULT '0',
  `real_int_page_read_user` int(11) DEFAULT '0',
  `int_page_read_count` int(11) DEFAULT '0',
  `real_int_page_read_count` int(11) DEFAULT '0',
  `ori_page_read_user` int(11) DEFAULT '0',
  `real_ori_page_read_user` int(11) DEFAULT '0',
  `ori_page_read_count` int(11) DEFAULT '0',
  `real_ori_page_read_count` int(11) DEFAULT '0',
  `share_user` int(11) DEFAULT '0',
  `real_share_user` int(11) DEFAULT '0',
  `share_count` int(11) DEFAULT '0',
  `real_share_count` int(11) DEFAULT '0',
  `add_to_fav_user` int(11) DEFAULT '0',
  `real_add_to_fav_user` int(11) DEFAULT '0',
  `add_to_fav_count` int(11) DEFAULT '0',
  `real_add_to_fav_count` int(11) DEFAULT '0',
  `rid` int(11) DEFAULT NULL,
  `ref_intdate` int(10) NOT NULL DEFAULT '0',
  `int_page_from_session_read_user` int(11) DEFAULT '0',
  `int_page_from_session_read_count` int(11) DEFAULT '0',
  `int_page_from_hist_msg_read_user` int(11) DEFAULT '0',
  `int_page_from_hist_msg_read_count` int(11) DEFAULT '0',
  `int_page_from_feed_read_user` int(11) DEFAULT '0',
  `int_page_from_feed_read_count` int(11) DEFAULT '0',
  `int_page_from_friends_read_user` int(11) DEFAULT '0',
  `int_page_from_friends_read_count` int(11) DEFAULT '0',
  `int_page_from_other_read_user` int(11) DEFAULT '0',
  `int_page_from_other_read_count` int(11) DEFAULT '0',
  `feed_share_from_session_user` int(11) DEFAULT '0',
  `feed_share_from_session_cnt` int(11) DEFAULT '0',
  `feed_share_from_feed_user` int(11) DEFAULT '0',
  `feed_share_from_feed_cnt` int(11) DEFAULT '0',
  `feed_share_from_other_user` int(11) DEFAULT '0',
  `feed_share_from_other_cnt` int(11) DEFAULT '0',
  `real_int_page_from_session_read_user` int(11) DEFAULT '0',
  `real_int_page_from_session_read_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `ref_intdate` (`ref_intdate`),
  KEY `stat_date` (`stat_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `askjery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `total_user` int(10) unsigned NOT NULL DEFAULT '0',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `mid_type_created_date` (`mid`,`type`,`created_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `askjery_user_chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL DEFAULT '',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_chat_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `chat_times` int(10) unsigned NOT NULL DEFAULT '0',
  `last_chat_length` int(10) unsigned NOT NULL DEFAULT '0',
  `subscribe_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actions` int(10) unsigned NOT NULL DEFAULT '0',
  `source_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `source_value` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `asyn_followers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `openids` longtext NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `asynusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` char(40) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `close_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `openid` (`openid`),
  KEY `status` (`status`),
  KEY `create_time` (`create_time`),
  KEY `close_time` (`close_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` mediumtext,
  `data` mediumtext,
  PRIMARY KEY (`itemname`,`userid`),
  UNIQUE KEY `itemname_userid_unique` (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` mediumtext,
  `bizrule` mediumtext,
  `data` mediumtext,
  PRIMARY KEY (`name`),
  UNIQUE KEY `itemname_type_unique` (`name`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  UNIQUE KEY `parent_child_unique` (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `availability_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `campaign_analytics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>Tag',
  `tags_id` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `begin_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `follows` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `reads` int(10) unsigned NOT NULL DEFAULT '0',
  `shares` int(10) unsigned NOT NULL DEFAULT '0',
  `share_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `sign_ups` int(10) unsigned NOT NULL DEFAULT '0',
  `coupons` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `click_through_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `revenue` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `campaign_analytics_all_data_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `campaign_analytics_id` int(10) unsigned NOT NULL DEFAULT '0',
  `follows` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `reads` int(10) unsigned NOT NULL DEFAULT '0',
  `shares` int(10) unsigned NOT NULL DEFAULT '0',
  `share_rate` varchar(255) NOT NULL DEFAULT '',
  `sign_ups` int(10) unsigned NOT NULL DEFAULT '0',
  `coupons` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `click_through_rate` varchar(255) NOT NULL DEFAULT '',
  `revenue` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stat_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `campaign_analytics_id` (`campaign_analytics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `campaign_analytics_item_data_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `campaign_analytics_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item` varchar(255) NOT NULL DEFAULT '',
  `follows` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `reads` int(10) unsigned NOT NULL DEFAULT '0',
  `shares` int(10) unsigned NOT NULL DEFAULT '0',
  `share_rate` varchar(255) NOT NULL DEFAULT '',
  `sign_ups` int(10) unsigned NOT NULL DEFAULT '0',
  `coupons` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `click_through_rate` varchar(255) NOT NULL DEFAULT '',
  `revenue` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stat_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `avg_order` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `campaign_analytics_id` (`campaign_analytics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `campaign_participate_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `campaign_id` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `is_share` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_share_coupon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `telephone` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `share_code` varchar(255) NOT NULL DEFAULT '',
  `participate_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `share_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `internal_name` varchar(255) NOT NULL DEFAULT '',
  `campaign_name` varchar(255) NOT NULL DEFAULT '',
  `is_verify_mobile` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `begin_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `coupons_id` varchar(255) NOT NULL DEFAULT '',
  `tags_id` varchar(255) NOT NULL DEFAULT '',
  `welcome_page_cover` varchar(255) NOT NULL DEFAULT '',
  `win_page_cover` varchar(255) NOT NULL DEFAULT '',
  `win_page_des` text NOT NULL,
  `verify_page_cover` varchar(255) NOT NULL DEFAULT '',
  `verify_page_des` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `has_promotion_share` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `share_coupons_id` varchar(255) NOT NULL DEFAULT '',
  `win_page_des_2` text NOT NULL,
  `verify_page_des_2` text NOT NULL,
  `complete_page_cover` varchar(255) NOT NULL DEFAULT '',
  `complete_page_des` text NOT NULL,
  `complete_page_des_2` text NOT NULL,
  `verify_page_mobile_number_style` varchar(255) NOT NULL DEFAULT '',
  `verify_page_get_code_button_style` varchar(255) NOT NULL DEFAULT '',
  `verify_page_submit_button_style` varchar(255) NOT NULL DEFAULT '',
  `complete_page_view_code_button_style` varchar(255) NOT NULL DEFAULT '',
  `complete_page_use_code_button_style` varchar(255) NOT NULL DEFAULT '',
  `complete_page_share_button_style` varchar(255) NOT NULL DEFAULT '',
  `is_use_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `share_thumbnails_image` varchar(255) NOT NULL DEFAULT '',
  `share_message` text NOT NULL,
  `share_confirm_notification` text NOT NULL,
  `mobile_number_input_text` varchar(255) NOT NULL DEFAULT '',
  `verify_code_input_text` varchar(255) NOT NULL DEFAULT '',
  `get_code_button_text` varchar(255) NOT NULL DEFAULT '',
  `submit_button_text` varchar(255) NOT NULL DEFAULT '',
  `view_code_button_text` varchar(255) NOT NULL DEFAULT '',
  `use_code_button_text` varchar(255) NOT NULL DEFAULT '',
  `share_button_text` varchar(255) NOT NULL DEFAULT '',
  `verify_page_verify_code_style` varchar(255) NOT NULL DEFAULT '',
  `use_code_button_link_to` varchar(255) NOT NULL DEFAULT '',
  `validation_sms_sent_message` varchar(255) NOT NULL DEFAULT '',
  `validation_sms_send_failed_message` varchar(255) NOT NULL DEFAULT '',
  `validation_code_wrong_message` varchar(255) NOT NULL DEFAULT '',
  `verify_page_name_style` varchar(255) NOT NULL DEFAULT '',
  `name_input_text` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `card_issue_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `source` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `card_id` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(255) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `is_use` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `get_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `use_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_custom_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `logo_url` varchar(255) NOT NULL DEFAULT '',
  `code_type` varchar(255) NOT NULL DEFAULT '',
  `brand_name` varchar(36) NOT NULL DEFAULT '',
  `title` varchar(27) NOT NULL DEFAULT '',
  `sub_title` varchar(54) NOT NULL DEFAULT '',
  `color` varchar(16) NOT NULL DEFAULT '',
  `notice` varchar(48) NOT NULL DEFAULT '',
  `description` varchar(3072) NOT NULL DEFAULT '',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `date_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `begin_timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `end_timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `fixed_term` int(10) unsigned NOT NULL DEFAULT '0',
  `fixed_begin_term` int(10) unsigned NOT NULL DEFAULT '0',
  `use_custom_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bind_openid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `service_phone` varchar(24) NOT NULL DEFAULT '',
  `location_id_list` text NOT NULL,
  `source` varchar(36) NOT NULL DEFAULT '',
  `custom_url_name` varchar(15) NOT NULL DEFAULT '',
  `custom_url` varchar(128) NOT NULL DEFAULT '',
  `custom_url_sub_title` varchar(18) NOT NULL DEFAULT '',
  `promotion_url_name` varchar(15) NOT NULL DEFAULT '',
  `promotion_url` varchar(128) NOT NULL DEFAULT '',
  `promotion_url_sub_title` varchar(18) NOT NULL DEFAULT '',
  `get_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `can_share` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `can_give_friend` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `card_type` varchar(24) NOT NULL DEFAULT '',
  `deal_detail` varchar(24) NOT NULL DEFAULT '',
  `least_cost` int(10) unsigned NOT NULL DEFAULT '0',
  `reduce_cost` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` int(10) unsigned NOT NULL DEFAULT '0',
  `gift` varchar(3072) NOT NULL DEFAULT '',
  `default_detail` varchar(3072) NOT NULL DEFAULT '',
  `location_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `card_id` varchar(255) NOT NULL DEFAULT '',
  `post_code` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `has_custom_url` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `has_promotion_url` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `internal_name` varchar(255) NOT NULL DEFAULT '',
  `tags_id` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `meeting_detail` varchar(3072) NOT NULL DEFAULT '',
  `map_url` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `config_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `connection_engine_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned DEFAULT NULL,
  `window_type` text COMMENT '窗口时间',
  `preview_times` int(10) unsigned DEFAULT '0' COMMENT 'preview接口调用次数',
  `group_times` int(10) unsigned DEFAULT '0' COMMENT 'group接口调用次数',
  `allow_group_channel_times` int(10) unsigned DEFAULT '0' COMMENT '允许群发次数(0-4)',
  `status` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `connection_engine_config_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `journeyIds` varchar(255) NOT NULL DEFAULT '',
  `window_time` varchar(255) NOT NULL DEFAULT '',
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `mid_status` (`mid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `connection_engine_journey_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `journeyId` int(10) unsigned NOT NULL DEFAULT '0',
  `window_time_type` int(10) unsigned NOT NULL DEFAULT '0',
  `window_time_value` varchar(255) NOT NULL DEFAULT '',
  `journey_higher_priority` int(10) unsigned NOT NULL DEFAULT '0',
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `mid_journeyId_status` (`mid`,`journeyId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `connection_engine_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `postId` varchar(255) NOT NULL DEFAULT '',
  `journeyId` int(10) unsigned NOT NULL DEFAULT '0',
  `journeyQueueId` int(10) unsigned NOT NULL DEFAULT '0',
  `flowId` int(10) unsigned NOT NULL DEFAULT '0',
  `scheduleId` int(10) unsigned NOT NULL DEFAULT '0',
  `scJson` longtext,
  `sendTime` datetime DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `connection_engine_schedule_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `to_users` longtext,
  `flow_ids` longtext,
  `type` varchar(255) NOT NULL DEFAULT '',
  `postId` varchar(255) NOT NULL DEFAULT '',
  `scheduleId` int(10) unsigned NOT NULL DEFAULT '0',
  `journey_ids` varchar(255) NOT NULL DEFAULT '',
  `connection_engine_queue_ids` longtext,
  `scJson` longtext,
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0=>pending,1=>success,2=>cancel,3=>processing,4=>fail',
  `send_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_status_scheduleId` (`mid`,`status`,`scheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `cTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `mid` varchar(255) NOT NULL COMMENT 'mid',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `use_tips` varchar(255) NOT NULL COMMENT '使用说明',
  `end_tips` text NOT NULL COMMENT '过期说明',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券数量',
  `max_num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '每人最多允许获取次数',
  `follower_condtion` char(50) NOT NULL DEFAULT '1' COMMENT '粉丝状态',
  `collect_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已领取数',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览人数',
  `end_img` varchar(10) DEFAULT NULL COMMENT '过期提示图片',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `coupon_record` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(10) NOT NULL COMMENT '粉丝UID',
  `cTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已使用',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `mid` int(10) unsigned NOT NULL COMMENT '来源ID',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券ID',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否可用',
  `is_attend` tinyint(4) NOT NULL DEFAULT '0',
  `tel` varchar(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cron_update_segmentation_tag_to_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dynamic_rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  `update_sql` text,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custom_data_errors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `action_type` varchar(255) NOT NULL DEFAULT '',
  `module_name` varchar(255) NOT NULL DEFAULT '',
  `appid` varchar(255) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `action_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custom_data_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `action_type` varchar(255) NOT NULL DEFAULT '',
  `module_name` varchar(255) NOT NULL DEFAULT '',
  `appid` varchar(255) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `action_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custom_data_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `custom_data_title` varchar(255) NOT NULL DEFAULT '',
  `note` text,
  `module_name` varchar(255) NOT NULL DEFAULT '',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_set_funnel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custom_data_report_funnel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL DEFAULT '0',
  `json_data` text NOT NULL,
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custom_template_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `inner_title` varchar(100) DEFAULT '',
  `template_id` varchar(255) NOT NULL DEFAULT '',
  `inner_template_id` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT '',
  `primary_industry` varchar(100) DEFAULT '',
  `deputy_industry` varchar(100) NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8mb4 NOT NULL,
  `example` text CHARACTER SET utf8mb4 NOT NULL,
  `url` varchar(200) DEFAULT '',
  `topcolor` varchar(100) DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `is_delete` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `custom_themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `style` text NOT NULL,
  `text` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_image_url` varchar(255) NOT NULL DEFAULT '',
  `logo_url` varchar(255) NOT NULL DEFAULT '',
  `head_logo_url` varchar(255) NOT NULL DEFAULT '',
  `wechat_account` varchar(250) NOT NULL DEFAULT '',
  `wechat_password` varchar(250) NOT NULL DEFAULT '',
  `app_id` varchar(250) NOT NULL DEFAULT '',
  `app_sceret` varchar(250) NOT NULL DEFAULT '',
  `app_url` varchar(250) NOT NULL DEFAULT '',
  `token` varchar(250) NOT NULL DEFAULT '',
  `qiniu_cdn_host` char(40) NOT NULL DEFAULT '',
  `oauth_url` char(40) NOT NULL DEFAULT '',
  `oauth_site_type` tinyint(4) NOT NULL DEFAULT '0',
  `telephone` char(11) DEFAULT '',
  `qq` char(20) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `open_id` varchar(255) NOT NULL DEFAULT '',
  `account_type` char(1) NOT NULL DEFAULT '',
  `group_message` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_date` char(11) NOT NULL DEFAULT '',
  `click_through_url` char(40) NOT NULL DEFAULT '',
  `coupon_card_code` int(10) unsigned NOT NULL DEFAULT '0',
  `mchid` varchar(255) NOT NULL DEFAULT '',
  `payment_key` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_account_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 => Not Account Admin, 1 => Is Account Admin',
  `is_watermark` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `watermark_location` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `watermark_note` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0=>Inactive, 1=>Active',
  `elastic_search_index_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `customer_closed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` char(40) NOT NULL DEFAULT '',
  `closed_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `customer_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(40) NOT NULL DEFAULT '',
  `service_closed_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `worker` char(40) NOT NULL DEFAULT '',
  `execute_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `customer_service_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `worker` char(40) NOT NULL DEFAULT '',
  `customer` char(40) NOT NULL DEFAULT '',
  `opercode` char(10) NOT NULL DEFAULT '',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `text` text CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `customer_service_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `worker` char(40) NOT NULL DEFAULT '',
  `customer` char(40) NOT NULL DEFAULT '',
  `score` char(3) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `service_close_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `daily_follower` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date DEFAULT NULL,
  `new_follows` int(10) unsigned NOT NULL DEFAULT '0',
  `total_follows` int(10) unsigned NOT NULL DEFAULT '0',
  `unfollows` int(10) unsigned NOT NULL DEFAULT '0',
  `unfollow_rate` decimal(12,4) DEFAULT '0.0000',
  `avg_actions` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `daily_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date DEFAULT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `shares` int(10) unsigned NOT NULL DEFAULT '0',
  `sent` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `data_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wid` bigint(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1:关注 2：消息',
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据统计';

CREATE TABLE `data_validated_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `data` varchar(255) NOT NULL DEFAULT '',
  `created_date` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `default_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `replyType` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1=>text, 2=>post, 3=>image',
  `replyContent` text NOT NULL,
  `resId` int(10) unsigned NOT NULL DEFAULT '0',
  `mediaId` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `media_url` varchar(500) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_area` (
  `area_id` int(10) unsigned NOT NULL COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Area code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Area Name',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_area_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `area_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Area Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Area Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_city` (
  `city_id` int(10) unsigned NOT NULL COMMENT 'City Id',
  `province_id` int(10) NOT NULL,
  `default_name` varchar(255) DEFAULT NULL COMMENT 'City Name',
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_city_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'City Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'City Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL DEFAULT '' COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_country_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `country_id` int(10) unsigned NOT NULL COMMENT 'Country Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Country Name',
  `region_id` int(10) unsigned NOT NULL COMMENT 'Region Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_district` (
  `district_id` int(10) unsigned NOT NULL COMMENT 'District Id',
  `city_id` int(10) NOT NULL,
  `default_name` varchar(255) DEFAULT NULL COMMENT 'District Name',
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_district_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `district_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'District Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'District Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_province` (
  `province_id` int(10) unsigned NOT NULL COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `area_id` int(10) NOT NULL,
  `code` varchar(32) DEFAULT NULL COMMENT 'Province code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`province_id`),
  KEY `IDX_DIRECTORY_PROVINCE_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_province_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `province_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Province Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Province Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `directory_region_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Country Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dynamic_menu_segmentation_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dynamic_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `conditions_serialized` text NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `mid` int(11) NOT NULL,
  `tags_id` varchar(2550) NOT NULL,
  `save_new` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0 => not save tag to new customer, 1 => save tag to new customer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ecommerce_analytics_item_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date DEFAULT NULL,
  `views_count` int(10) unsigned NOT NULL DEFAULT '0',
  `click_through` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `revenue` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ecommerce_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `channel` varchar(255) NOT NULL,
  `fields` text,
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ecommerce_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT '',
  `order_date` datetime DEFAULT '0000-00-00 00:00:00',
  `order_no` varchar(255) NOT NULL DEFAULT '',
  `total` decimal(12,4) DEFAULT NULL,
  `data` text,
  `order_intdate` int(10) unsigned NOT NULL DEFAULT '0',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `order_intdate` (`order_intdate`),
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ecommerce_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `fields` text,
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ecommerce_import_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `connect_type` varchar(255) NOT NULL DEFAULT 'telephone',
  `connect_value` varchar(255) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `import_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `connect_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_status` (`mid`,`status`),
  KEY `connect_value` (`connect_value`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `eips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `ps_team` varchar(255) NOT NULL,
  `personal_shopper` varchar(255) NOT NULL,
  `business_account_id` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `bind_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_ps_team_personal_shopper_business_account_id` (`mid`,`ps_team`,`personal_shopper`,`business_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `eips_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `personal_shopper` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_admin_id_personal_shopper` (`mid`,`admin_id`,`personal_shopper`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `eips_config_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `updated_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `eips_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `updated_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `eips_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `flag` int(10) unsigned NOT NULL DEFAULT '0',
  `follower_id_list_string` longtext NOT NULL,
  `start_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `end_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `elastic_search_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `es_index_name` varchar(255) NOT NULL DEFAULT 'default_jingsocial',
  `es_index_host` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `es_index_port` varchar(255) NOT NULL DEFAULT '9200',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `es_index_host_name` (`es_index_host`,`es_index_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `engagement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `rule` varchar(255) NOT NULL,
  `e_level_1` varchar(255) NOT NULL,
  `e_level_2` varchar(255) NOT NULL,
  `e_level_3` varchar(255) NOT NULL,
  `e_level_4` varchar(255) NOT NULL,
  `value1` int(10) unsigned NOT NULL DEFAULT '0',
  `value2` int(10) unsigned NOT NULL DEFAULT '0',
  `value3` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `enter_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `journey_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `segment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  `enter_start_date` bigint(20) unsigned NOT NULL DEFAULT '0',
  `enter_end_date` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `enter_group_openids` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `journey_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `segment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enter_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid_status_openid_segment_id` (`mid`,`status`,`openid`,`segment_id`),
  KEY `journey_id` (`journey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `enter_group_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `journey_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `execute_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(11) unsigned NOT NULL DEFAULT '0',
  `limit` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(8000) DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `verify` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `maxNumber` int(10) unsigned DEFAULT '0',
  `tip` varchar(255) DEFAULT NULL,
  `welcome_message` char(255) NOT NULL DEFAULT '',
  `participate_message` char(255) NOT NULL DEFAULT '',
  `limit_message` varchar(255) NOT NULL DEFAULT 'Sorry!Limit!',
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `verify` (`verify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `event_callback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `event_invitation_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(11) unsigned NOT NULL DEFAULT '0',
  `event_id` int(11) unsigned NOT NULL DEFAULT '0',
  `invitee_open_id` varchar(255) NOT NULL DEFAULT '',
  `inviter_open_id` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `open_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `invitee_open_id` (`invitee_open_id`),
  KEY `inviter_open_id` (`inviter_open_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `event_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(11) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL DEFAULT '',
  `event_id` int(11) unsigned NOT NULL,
  `phone` varchar(255) NOT NULL,
  `verified` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `is_verify` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `openid` (`openid`),
  KEY `verified` (`verified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `forward_miskeyword` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `location_forward` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `qrcode_forward` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `first_attention` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wid` bigint(20) DEFAULT NULL COMMENT 'pubs表中的id',
  `resource_id` int(11) DEFAULT NULL COMMENT '素材管理表中的id',
  `typ` varchar(24) DEFAULT NULL COMMENT '自动回复类型 0:文字1：图文（单图文）',
  `content` text CHARACTER SET utf8mb4 COMMENT '回复内容',
  `status` int(1) NOT NULL,
  `mediaId` varchar(255) NOT NULL DEFAULT '',
  `media_url` varchar(500) NOT NULL DEFAULT '',
  `source_channel_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `resource_id` (`resource_id`),
  KEY `typ` (`typ`),
  KEY `status` (`status`),
  KEY `mid_source_channel_id` (`wid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首次关注自动回复表';

CREATE TABLE `follower_action_time_all_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `action_time` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `total` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_intdate` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_action_time_openid_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `action_time` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL,
  `total` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ref_date_mid` (`ref_date`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_analytics_action_counts_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) DEFAULT NULL,
  `action_counts` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_analytics_item_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date DEFAULT NULL,
  `action_type` varchar(255) DEFAULT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_analytics_last_action_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `keyword` varchar(1000) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_eav_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联follower_eav_category分类表主键id',
  PRIMARY KEY (`id`),
  KEY `mid_index` (`mid`),
  KEY `field_category_id_index` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_eav_attribute_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_eav_attribute_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'profile',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `attribute_index` (`attribute_id`),
  KEY `attribute_openid_index` (`attribute_id`,`openid`),
  KEY `created_at` (`created_at`),
  KEY `source_channel_id` (`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_eav_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '平台用户id',
  `category_name` varchar(80) NOT NULL DEFAULT '' COMMENT 'eav 目录分类名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1,可用; 2,不可用 ...',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '2' COMMENT '记录是否删除，1，已删除，2，正常 ...',
  `updated_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录最近修改时间',
  `created_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='follower field 目录表';

CREATE TABLE `follower_kol_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `shares_reads` int(10) unsigned DEFAULT '0',
  `share_post` int(10) unsigned DEFAULT '0',
  `revenue` decimal(12,4) DEFAULT '0.0000',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_rating_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `action_name` varchar(255) NOT NULL DEFAULT '',
  `score` int(10) unsigned NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_source_analytics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date NOT NULL DEFAULT '0000-00-00',
  `user_source` int(10) NOT NULL DEFAULT '0',
  `new_user` int(10) NOT NULL DEFAULT '0',
  `cancel_user` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref_date` (`ref_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follower_tag_count_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `follower_tag_unique` (`openid`,`mid`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `form_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inter_name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `mid` int(11) NOT NULL DEFAULT '0',
  `qrcode_id` int(11) NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date_message` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `verify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Cellphone Validation',
  `participate_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Allowed to participate times',
  `verify_sent_success_message` varchar(255) NOT NULL DEFAULT '',
  `verify_sent_failed_message` varchar(255) NOT NULL DEFAULT '',
  `thank_message` varchar(255) NOT NULL DEFAULT '',
  `verify_code_error_message` varchar(255) NOT NULL DEFAULT '',
  `out_of_participate_times_message` varchar(255) NOT NULL DEFAULT '',
  `already_signed_up_message` varchar(255) NOT NULL DEFAULT '',
  `form_event_closed_message` varchar(255) NOT NULL DEFAULT '',
  `welcome_message` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00',
  `tags_id` varchar(40) DEFAULT NULL,
  `customer_name_comment` varchar(255) NOT NULL DEFAULT '',
  `customer_name_required` tinyint(4) DEFAULT '0',
  `customer_name_hidden` tinyint(4) DEFAULT '0',
  `telephone_comment` varchar(255) NOT NULL DEFAULT '',
  `friend_count_comment` varchar(255) NOT NULL DEFAULT '',
  `friend_count_required` tinyint(4) DEFAULT '0',
  `friend_count_hidden` tinyint(4) DEFAULT '0',
  `customer_comment` varchar(255) NOT NULL DEFAULT '',
  `customer_comment_required` tinyint(4) DEFAULT '0',
  `customer_comment_hidden` tinyint(4) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `telephone_required` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `form_event_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_event_id` int(11) NOT NULL DEFAULT '0',
  `open_id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `telephone` varchar(255) NOT NULL DEFAULT '00000000000',
  `mid` int(11) NOT NULL DEFAULT '0',
  `friends` int(11) NOT NULL DEFAULT '0',
  `comments` longtext CHARACTER SET utf8mb4 NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paid` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `grata_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grata_token` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `grata_service_follower` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `grata_session_id` varchar(255) NOT NULL DEFAULT '',
  `grata_session_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `group_customer_message_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `msg_type` varchar(255) NOT NULL DEFAULT '',
  `post_queue_id` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `group_message_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) unsigned NOT NULL DEFAULT '0',
  `content` varchar(10000) NOT NULL DEFAULT '',
  `content_type` varchar(255) NOT NULL DEFAULT '',
  `message_type` varchar(255) NOT NULL DEFAULT '',
  `response` varchar(255) NOT NULL DEFAULT '',
  `errcode` varchar(255) DEFAULT '',
  `msg_id` char(20) NOT NULL DEFAULT '',
  `media_id` char(200) NOT NULL DEFAULT '',
  `send_from` varchar(255) NOT NULL DEFAULT '',
  `send_to` longtext,
  `receiver_count` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `rid` int(11) NOT NULL DEFAULT '0',
  `msg_data_id` varchar(255) NOT NULL DEFAULT '',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 => Not deleted, 1 => Deleted',
  `tags_id` varchar(255) NOT NULL DEFAULT '',
  `segmentation_id` int(10) unsigned DEFAULT '0',
  `post_send_queue_id` int(10) unsigned DEFAULT NULL,
  `created_intdate` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `content_type` (`content_type`),
  KEY `message_type` (`message_type`),
  KEY `response` (`response`),
  KEY `send_from` (`send_from`),
  KEY `created_intdate` (`created_intdate`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `count` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `is_available` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `count` (`count`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `health_check_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `ruleid` int(10) unsigned NOT NULL,
  `score` varchar(255) NOT NULL,
  `date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `health_check_standard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` int(10) unsigned NOT NULL COMMENT '类型:1-一级类目 2-二级类目 3-三级类目',
  `score` int(10) unsigned NOT NULL COMMENT '权重占比',
  `goal` varchar(255) NOT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `belongto` varchar(255) NOT NULL COMMENT '隶属于类目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `health_check_standard_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `standard_id` int(10) unsigned NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `goal` varchar(255) NOT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `html_five_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `internal_name` varchar(255) NOT NULL DEFAULT '',
  `tags_id` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `cover` varchar(255) NOT NULL DEFAULT '',
  `image_list` text NOT NULL,
  `last_page_switch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_page_link` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `image_path` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(255) NOT NULL DEFAULT '',
  `local_image` varchar(255) NOT NULL DEFAULT '',
  `wechat_image` varchar(255) NOT NULL DEFAULT '',
  `cdn_image` varchar(255) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `master_admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员账户id',
  PRIMARY KEY (`id`),
  KEY `mid_type` (`mid`,`type`),
  KEY `mid` (`mid`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ims_binding_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(45) NOT NULL,
  `openid` varchar(100) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `status` char(1) NOT NULL,
  `membercode` varchar(45) DEFAULT NULL,
  `uniacid` smallint(5) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `interactive_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` char(40) NOT NULL DEFAULT '',
  `action_type` char(40) NOT NULL DEFAULT '',
  `action_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `action_time` (`action_time`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `journey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `is_once` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `times` int(10) unsigned NOT NULL DEFAULT '0',
  `tree_data` text,
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  `duplicate_flow_solution` int(11) NOT NULL DEFAULT '1',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_enter_group` tinyint(4) NOT NULL DEFAULT '0',
  `source_channel_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `journey_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '平台用户id',
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT 'journey分类名称',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '2' COMMENT '记录是否删除，1，已删除，2，正常 ...',
  `update_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `journey_date` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL,
  `status` smallint(6) DEFAULT '0',
  `yearly` smallint(6) DEFAULT '0',
  `journey_id` int(10) unsigned NOT NULL DEFAULT '0',
  `trigger_date` varchar(255) NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid_trigger_date` (`mid`,`trigger_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `journey_flow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `journey_id` int(10) unsigned NOT NULL DEFAULT '0',
  `next_node_id` int(10) unsigned NOT NULL DEFAULT '0',
  `next_action_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  `node_id` int(10) unsigned DEFAULT '0',
  `connection_engine` int(4) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `journey_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `journey_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL,
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  `tree_data` varchar(255) DEFAULT '',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `journey_node_path` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `node_id` int(10) unsigned NOT NULL DEFAULT '0',
  `path_key` varchar(255) NOT NULL,
  `next_node_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  `source_point` varchar(255) NOT NULL DEFAULT '',
  `target_point` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `journey_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `combination_priority` varchar(255) DEFAULT NULL,
  `postid` int(10) unsigned NOT NULL DEFAULT '0',
  `flowid` int(10) unsigned DEFAULT '0',
  `starttime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `endtime` bigint(20) DEFAULT NULL,
  `created_time` bigint(20) DEFAULT NULL,
  `journeyid` int(10) unsigned NOT NULL DEFAULT '0',
  `flow_status_id` int(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `key_word` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `pubsId` varchar(255) DEFAULT NULL COMMENT 'pubs表中的id',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `keyWord` varchar(255) DEFAULT NULL COMMENT '关键字',
  `matchingType` varchar(255) DEFAULT NULL COMMENT '匹配模式 1:模糊匹配2:全匹配',
  `replyType` tinyint(1) unsigned DEFAULT NULL COMMENT '回复类型 1：文字2：图文',
  `replyContent` text COMMENT '回复内容',
  `resId` int(11) DEFAULT NULL COMMENT 'res表中的id',
  `mediaId` varchar(255) NOT NULL DEFAULT '',
  `trigger_count` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` datetime DEFAULT NULL,
  `internal_name` varchar(255) DEFAULT NULL,
  `tags_id` char(40) NOT NULL DEFAULT '',
  `category` varchar(30) DEFAULT NULL,
  `media_url` varchar(500) NOT NULL DEFAULT '',
  `source_channel_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义关键字';

CREATE TABLE `latest_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) DEFAULT '',
  `province` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `livecom_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `local_url` varchar(255) NOT NULL DEFAULT '',
  `wechat_url` varchar(255) NOT NULL DEFAULT '',
  `cdn_url` varchar(255) NOT NULL DEFAULT '',
  `media_id` varchar(255) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_type` (`mid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `menu` text CHARACTER SET utf8mb4,
  `ispost` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu_click_original_link_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `ord` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `link_url` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu_hashkey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `cacheKey` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu_publish_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `menu_datas` text NOT NULL,
  `runtime` int(10) unsigned DEFAULT '0',
  `response_error_message` varchar(255) DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu_query` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0',
  `from` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `to` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_mark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `content` varchar(5000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `content_type` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `event` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `reply_to` int(11) NOT NULL DEFAULT '0',
  `is_keyword` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `keyword_id` int(10) unsigned NOT NULL DEFAULT '0',
  `is_read` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>not read, 1=>read',
  `local_image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `message_source` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>message of system, 1=>message of Customer Service',
  `trigger_id` int(10) unsigned NOT NULL DEFAULT '0',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid_create_time_keyword` (`mid`,`create_time`,`is_keyword`,`keyword_id`),
  KEY `mid_content_type_to` (`mid`,`content_type`,`to`),
  KEY `OPENID_MID_INDEX` (`from`,`mid`),
  KEY `mid_content_type` (`mid`,`content_type`),
  KEY `mid_is_read` (`mid`,`is_read`),
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `message_48_list_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `msg_type` varchar(255) NOT NULL DEFAULT '',
  `text` text,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_queue_id` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `message_post_analytics_item_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `part` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sent` int(11) DEFAULT NULL,
  `triggerd` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `readmore` int(11) DEFAULT NULL,
  `shares_reads` int(11) DEFAULT NULL,
  `shares_jssdk` int(11) DEFAULT NULL,
  `ref_date` date DEFAULT NULL,
  `views_count` int(10) unsigned NOT NULL DEFAULT '0',
  `readmore_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_api_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_jssdk_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_reads_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_timeline_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_timeline_user` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_appmessage_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_appmessage_user` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_qq_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_qq_user` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_qzone_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_qzone_user` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_weibo_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_weibo_user` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`) USING BTREE,
  KEY `ref_date` (`ref_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `message_post_sent_by_custom_send` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `from_user_name` varchar(255) NOT NULL DEFAULT '',
  `to_user_name` varchar(255) NOT NULL DEFAULT '',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `mid_created` (`mid`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `message_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0',
  `reply_from` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `reply_to` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_mark` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `content_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `event` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `message_source` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>message of system, 1=>message of Customer Service',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid_message_id_create_time` (`mid`,`message_id`,`create_time`),
  KEY `OPENID_MID_INDEX` (`reply_to`,`mid`),
  KEY `create_time` (`create_time`),
  KEY `mid_content_type_created_time` (`mid`,`content_type`,`create_time`),
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `monitor_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `journey_id` int(10) unsigned NOT NULL DEFAULT '0',
  `segment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `flow_id` int(10) unsigned NOT NULL DEFAULT '0',
  `node_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multip_channel_email_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `campaignID` int(10) unsigned NOT NULL,
  `webpower_group_id` int(10) unsigned DEFAULT NULL,
  `groupName` varchar(255) NOT NULL,
  `remarks` varchar(255) DEFAULT '',
  `is_test` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_campaignID_status_is_test` (`mid`,`campaignID`,`status`,`is_test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multip_channel_email_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `email_id` int(10) unsigned NOT NULL,
  `message_type` varchar(255) NOT NULL,
  `response` varchar(255) NOT NULL,
  `send_to` longtext NOT NULL,
  `receiver_count` int(10) unsigned DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `channel` varchar(255) NOT NULL DEFAULT 'webpower',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multip_channel_email_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multip_channel_email_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `campaignID` int(10) unsigned NOT NULL,
  `mailingName` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `lang` varchar(100) NOT NULL DEFAULT 'cn',
  `subject` varchar(255) NOT NULL,
  `fromName` varchar(100) NOT NULL,
  `preheader` varchar(255) DEFAULT NULL,
  `senderID` int(10) unsigned NOT NULL DEFAULT '0',
  `html` longtext CHARACTER SET utf8mb4 NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT '1970-01-01 00:00:00',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>Pending, 1=>Complete, 2=>Processing,3=>Failed',
  `is_delete` tinyint(3) unsigned DEFAULT '0' COMMENT '0=>未删除, 1=>删除',
  `webpower_mailing_id` int(10) unsigned DEFAULT '0',
  `is_send` tinyint(3) unsigned DEFAULT '0' COMMENT '0=>未发送, 1=>发送',
  `sender` varchar(255) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'webpower',
  PRIMARY KEY (`id`),
  KEY `mid_status_is_delete` (`mid`,`status`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multip_channel_sms_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `sms_id` int(10) unsigned NOT NULL,
  `message_type` varchar(255) NOT NULL,
  `response` longtext NOT NULL,
  `send_to` longtext NOT NULL,
  `type` tinyint(3) unsigned DEFAULT '0' COMMENT '0=>single, 1=>batch',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `channel` varchar(255) NOT NULL DEFAULT 'webpower',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multip_channel_sms_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multip_channel_sms_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `campaignID` int(10) unsigned NOT NULL,
  `smsName` varchar(255) NOT NULL,
  `smsContent` varchar(400) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT '1970-01-01 00:00:00',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>Pending, 1=>Complete, 2=>Processing,3=>Failed',
  `is_delete` tinyint(3) unsigned DEFAULT '0',
  `is_send` tinyint(3) unsigned DEFAULT '0' COMMENT '0=>未发送, 1=>发送',
  `channel` varchar(255) NOT NULL DEFAULT 'webpower',
  PRIMARY KEY (`id`),
  KEY `mid_is_delete` (`mid`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `multip_channel_sms_template_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `key` varchar(255) NOT NULL DEFAULT 'pending',
  `short_url` text NOT NULL,
  `url` text NOT NULL,
  `is_delete` tinyint(3) unsigned DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_key_is_delete` (`mid`,`key`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `o2o_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `conditions_serialized` text NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `o2o_sales_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `role` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tasks_id` varchar(255) NOT NULL DEFAULT '0',
  `is_delete` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `o2o_sales_team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `tel` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `sales_no` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `job` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1=>sales,2=>manager',
  `openid` varchar(120) NOT NULL DEFAULT '' COMMENT 'sales openid',
  `is_binding` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1=>binding',
  `head_img` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0=>disable, 1=>enable',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `lead_share` int(10) unsigned NOT NULL DEFAULT '0',
  `lead_subscribe` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` varchar(255) NOT NULL DEFAULT '0',
  `qrcode_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tmp_qrcode_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT NULL,
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>enable,1=>delete',
  `deleted_time` datetime DEFAULT NULL,
  `fields_submit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `o2o_score_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `sales_id` varchar(20) NOT NULL DEFAULT '',
  `openid` varchar(120) NOT NULL DEFAULT '' COMMENT 'openid',
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1=>store,2=>store_team,3->post,4->product,5->promotion',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `o2o_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `banner` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `o2o_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `sales_id` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(120) NOT NULL DEFAULT '',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `share` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '1=>share,0=>non-share',
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `o2o_sms_send` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1=>login,2=>...',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT 'sales person tel',
  `sms_code` varchar(20) NOT NULL DEFAULT '' COMMENT 'sales message',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1=>enable,2=>disable',
  `expired_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `o2o_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  `phone` varchar(255) DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `image` varchar(255) DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `o2o_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `online_offline_campaign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `campaignType` int(11) NOT NULL COMMENT '0-线上 1-线下',
  `startdate` int(10) unsigned NOT NULL,
  `enddate` int(11) NOT NULL,
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `op_name` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`),
  KEY `qid_2` (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `personal_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `segment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` int(10) unsigned NOT NULL DEFAULT '0',
  `public_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `updated_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `native_menuid` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid_menu_id` (`mid`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `platform_service_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `sessionid` varchar(255) NOT NULL DEFAULT '',
  `agent` varchar(255) NOT NULL DEFAULT '',
  `chatcontent` varchar(2550) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `chatstarttime` datetime DEFAULT NULL,
  `chatendtime` datetime DEFAULT NULL,
  `totalmessage` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `create_timestamp` int(11) DEFAULT NULL,
  `passtowebservicetime` datetime DEFAULT NULL COMMENT 'Livecom last update time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `poll` (
  `poll_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `poll_title` varchar(255) NOT NULL,
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0',
  `follower_votes` int(10) unsigned NOT NULL DEFAULT '0',
  `tags_id` char(40) NOT NULL DEFAULT '',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Start Date',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Start Date',
  `qualification` smallint(6) DEFAULT NULL COMMENT 'Vote Qualification',
  PRIMARY KEY (`poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `poll_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `answer_title` varchar(255) DEFAULT NULL COMMENT 'Answer title',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Votes Count',
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `answer_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Answers display',
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `poll_question` (
  `question_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `question_title` varchar(255) DEFAULT NULL COMMENT 'Question title',
  `type` smallint(6) DEFAULT '0' COMMENT 'Poll Type',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `poll_vote` (
  `vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `question_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Question Id',
  `poll_answer` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `ip_address` bigint(20) DEFAULT NULL COMMENT 'Poll answer id',
  `open_id` varchar(255) DEFAULT NULL,
  `vote_time` timestamp NULL DEFAULT NULL COMMENT 'Date closed',
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_analytics_item_follower_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `follows` int(11) DEFAULT NULL,
  `ref_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_analytics_item_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `part` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `sent` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `readmore` int(11) DEFAULT NULL,
  `share_rate` float DEFAULT NULL,
  `shares_reads` int(11) DEFAULT NULL,
  `shares_api` int(11) DEFAULT NULL,
  `shares_jssdk` int(11) DEFAULT NULL,
  `follows` int(11) DEFAULT NULL,
  `favorites` int(11) DEFAULT NULL,
  `link_clicks` int(11) DEFAULT NULL,
  `revenue` decimal(12,4) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `avg_order_value` decimal(12,4) DEFAULT NULL,
  `ref_date` date DEFAULT NULL,
  `views_count` int(11) NOT NULL DEFAULT '0',
  `readmore_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_api_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_jssdk_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_reads_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_timeline_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_timeline_user` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_appmessage_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_appmessage_user` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_qq_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_qq_user` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_qzone_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_qzone_user` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_weibo_count` int(10) unsigned NOT NULL DEFAULT '0',
  `shares_weibo_user` int(10) unsigned NOT NULL DEFAULT '0',
  `created_intdate` int(10) NOT NULL DEFAULT '0',
  `int_page_from_session_read_count` int(11) NOT NULL DEFAULT '0',
  `int_page_from_session_read_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created_intdate` (`created_intdate`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_analytics_item_revenue_order_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `revenue` decimal(12,4) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `avg_order_value` decimal(12,4) DEFAULT NULL,
  `ref_date` date DEFAULT NULL,
  `click_through` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `part` tinyint(4) NOT NULL DEFAULT '0',
  `created_intdate` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created_intdate` (`created_intdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `ord` tinyint(4) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `position` tinyint(4) DEFAULT NULL,
  `url` text NOT NULL,
  `tags_id` varchar(120) NOT NULL DEFAULT '' COMMENT '链接访问的tags',
  `created` datetime DEFAULT NULL,
  `title` varchar(2550) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `mid` int(11) DEFAULT NULL,
  `is_delete` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`,`ord`,`type`),
  KEY `code_is_delete` (`code`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_link_click` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_link_id` int(11) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_link_id_openid_mid` (`post_link_id`,`openid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `usertype` char(40) NOT NULL DEFAULT '',
  `msgtype` char(40) NOT NULL DEFAULT '',
  `users` longtext NOT NULL,
  `execute_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `text` text NOT NULL,
  `resId` int(10) unsigned NOT NULL DEFAULT '0',
  `tags_id` varchar(255) NOT NULL DEFAULT '',
  `segmentation_id` int(10) unsigned DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `set_key` varchar(255) DEFAULT '',
  `send_ignore_reprint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mid_resid_execute_time_execution_time` (`mid`,`create_time`,`resId`,`execute_time`),
  KEY `resId` (`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_send_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `msgtype` varchar(255) NOT NULL DEFAULT '',
  `userstype` varchar(255) NOT NULL DEFAULT '',
  `to_users` longtext NOT NULL,
  `text` text,
  `resid` int(10) unsigned NOT NULL DEFAULT '0',
  `is_preview` int(10) unsigned NOT NULL DEFAULT '0',
  `runtime` int(10) unsigned NOT NULL DEFAULT '0',
  `media_id` varchar(255) NOT NULL DEFAULT '',
  `segmentation_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `preview_method` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `scheduled_post_queueId` int(10) unsigned NOT NULL DEFAULT '0',
  `response_error_message` varchar(255) NOT NULL DEFAULT '',
  `send_ignore_reprint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_sync_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sync_from` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '同步账号id，sub->master master_admin_id, master->sub wechat_id',
  `sync_to` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '同sync-from',
  `rid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_name` varchar(100) NOT NULL DEFAULT '',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sync_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '同步类型，1，subaccount to master,2 , master to subaccount',
  `sync_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '同步时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1,Synced,2 failed',
  `created_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `postnameindex` (`post_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `scratch_id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '奖项标题',
  `title_e` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '奖项',
  `name_e` varchar(255) NOT NULL,
  `num` int(10) unsigned NOT NULL COMMENT '名额数量',
  `remain_num` int(11) NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `img` int(10) unsigned DEFAULT NULL COMMENT '奖品图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `scene_id` int(11) NOT NULL DEFAULT '0',
  `scene_name` varchar(255) NOT NULL DEFAULT '',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `event_id` int(11) unsigned NOT NULL DEFAULT '0',
  `tags_id` char(40) NOT NULL DEFAULT '',
  `reply_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>text,1=>post',
  `reply_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `auto_reply` mediumtext,
  `is_wheel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_form_event` int(11) NOT NULL DEFAULT '0',
  `ticket` varchar(255) NOT NULL DEFAULT '',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_coupon_card` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reply_coupon_card_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_image_url` varchar(255) NOT NULL DEFAULT '',
  `o2o` int(10) unsigned NOT NULL DEFAULT '0',
  `o2o_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1=>store,2=>store_team,3->post,4->product,5->promotion',
  `sales_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qrcode_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qrcode_id` int(11) NOT NULL DEFAULT '0',
  `wc_code` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wc_data` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '1:事件',
  `event_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `qrcode_id` (`qrcode_id`),
  KEY `wc_code` (`wc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) unsigned NOT NULL DEFAULT '0',
  `sid` int(11) unsigned NOT NULL DEFAULT '0',
  `qname` varchar(200) NOT NULL DEFAULT '',
  `qtype` varchar(200) NOT NULL DEFAULT '',
  `condition` char(1) DEFAULT NULL,
  `previous_question_id` int(11) DEFAULT '0',
  `previous_question_option_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `sid` (`sid`),
  KEY `mid_2` (`mid`),
  KEY `sid_2` (`sid`),
  KEY `qtype` (`qtype`),
  KEY `condition` (`condition`),
  KEY `previous_question_id` (`previous_question_id`),
  KEY `previous_question_option_id` (`previous_question_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tree_level` int(10) unsigned NOT NULL DEFAULT '0',
  `role_type` varchar(1) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `resource_name` varchar(255) DEFAULT NULL,
  `role_type` varchar(1) DEFAULT NULL,
  `permission` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `con` text CHARACTER SET utf8mb4 COMMENT 'tit,des,pic,url,cid',
  `wid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `typ` tinyint(1) DEFAULT NULL COMMENT '类型 1:单图文 2 多图文',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1=>Sent, 0=>Not Sent',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>exisited, 1=>deleted',
  `is_reply_post` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `media_id` varchar(255) NOT NULL DEFAULT '',
  `master_admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员账户id',
  `sync_from` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员账户id,mid',
  `sync_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '同步类型，1，subaccount to master,2 , master to subaccount',
  `open_o2o_for_sales` int(10) unsigned NOT NULL DEFAULT '0',
  `category` varchar(30) DEFAULT 'Other',
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `uid` (`uid`),
  KEY `typ` (`typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `res_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应resid',
  `ord` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `tags_id` varchar(2550) NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8mb4 COMMENT '文章内容',
  `detail` longtext CHARACTER SET utf8mb4,
  `title` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `url` text,
  `is_teaser_length_limit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `post_type` int(10) NOT NULL DEFAULT '0' COMMENT '0 => Normal Post, 1 => Product Template Group Post, 2 => Product Template Message Post',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `ord` (`ord`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `res_text` (
  `id` char(32) NOT NULL DEFAULT '',
  `txt` varchar(1023) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `revenue_source` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `ref_date` date DEFAULT NULL,
  `revenue` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_date` (`ref_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rotate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(40) NOT NULL DEFAULT '',
  `try_times` int(3) unsigned NOT NULL DEFAULT '0',
  `visit_times` bigint(20) unsigned NOT NULL DEFAULT '0',
  `use_times` bigint(20) unsigned NOT NULL DEFAULT '0',
  `win_times` bigint(20) unsigned NOT NULL DEFAULT '0',
  `follow_times` bigint(20) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prize1` char(40) NOT NULL DEFAULT '',
  `prize2` char(40) NOT NULL DEFAULT '',
  `prize3` char(40) NOT NULL DEFAULT '',
  `v1` float(4,1) DEFAULT '0.0',
  `v2` float(4,1) DEFAULT '0.0',
  `v3` float(4,1) DEFAULT '0.0',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claimed_times` bigint(20) unsigned NOT NULL DEFAULT '0',
  `message1` varchar(255) DEFAULT NULL,
  `message2` varchar(255) DEFAULT NULL,
  `message3` varchar(255) DEFAULT NULL,
  `notMessage` varchar(255) DEFAULT NULL,
  `tryMessage` varchar(255) DEFAULT NULL,
  `outMessage` varchar(255) DEFAULT NULL,
  `qrcode_id` int(10) unsigned NOT NULL DEFAULT '0',
  `verify_method` int(11) NOT NULL DEFAULT '1' COMMENT '1是之后验证，2是不验证，0是之前验证',
  `template_id` int(11) DEFAULT NULL,
  `empty_name` varchar(255) NOT NULL DEFAULT '',
  `empty_code` varchar(255) NOT NULL DEFAULT '',
  `overdueMessage` varchar(255) DEFAULT 'out of time',
  `submit_success` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rotate_template` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) NOT NULL,
  `image_page_bg` varchar(255) NOT NULL,
  `image_bg` varchar(255) NOT NULL,
  `image_arrow` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rotate_visit_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` char(40) NOT NULL DEFAULT '',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rotateprize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` char(40) NOT NULL DEFAULT '',
  `prize` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `username` char(40) NOT NULL DEFAULT '',
  `address` char(40) NOT NULL DEFAULT '',
  `telephone` char(20) NOT NULL DEFAULT '',
  `is_use` int(11) NOT NULL DEFAULT '0',
  `create_date` date NOT NULL DEFAULT '0000-00-00',
  `is_wheel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `claimed_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_verify` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `scene_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `scene_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `seg_export_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `seg_id` int(10) unsigned NOT NULL DEFAULT '0',
  `process` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `save_place` varchar(100) DEFAULT '',
  `save_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `download_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_seg_id_mid_process_status` (`id`,`mid`,`seg_id`,`process`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `segment_analytics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>Tag',
  `tags_id` varchar(255) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `segment_analytics_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `conditions_serialized` text NOT NULL,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `tags_id` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `segment_trigger_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `segment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `trigger_id` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>pending, 1=>complete, 2=>processing',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `trigger_id` (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `segmentation_analytics_item_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date DEFAULT NULL,
  `action_type` varchar(255) DEFAULT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ref_date` (`ref_date`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `segments_post_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>pending,1=>complete,2=>processing,3=>fail',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1=>send now,2=>send on',
  `conditions_serialized` text NOT NULL,
  `response_error_message` varchar(255) DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `updated_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `execute_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `type` tinyint(4) DEFAULT '0' COMMENT '0=> preview,1=> send',
  `send_ignore_reprint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sms_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `users` text NOT NULL,
  `execute_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sms_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(11) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>system, 1=>manager',
  `status_code` varchar(255) NOT NULL DEFAULT '',
  `result` varchar(255) NOT NULL DEFAULT '',
  `result_1` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wid` (`wid`),
  KEY `openid` (`openid`),
  KEY `status_code` (`status_code`),
  KEY `result` (`result`),
  KEY `result_1` (`result_1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sms_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_type` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `port` varchar(255) NOT NULL DEFAULT '',
  `mid` int(11) NOT NULL DEFAULT '0',
  `enable` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `statistics_text_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `article_data` longtext NOT NULL,
  `chart_data` longtext NOT NULL,
  `send_date` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `mid` int(11) NOT NULL,
  `appid` varchar(255) NOT NULL,
  `article_id` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_name` varchar(255) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT '',
  `is_trigger` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mid` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) NOT NULL DEFAULT '',
  `completion_message` varchar(255) NOT NULL DEFAULT '',
  `select_prompt_message` varchar(255) NOT NULL DEFAULT '',
  `participated_message` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `survey_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wechat_customer_open_id` varchar(255) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `end_date` datetime NOT NULL,
  `complete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `wechat_customer_open_id` (`wechat_customer_open_id`),
  KEY `mid` (`mid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `swartz_csv_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `accountid` varchar(255) DEFAULT '',
  `exitcode` varchar(255) DEFAULT '',
  `exitmsg` varchar(255) DEFAULT '',
  `accountbalance` varchar(255) DEFAULT '',
  `accountnumber` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `agegroup` varchar(255) DEFAULT '',
  `birthday` varchar(255) DEFAULT '',
  `cardtype` varchar(255) DEFAULT '',
  `gender` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `preferencestr` varchar(255) DEFAULT '',
  `registerdate` varchar(255) DEFAULT '',
  `registerstoreno` varchar(255) DEFAULT '',
  `city` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `postalcode` varchar(255) DEFAULT '',
  `telephone` varchar(255) DEFAULT '',
  `weibo` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_rand_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ans` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `system_sending_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `source_type` varchar(255) NOT NULL DEFAULT '',
  `message_type` varchar(255) NOT NULL DEFAULT '',
  `source_value` text CHARACTER SET utf8mb4 NOT NULL,
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `send_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `source_message_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tag_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '平台用户id',
  `category_name` varchar(80) NOT NULL DEFAULT '' COMMENT 'tag分类名称',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '2' COMMENT '记录是否删除，1，已删除，2，正常 ...',
  `update_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `template_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `usertype` char(40) NOT NULL DEFAULT '',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `segmentation_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `execute_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `thirdparty_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `telephone` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `gender` int(11) NOT NULL DEFAULT '0',
  `country` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `province` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `city` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `role_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `openid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `import_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mid` int(11) NOT NULL DEFAULT '0',
  `account_id` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `thirdparty_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `thirdparty_import_queue` (
  `import_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Import Id',
  `session_id` int(11) DEFAULT NULL COMMENT 'Session Id',
  `type` enum('customer','order','order_item','product') DEFAULT NULL,
  `value` text COMMENT 'Value',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Status',
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Import Data';

CREATE TABLE `thirdparty_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `total` double NOT NULL DEFAULT '0',
  `payment_method` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `shipping_method` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `coupon_code` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `shipping_amount` double NOT NULL DEFAULT '0',
  `discount_amount` double NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `import_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `mid` (`mid`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `thirdparty_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8 NOT NULL,
  `import_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mid` int(11) NOT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `sku` (`sku`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `thirdparty_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8 NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `category` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mid` int(11) NOT NULL,
  `import_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `sku` (`sku`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `thirdparty_product_config_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `updated_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_status` (`mid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `thirdparty_product_import_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `download_file_size` float NOT NULL,
  `total_cnt` int(10) unsigned NOT NULL DEFAULT '0',
  `import_cnt` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `source` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 => From tsv, 1 => From api',
  `marked_stock` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid_status` (`mid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `thirdparty_product_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `updated_time` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `thirdparty_product_template_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `local_image` varchar(255) NOT NULL,
  `wechat_image` varchar(255) NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `updated_time` datetime DEFAULT '1970-01-01 00:00:00',
  `pointer_local_image` varchar(255) NOT NULL DEFAULT '',
  `pointer_wechat_image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `travel_to_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(100) DEFAULT '',
  `province` varchar(100) DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `trigger_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `trigger_id` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` char(40) NOT NULL DEFAULT '',
  `execute_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(255) NOT NULL DEFAULT '',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `trigger_id` (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `triggers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `matching_type` varchar(255) NOT NULL DEFAULT '',
  `event_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `event` varchar(255) NOT NULL DEFAULT '',
  `action` char(40) NOT NULL DEFAULT '',
  `action_argument` text NOT NULL,
  `delay` varchar(255) NOT NULL DEFAULT '',
  `is_once` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` char(40) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>Inactive, 1=>Active',
  `qrcode_type` varchar(255) NOT NULL DEFAULT '',
  `tags_id` varchar(255) NOT NULL DEFAULT '',
  `segment_id` varchar(255) NOT NULL DEFAULT '',
  `category` varchar(30) DEFAULT NULL,
  `source_channel_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `triggers_multiple` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trigger_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action` char(40) NOT NULL DEFAULT '',
  `action_argument` text NOT NULL,
  `delay` char(80) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ttt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_link_id` int(11) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_link_id_openid_mid` (`post_link_id`,`openid`,`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `update_action_count_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_id` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>active, 1=>finished, 2=>canceled',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `update_campaign_analytics_index_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `stat_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `campaign_analytic_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `update_follower_rating_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `customer_id` text NOT NULL,
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=>active, 1=>finished, 2=>canceled',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `update_post_limitation_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openids` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `err_openid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_action_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(11) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(1000) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `source_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `source_value` varchar(255) NOT NULL DEFAULT '',
  `session_count` int(11) DEFAULT '1',
  `coupon_code` varchar(255) NOT NULL DEFAULT '',
  `created_date` int(10) NOT NULL DEFAULT '0',
  `action_time` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wid_type_create_time` (`wid`,`type`,`create_time`),
  KEY `OPENID_MID_INDEX` (`openid`,`wid`),
  KEY `wid` (`wid`),
  KEY `create_time` (`create_time`),
  KEY `created_date` (`created_date`),
  KEY `IDX_SO_KE_WI` (`source_value`,`keyword`(191),`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_actions_detail_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `total_number` decimal(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `mid_type_created_date` (`mid`,`type`,`created_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_actions_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `total_number` decimal(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  `created_intdate` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid_type_created_date` (`mid`,`type`,`created_date`),
  KEY `created_intdate` (`created_intdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_actions_openid_details_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `total_number` decimal(12,4) unsigned NOT NULL DEFAULT '0.0000',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `mid_type_created_date` (`mid`,`type`,`created_date`),
  KEY `created_date` (`created_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_cumulate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `ref_date` date NOT NULL,
  `user_source` tinyint(4) NOT NULL,
  `cumulate_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_date` (`ref_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_share_api_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `user_source` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `share_scene` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `share_count` int(10) unsigned NOT NULL DEFAULT '0',
  `share_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `ref_date` date DEFAULT NULL,
  `user_source` varchar(32) DEFAULT NULL,
  `new_user` int(11) DEFAULT NULL,
  `cancel_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_date` (`ref_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `voice_path` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(255) NOT NULL DEFAULT '',
  `local_voice` varchar(255) NOT NULL DEFAULT '',
  `wechat_voice` varchar(255) NOT NULL DEFAULT '',
  `cdn_voice` varchar(255) NOT NULL DEFAULT '',
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid_type` (`mid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `watson_coupon_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `card_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `wechat_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `unid` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `headimgurl` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `telephone` char(11) NOT NULL DEFAULT '',
  `subscribe` char(1) NOT NULL DEFAULT '',
  `name` char(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'wechat customer inner name',
  `nickname` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `sex` char(2) NOT NULL DEFAULT '',
  `language` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `city` varchar(40) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `province` varchar(40) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `country` varchar(40) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `subscribe_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `unsubscribe_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mid` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` varchar(2550) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `group_message` int(11) unsigned NOT NULL DEFAULT '0',
  `valid_date` char(11) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `action_count` int(10) unsigned NOT NULL DEFAULT '0',
  `source_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `source_value` char(40) NOT NULL DEFAULT '',
  `verify` varchar(6) CHARACTER SET utf8mb4 DEFAULT '',
  `follows_count` int(10) unsigned NOT NULL DEFAULT '0',
  `unfollows_count` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` int(10) unsigned NOT NULL DEFAULT '0',
  `subscribe_intdate` int(10) unsigned NOT NULL DEFAULT '0',
  `head_md5` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `twenty_four_hour_actions` int(10) unsigned NOT NULL DEFAULT '0',
  `last_action_time` datetime DEFAULT '0000-00-00 00:00:00',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_ids` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `unsubscribe_time` (`unsubscribe_time`),
  KEY `subscribe_intdate` (`subscribe_intdate`),
  KEY `mid` (`mid`),
  KEY `head_md5` (`head_md5`),
  KEY `unid` (`unid`),
  KEY `mid_subscribe_time` (`subscribe_time`) USING BTREE,
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `wechat_customer_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `created_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `idx_mid_type` (`mid`,`type`),
  KEY `idx_openid` (`openid`),
  KEY `created_date` (`created_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wechat_customer_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL,
  `locationX` varchar(255) DEFAULT NULL,
  `locationY` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `location_precision` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL DEFAULT '',
  `province` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `address_type` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `country` (`country`),
  KEY `locationX` (`locationX`),
  KEY `ip` (`ip`),
  KEY `openid` (`openid`),
  KEY `create_time` (`create_time`),
  KEY `mid` (`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wechat_customer_location_address_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `address_type` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `count` varchar(255) NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `openid_address_type` (`openid`,`address`,`address_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wechat_customer_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `mid` int(11) NOT NULL DEFAULT '0',
  `tag_id` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(128) NOT NULL DEFAULT '',
  `status` int(2) NOT NULL DEFAULT '1',
  `count` int(11) DEFAULT '0',
  `source_channel_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `create_time` (`create_time`),
  KEY `openid_tag_id` (`openid`,`tag_id`),
  KEY `mid_source_channel_id` (`mid`,`source_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wechat_lbs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(100) DEFAULT '',
  `province` varchar(100) DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wechat_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_code` varchar(255) CHARACTER SET utf8 NOT NULL,
  `session_data` varchar(255) CHARACTER SET utf8 NOT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mid` int(11) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `session_code` (`session_code`),
  KEY `session_data` (`session_data`),
  KEY `open_id` (`open_id`),
  KEY `mid` (`mid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `wechat_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poi_id` varchar(255) NOT NULL DEFAULT '',
  `business_name` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL COMMENT '店名',
  `description` varchar(500) NOT NULL COMMENT '店描述',
  `picurl` varchar(150) NOT NULL COMMENT '店图片地址',
  `location` varchar(200) NOT NULL COMMENT '店的地址',
  `telephone` varchar(255) NOT NULL DEFAULT '',
  `categories` varchar(255) NOT NULL DEFAULT '',
  `recommend` varchar(255) NOT NULL DEFAULT '',
  `special` varchar(255) NOT NULL DEFAULT '',
  `introduction` varchar(255) NOT NULL DEFAULT '',
  `open_time` varchar(255) NOT NULL DEFAULT '',
  `avg_price` int(10) unsigned NOT NULL DEFAULT '0',
  `province` varchar(100) DEFAULT NULL COMMENT '省',
  `city` varchar(100) DEFAULT NULL COMMENT '市',
  `district` varchar(255) NOT NULL DEFAULT '',
  `lng` double NOT NULL COMMENT '经度',
  `lat` double NOT NULL COMMENT '维度',
  `state` int(11) DEFAULT '1' COMMENT '该店的信息',
  `poi_status` int(10) unsigned NOT NULL DEFAULT '0',
  `mid` int(11) NOT NULL DEFAULT '0',
  `logo_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wechat_template_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `template_id` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT '',
  `primary_industry` varchar(100) DEFAULT '',
  `deputy_industry` varchar(100) NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8mb4 NOT NULL,
  `example` text CHARACTER SET utf8mb4 NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `is_delete` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wechat_template_message_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `inner_template_id` varchar(255) NOT NULL DEFAULT '',
  `template_id` varchar(255) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL,
  `response` longtext CHARACTER SET utf8mb4 NOT NULL,
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0=>Journey,1=>Preview',
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0=>failed,1=>sent',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `queueid_index` (`queue_id`),
  KEY `innerid_index` (`inner_template_id`),
  KEY `templateid_index` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `weekly_follower` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date DEFAULT NULL,
  `new_follows` int(10) unsigned NOT NULL DEFAULT '0',
  `total_follows` int(10) unsigned NOT NULL DEFAULT '0',
  `unfollows` int(10) unsigned NOT NULL DEFAULT '0',
  `unfollow_rate` decimal(12,4) DEFAULT '0.0000',
  `avg_actions` decimal(12,4) DEFAULT '0.0000',
  `share_rate` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `weekly_follower_nap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_week` int(10) unsigned NOT NULL DEFAULT '0',
  `total_follows` int(10) unsigned NOT NULL DEFAULT '0',
  `menu` int(10) unsigned NOT NULL DEFAULT '0',
  `qrcode_scan` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `readmore` int(10) unsigned NOT NULL DEFAULT '0',
  `shares` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `weekly_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_date` date DEFAULT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `share_rate` decimal(12,4) DEFAULT '0.0000',
  `sent` int(10) unsigned NOT NULL DEFAULT '0',
  `click_through_rate` decimal(12,4) DEFAULT '0.0000',
  `revenue` decimal(12,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `who_click_share_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `randomcode` varchar(32) DEFAULT NULL,
  `who_click_openid` varchar(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `who_share_openid` varchar(32) DEFAULT NULL,
  `who_current_share_openid` varchar(32) DEFAULT NULL,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '平台账号id',
  PRIMARY KEY (`id`),
  KEY `randomcode` (`randomcode`),
  KEY `who_click_openid` (`who_click_openid`),
  KEY `who_share_openid` (`who_share_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `who_share_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `randomcode` varchar(32) DEFAULT NULL,
  `wid` int(11) DEFAULT NULL,
  `who_share_openid` varchar(64) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `ord` tinyint(4) DEFAULT NULL,
  `share_type` varchar(64) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `page_tag` varchar(32) DEFAULT NULL,
  `kol` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `randomcode` (`randomcode`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `winner` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `uid` int(10) NOT NULL COMMENT '粉丝UID',
  `cTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已使用',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `mid` int(10) NOT NULL,
  `scratch_id` int(11) unsigned NOT NULL COMMENT '来源ID',
  `prize_id` int(10) unsigned DEFAULT '0' COMMENT '奖项ID',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否可用',
  `prize_title` varchar(255) DEFAULT NULL COMMENT '奖项',
  `is_attend` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tel` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `name` varchar(16) DEFAULT NULL COMMENT '姓名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `youku_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `redeem_at` bigint(20) DEFAULT NULL,
  `created_at` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) NOT NULL DEFAULT '0',
  `start_time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `openid_index` (`openid`),
  KEY `openid_start_end_index` (`openid`,`start_time`,`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;

insert into `admin`(`id`,`name`,`password`,`email`,`level`,`parent_id`,`create_time`,`account_access`,`is_delete`,`unionid`) values
('1','admin','$2y$10$2gKWROLj7D/69gdZAfqqJuV882.oCLUI3ZpRuDB9l5w.DtCZFc6I.','liminglong2008@gmail.com','1','0','0000-00-00 00:00:00','','0','');


insert into `tbl_migration`(`version`,`apply_time`) values
('m000000_000000_base','1432737568'),
('m150513_032001_follower_rating_rules','1432737579'),
('m150518_062431_wechat_customer','1432737579'),
('m150518_084443_update_follower_rating_queue','1432737579'),
('m150525_100947_update_post_limitation_queue','1432737594'),
('m150525_114951_update_post_limitation_queue','1432737594'),
('m150526_064445_post_link','1433946602'),
('m150528_054610_post_link','1433946602'),
('m150528_055023_post_link_click','1433946594'),
('m150528_055249_update_follower_rating_queue','1432798467'),
('m150528_075906_update_action_count_queue','1432806326'),
('m150601_050552_wechat_store','1438786297'),
('m150601_095447_wechat_store','1438786297'),
('m150602_025015_thirdparty_order','1433946617'),
('m150605_044451_cards','1438786291'),
('m150609_054258_post_link','1433946602'),
('m150609_083937_cards','1438786291'),
('m150609_102759_cards','1438786291'),
('m150610_035447_cards','1438786291'),
('m150610_060605_customer','1438786301'),
('m150612_015920_user_actions_index','1435157065'),
('m150612_105910_user_actions_detail_index','1435157065'),
('m150616_061402_wechat_customer','1435157054'),
('m150616_102321_cards','1438786291'),
('m150616_135417_cards','1438786291'),
('m150617_025723_post_analytics_item_index','1435157073'),
('m150617_062453_thirdparty_order_item','1442413402'),
('m150617_092321_default_messages','1435157045'),
('m150617_112629_default_messages','1435157045'),
('m150619_034136_cards','1438786291'),
('m150619_060153_post_analytics_item_revenue_order_index','1435157095'),
('m150619_085120_menu_query','1436365508'),
('m150619_105958_cards','1438786291'),
('m150623_041916_campaigns','1438786306'),
('m150625_052539_campaigns','1438786306'),
('m150625_112854_campaigns','1438786306'),
('m150626_113835_post_analytics_item_index','1441548757'),
('m150629_025104_campaigns','1438786306'),
('m150629_055024_res_content','1436365514'),
('m150629_055137_follower_analytics_item_index','1436365490'),
('m150629_083057_campaigns','1438786306'),
('m150629_100303_campaigns','1438786306'),
('m150630_031033_follower_analytics_last_action_index','1436365502'),
('m150630_071719_campaigns','1438786306'),
('m150630_104649_follower_analytics_action_counts_index','1436365496'),
('m150701_044011_campaign_participate_record','1438786310'),
('m150701_044135_card_issue_record','1438786315'),
('m150706_090433_card_issue_record','1438786315'),
('m150707_032654_rotate','1436365519'),
('m150707_033015_cards','1436365525'),
('m150708_074617_custom_data_record','1436365531'),
('m150708_074639_custom_data_errors','1436365531'),
('m150709_092459_ecommerce_analytics_item_index','1437578799'),
('m150713_061218_cards','1437578808'),
('m150714_042124_campaign_analytics','1438786267'),
('m150715_140531_campaign_analytics','1438786268'),
('m150715_145736_campaign_analytics_all_data_index','1438786272'),
('m150716_021149_campaign_analytics_all_data_index','1438786272'),
('m150716_023216_campaign_analytics_all_data_index','1438786272'),
('m150720_021301_campaign_analytics_item_data_index','1438786276'),
('m150720_053738_campaign_analytics_item_data_index','1438786276'),
('m150720_093213_wechat_store','1438786297'),
('m150721_030402_message','1438786287'),
('m150721_030657_cards','1438786358'),
('m150721_040138_message','1438786288'),
('m150721_040153_message_reply','1438786345'),
('m150722_065941_trigger_queue','1438786373'),
('m150723_113304_customer','1438786301'),
('m150723_113954_customer','1438786301'),
('m150724_041414_custom_themes','1438786262'),
('m150724_062746_user_action_record','1438786370'),
('m150724_091724_cards','1438786292'),
('m150728_041100_cards','1438786292'),
('m150729_071844_ecommerce_analytics_item_index','1439994753'),
('m150729_113849_message','1438786289'),
('m150730_074050_rotate','1438786325'),
('m150730_091717_survey','1438786330'),
('m150730_112004_form_event','1438786320'),
('m150803_102043_customer_filter_rules','1439994649'),
('m150803_102824_micro_group_buy','1439994656'),
('m150803_103248_micro_member_card','1439994660'),
('m150803_103609_micro_member_card_list','1439994664'),
('m150804_035322_micro_member_card_record','1439994669'),
('m150804_040939_micro_survey','1439994673'),
('m150804_041550_micro_survey_record','1439994677'),
('m150804_042834_micro_survey_tk','1439994681'),
('m150804_043333_micro_vote','1439994685'),
('m150804_045334_micro_vote_record','1439994689'),
('m150804_052614_my_answer','1439994693'),
('m150804_053002_scratch','1439994700'),
('m150804_073025_sys_auto_answer','1439994705'),
('m150804_074223_tel_book','1439994709'),
('m150804_074456_user','1439994712'),
('m150804_075540_user_type','1439994716'),
('m150804_075835_winner','1439994719'),
('m150804_081900_campaigns','1439994723'),
('m150805_030129_campaigns','1439994723'),
('m150805_072307_revenue','1439994749'),
('m150806_074152_campaign_participate_record','1439994727'),
('m150806_103753_group_message_record','1439994745'),
('m150810_082824_user_action_record','1439994740'),
('m150817_023223_triggers','1441548742'),
('m150818_021300_post_analytics_item_revenue_order_index','1441548750'),
('m150818_071903_post_analytics_item_follower_index','1441548753'),
('m150819_103840_campaign_analytics_item_data_index','1441548731'),
('m150819_110341_campaign_analytics_all_data_index','1441548737'),
('m150820_090411_key_word','1441548746'),
('m150825_020636_form_event','1441548769'),
('m150826_105240_post_analytics_item_index','1441548757'),
('m150827_013131_customer','1441548765'),
('m150828_081442_image_path','1441548761'),
('m150828_122048_form_event_member','1441548774'),
('m150831_094057_triggers','1442413354'),
('m150831_105553_triggers','1442413354'),
('m150906_030351_weekly_follower','1442413391'),
('m150908_042258_wechat_customer_location','1442413362'),
('m150908_064027_cards','1442413368'),
('m150908_100548_weekly_post','1442413396'),
('m150908_140905_triggers','1442413354'),
('m150909_024351_update_campaign_analytics_index_queue','1442413374'),
('m150909_032258_update_campaign_analytics_index_queue','1442413374'),
('m150909_070428_update_dynamic_rules','1443450529'),
('m150909_113934_wechat_lbs','1442413386'),
('m150911_015242_update_who_share_post','1442413380'),
('m150914_074110_cron_update_segmentation_tag_to_customer','1443450525'),
('m150915_021454_thirdparty_order_item','1442413402'),
('m150916_085115_segmentation_analytics_item_index','1443450501'),
('m150917_023801_daily_follower','1443450514'),
('m150917_023952_daily_post','1443450517'),
('m150917_073445_user_actions_openid_details_index','1443450505'),
('m150917_084352_menu_click_original_link_record','1443450533'),
('m150918_054613_customer','1443450509'),
('m150918_075521_customer','1443450509'),
('m150918_100212_conditional_trigger','1445467606'),
('m150922_021805_custom_data_report','1442997607'),
('m150922_085013_ecommerce_analytics_item_index','1443450521'),
('m150924_093947_customer','1443450509'),
('m150925_112833_qrcode','1443451317'),
('m150928_104255_group_customer_message_queue','1445467579'),
('m150928_132550_group_customer_message_queue','1445467579'),
('m150929_030403_follower_tag_count_index','1445467602'),
('m150930_052144_poll','1458145611'),
('m150930_065025_poll_answer','1458145616'),
('m150930_065112_poll_vote','1458145624'),
('m150930_070258_group_message_record','1445467584'),
('m151008_051450_who_click_share_post','1445467611'),
('m151008_052140_group_message_record','1445467584'),
('m151008_060148_poll_question','1458145620'),
('m151008_075751_default_messages','1445467588'),
('m151008_094501_materials','1444633692'),
('m151009_070355_custom_data_report','1445467730'),
('m151009_075544_custom_data_report_funnel','1445467711'),
('m151010_034449_first_attention','1445467593'),
('m151012_042805_html_five_pages','1445467598'),
('m151012_061014_triggers','1445467751'),
('m151013_035017_html_five_pages','1445467598'),
('m151013_062155_message_post_analytics_item_index','1445467747'),
('m151014_020106_message_48_list_record','1445467740'),
('m151014_063412_message_post_sent_by_custom_send','1445467735'),
('m151015_072620_follower_tag_count_index','1445467602'),
('m151020_032626_weekly_follower_nap','1446654941'),
('m151026_033826_res_content','1456156708'),
('m151028_051324_post_analytics_item_index','1446654868'),
('m151028_052648_message_post_analytics_item_index','1446654875'),
('m151028_053117_user_action_record','1446014853'),
('m151028_095037_who_share_post','1446654880'),
('m151028_155757_user_action_record','1446654905'),
('m151110_101355_post_analytics_item_index','1447863312'),
('m151110_101400_message_post_analytics_item_index','1447863318'),
('m151112_023036_group_message_record','1447863362'),
('m151112_072634_post_queue','1447863357'),
('m151113_061849_asyn_followers','1447863335'),
('m151113_072333_follower_action_time_all_index','1447863325'),
('m151113_093455_follower_action_time_openid_index','1447863330'),
('m151117_062653_directory_country','1451406039'),
('m151117_062747_directory_province','1451406052'),
('m151117_062759_directory_city','1460564448'),
('m151117_062833_directory_district','1451406044'),
('m151117_073455_directory_district_name','1451406048'),
('m151117_073509_directory_city_name','1460564304'),
('m151117_073527_directory_province_name','1451406056'),
('m151117_080132_directory_area','1451406001'),
('m151117_080146_directory_area_name','1451406006'),
('m151118_065014_user_share_api_data','1451405987'),
('m151124_044407_customer','1456155849'),
('m151124_074426_rbac','1456155856'),
('m151124_080650_rbac','1456155856'),
('m151124_091917_rbac','1456155856'),
('m151125_105931_customer','1456155850'),
('m151125_132150_rbac','1456155856'),
('m151126_032903_wechat_customer_location','1451407465'),
('m151127_053409_rbac','1456155857'),
('m151127_064245_post_send_queue','1449591467'),
('m151129_063745_post_send_queue','1449591468'),
('m151129_155045_post_send_queue','1449591468'),
('m151203_073652_dynamic_menu_segmentation_config','1458144424'),
('m151203_095051_extensions','1451405992'),
('m151214_065312_post_link','1460564270'),
('m151220_053546_rbac','1456155857'),
('m151222_093703_triggers','1451406061'),
('m151229_024331_wechat_customer_index','1453134099'),
('m151230_050001_follower_tag_count_index','1453134097'),
('m151230_065620_res','1458144429'),
('m160106_083257_triggers_multiple','1456155877'),
('m160107_094453_group_message_record','1453134038'),
('m160113_082209_post_link_click','1453134120'),
('m160202_113541_res','1456156734'),
('m160223_093729_customer','1461168430'),
('m160224_083031_update_trigger_keyword','1458144420'),
('m160225_035329_api_record','1458144416'),
('m160302_024200_res_content','1456890560'),
('m160303_103448_poll','1458145611'),
('m160304_034937_user_action_record','1459440585'),
('m160304_063235_segment_analytics','1461773710'),
('m160304_104143_follower_source_analytics','1459440182'),
('m160308_031141_follower_eav_attribute','1459440191'),
('m160309_083350_follower_eav_attribute_relation','1459440191'),
('m160310_015808_follower_eav_attribute','1459440191'),
('m160310_185953_follower_eav_attribute','1477066410'),
('m160311_185953_follower_eav_attribute','1477066410'),
('m160314_035028_follower_eav_attribute_value','1459440191'),
('m160315_020412_segment_analytics_rules','1461773735'),
('m160315_031424_user_actions_index','1460564372'),
('m160315_070317_wechat_customer_index','1459440188'),
('m160315_072709_post_analytics_item_index','1460564461'),
('m160315_100928_group_message_record','1460564351'),
('m160315_104725_post_analytics_item_revenue_order_index','1460564250'),
('m160316_102503_event_callback','1458541459'),
('m160317_023143_message','1460564338'),
('m160318_023601_follower_kol_index','1459440195'),
('m160320_143402_wechat_customer_location','1459440201'),
('m160320_144201_wechat_customer_location','1459440213'),
('m160321_022232_follower_kol_index','1459440195'),
('m160322_090734_wechat_customer_location','1459440217'),
('m160323_031438_wechat_customer','1459440742'),
('m160324_070521_voice_path','1461168402'),
('m160324_103751_personal_menu','1466611618'),
('m160328_085456_follower_eav_index','1459440191'),
('m160329_082400_default_messages','1460564450'),
('m160329_090201_key_word','1460564283'),
('m160330_022523_first_attention','1460564354'),
('m160330_025111_livecom_config','1459440220'),
('m160405_110734_engagement','1460564198'),
('m160405_112046_engagement','1460564198'),
('m160405_112827_engagement','1460564198'),
('m160406_084038_article_total','1460564406'),
('m160407_110412_wechat_customer','1460564366'),
('m160411_102752_directory_province_name','1461773739'),
('m160414_072745_user_action_record','1461774338'),
('m160414_080148_follower_action_time_all_index','1461773744'),
('m160417_064851_customer','1461773765'),
('m160426_114652_wechat_customer','1462983648'),
('m160427_061329_latest_location','1462983636'),
('m160429_030727_segment_analytics_rules','1462983651'),
('m160506_090237_api_tag','1466611752'),
('m160512_034503_api_tag','1466611752'),
('m160517_022211_personal_menu','1466611618'),
('m160520_032753_message_48_list_record','1466611602'),
('m160520_035041_group_customer_message_queues','1466611765'),
('m160524_065348_wechat_customer_tag','1464191854'),
('m160524_094032_article_total','1466611751'),
('m160527_072405_default_messages','1465289350'),
('m160527_102112_menu_publish_queue','1466611766'),
('m160530_110047_api_tag','1466611752'),
('m160530_110418_personal_menu','1466611618'),
('m160614_054114_message','1466611719'),
('m160614_084617_message_reply','1466611615'),
('m160622_131850_wechat_customer','1468599400'),
('m160713_044007_grata_service','1474474124'),
('m160714_051306_grata_service','1474474124'),
('m160720_082517_message','1469031138'),
('m160722_053324_qrcode','1472141384'),
('m160725_063613_access_token','1469760891'),
('m160725_064229_access_token','1469760891'),
('m160727_032947_grata_service_follower','1474474162'),
('m160727_040722_grata_service_follower','1474474162'),
('m160728_103351_post_analytics_item_index','1472141396'),
('m160810_073848_message','1472141373'),
('m160824_050728_post_analytics_item_index','1472141400'),
('m160824_071300_post_analytics_item_index','1472141407'),
('m160824_075102_directory_region_name','1476116169'),
('m160824_094928_api_user','1472198848'),
('m160829_035306_thirdparty_product_config_setting','1479827478'),
('m160831_094651_thirdparty_product_config_setting','1479827478'),
('m160906_075114_res','1479827516'),
('m160919_033754_thirdparty_product_config_setting','1479827478'),
('m160919_092233_follower_eav_category','1477066404'),
('m160920_015544_eips','1479827485'),
('m160920_020315_eips','1479827485'),
('m160920_020625_eips','1479827485'),
('m160920_075633_eips','1479827485'),
('m160920_103900_post_link','1477066390'),
('m160921_025843_eips','1479827485'),
('m160922_082612_online_offline_campaign','1479827544'),
('m160922_082813_health_check_standard','1479827573'),
('m160922_082820_health_check_standard_score','1479827480'),
('m160922_082829_health_check_score','1479827539'),
('m160926_055935_eips','1479827485'),
('m160927_040033_ecommerce_import_queue','1479827455'),
('m160929_014154_directory_country_name','1476116088'),
('m160930_035045_ecommerce_data','1479827467'),
('m160930_060445_thirdparty_product_config_setting','1479827478'),
('m161009_083405_travel_to_location','1476116177'),
('m161010_023300_ecommerce_config','1479827500'),
('m161011_084640_health_check_standard','1479827573'),
('m161017_040024_article_total','1479827535'),
('m161019_094417_eips','1479827485'),
('m161025_070528_platform_service_record','1482338348'),
('m161025_090635_res','1479827483'),
('m161025_090702_post_sync_record','1479827483'),
('m161026_091705_ecommerce_fields','1479827545'),
('m161031_033811_image_path','1479827565'),
('m161108_031927_wechat_customer','1479289150'),
('m161114_100453_wechat_customer','1479978581'),
('m161121_061644_poll_vote','1479827530'),
('m161121_071350_availability_check','1479827527'),
('m161122_064740_journey','1484756983'),
('m161123_042431_who_click_share_post','1480394951'),
('m161126_131413_elastic_search_index','1481041096'),
('m161126_144337_customer','1481041108'),
('m161129_032057_journey','1484756983'),
('m161201_061925_journey','1484756983'),
('m161202_112051_ecommerce_data','1480692663'),
('m161205_073032_wechat_template_message','1484756943'),
('m161205_094811_multip_channel_email','1484756918'),
('m161206_035007_multip_channel_email','1484756918'),
('m161206_042513_multip_channel_email','1484756918'),
('m161206_070117_wechat_template_message','1484756943'),
('m161206_071948_wechat_template_message','1484756943'),
('m161207_080821_wechat_template_message','1484756943'),
('m161207_093407_wechat_template_message','1484756943'),
('m161207_102549_wechat_template_message','1484756943'),
('m161208_022511_wechat_template_message','1484756943'),
('m161210_082546_multip_channel_email','1484756918'),
('m161210_084135_multip_channel_email','1484756918'),
('m161212_030340_multip_channel_sms','1484756960'),
('m161212_032111_wechat_template_message','1484756943'),
('m161212_092854_multip_channel_sms','1484756960'),
('m161212_110455_multip_channel_sms','1484756960'),
('m161213_060636_journey','1484756983'),
('m161213_062903_wechat_template_message','1484756943'),
('m161213_103711_multip_channel_email','1484756918'),
('m161215_074915_segments_post_queue','1483546969'),
('m161216_051015_post_queue','1483547018'),
('m161216_092053_segments_post_queue','1483546969'),
('m161219_033606_journey','1484756983'),
('m161219_045801_multip_channel_email','1484756918'),
('m161219_072018_o2o','1487781120'),
('m161220_072323_o2o','1487781120'),
('m161221_073402_o2o','1487781120'),
('m161221_093737_o2o','1487781120'),
('m161221_130812_journey','1484756983'),
('m161222_050219_thirdparty_product_config_setting','1484756919'),
('m161223_025625_o2o','1487781121'),
('m161223_061341_wechat_template_message','1484756943'),
('m161226_031736_o2o','1487781121'),
('m161226_081508_o2o','1487781121'),
('m161227_065614_o2o','1487781121'),
('m161228_022209_wechat_template_message','1484756943'),
('m161228_052112_multip_channel_email','1484756918'),
('m161228_054542_multip_channel_sms','1484756960'),
('m161228_074714_connection_engine_config','1491927348'),
('m161229_032154_wechat_template_message','1484756944'),
('m161229_074226_save_tag_new_customer','1483547030'),
('m161230_023608_enter_group','1484756891'),
('m170103_074408_tag_count','1489594409'),
('m170104_070155_o2o','1487781121'),
('m170105_075556_journey_flow','1484756983'),
('m170106_063125_o2o','1487781121'),
('m170109_023244_connection_engine_queue','1491927382'),
('m170109_043428_thirdparty_product_config_setting','1484756919'),
('m170109_060948_tag_category','1484757006'),
('m170109_062639_tag_category','1484757006'),
('m170109_083847_wechat_template_message','1484756944'),
('m170110_090651_connection_engine_schedule_queue','1491927413'),
('m170111_080246_journey','1491927415'),
('m170111_122637_journey','1491927415'),
('m170113_021634_journey_queue','1491927415'),
('m170116_020611_enter_group_queue','1489594472'),
('m170116_061702_o2o','1487781121'),
('m170116_062730_o2o','1487781121'),
('m170117_031744_o2o','1487781121'),
('m170117_101701_wechat_template_message','1484756944'),
('m170117_103246_wechat_template_message','1484756944'),
('m170122_025502_multip_channel_email','1487781118'),
('m170122_070131_journey_category','1487781288'),
('m170122_074010_journey_category','1487781288'),
('m170123_042823_o2o','1487781121'),
('m170123_074840_multip_channel_email','1487781118'),
('m170124_033819_multip_channel_sms','1487781264'),
('m170208_084148_multip_channel_email','1487781118'),
('m170208_085950_multip_channel_sms','1487781264'),
('m170209_062410_wechat_customer_tag','1489594451'),
('m170209_063627_wechat_customer_location','1487781262'),
('m170213_062801_o2o','1487781121'),
('m170215_021914_journey','1491927415'),
('m170216_064448_post_queue','1487781282'),
('m170216_065828_segments_post_queue','1487781115'),
('m170216_083927_post_send_queue','1487781104'),
('m170217_022746_monitor_queue','1489594467'),
('m170222_062546_trigger_keyword','1489594304'),
('m170222_071338_journey','1489594504'),
('m170223_010102_enter_group','1489594296'),
('m170224_085218_init_data_validated_record','1489594306'),
('m170308_074817_tags','1489594477'),
('m170308_075151_tag_category','1489594520'),
('m170309_054428_youku_code','1489594513'),
('m170309_095830_qrcode_forward','1490199165'),
('m170313_060729_o2o','1493821932'),
('m170315_101758_youku_code','1489743771'),
('m170315_183001_wechat_customer_location_address_index','1491927388'),
('m170321_091325_wechat_customer_location_address_index','1491927388'),
('m170321_093135_askjery','1491927360'),
('m170324_063146_o2o','1491927364'),
('m170327_074644_journey','1491927415'),
('m170327_081622_connection_engine_config_setting','1491927367'),
('m170327_081956_connection_engine_journey_setting','1491927396'),
('m170327_082924_connection_engine_journey_setting','1491927396'),
('m170327_083309_connection_engine_config_setting','1491927367'),
('m170405_032216_system_log','1493821965'),
('m170405_102152_o2o','1495119134'),
('m170406_082042_o2o','1493821932'),
('m170406_084611_o2o','1493821932'),
('m170407_030830_o2o','1495119134'),
('m170410_041246_system_log','1493821965'),
('m170411_030814_thirdparty_product_config_setting','1493821931'),
('m170417_040656_menu_hashkey','1493821950'),
('m170417_062103_template_queue','1493018739'),
('m170417_071207_o2o','1495119134'),
('m170417_071419_trigger_id','1495119464'),
('m170417_100643_monitor_queue','1495119305'),
('m170419_040120_menu_hashkey','1493821950'),
('m170420_102548_o2o','1495119134'),
('m170421_090709_template_queue','1493018739'),
('m170421_092854_template_queue','1493018739'),
('m170421_100619_template_queue','1493018739'),
('m170425_022725_ecommerce_data','1495118671'),
('m170425_023544_ecommerce_config','1495119615'),
('m170425_023631_ecommerce_fields','1495127336'),
('m170425_023726_first_attention','1495119644'),
('m170425_031729_follower_rating_rules','1495119298'),
('m170425_031835_message','1495119597'),
('m170425_031845_message_reply','1495119233'),
('m170425_063244_askjery_user_chat','1493821916'),
('m170425_074113_triggers','1495118635'),
('m170425_074200_trigger_queue','1495118641'),
('m170425_074223_wechat_customer','1495126979'),
('m170425_074240_wechat_customer_tag','1495118860'),
('m170425_074316_api_record','1495119288'),
('m170425_074354_follower_eav_attribute_text','1495127279'),
('m170425_084306_segment_trigger_queue','1495118646'),
('m170425_101825_multip_channel_index','1495119641'),
('m170426_021319_enter_group','1495118619'),
('m170426_083041_o2o','1493821932'),
('m170427_061619_init_seg_export_status','1493821966'),
('m170427_063134_journey','1495127344'),
('m170427_085909_key_word','1495119126'),
('m170427_091855_swartz_csv_data','1493969657'),
('m170504_030700_o2o_task','1495127347'),
('m170509_055656_o2o_sales_team','1495119120'),
('m170510_072137_enter_group','1495118619'),
('m170512_063823_triggers','1495118646'),
('m170512_063838_wechat_customer','1495127121'),
('m170512_063846_wechat_customer_tag','1495118896'),
('m170512_063853_api_record','1495119293'),
('m170512_063900_follower_eav_attribute','1495127304'),
('m170512_063909_ecommerce_data','1495118674'),
('m170512_063916_ecommerce_config','1495119615'),
('m170512_063923_ecommerce_fields','1495127336'),
('m170512_063930_first_attention','1495119644'),
('m170512_063937_follower_rating_rules','1495119298'),
('m170512_063943_message','1495119613'),
('m170512_064004_message_reply','1495119247');

insert into `authassignment`(`itemname`,`userid`,`bizrule`,`data`) values
('ManagerResImportPost','1',null,'N;'),
('SuperAdmin','1',null,null);


insert into `authitem`(`name`,`type`,`description`,`bizrule`,`data`) values
('48 Posts List Task','1',null,null,null),
('Access Token Api Task','1',null,null,null),
('Account Admin','2','master',null,null),
('Account User','2','master',null,null),
('Admin Setup','1',null,null,null),
('AdminCustomerCreate','0','Create A Wechat Customer',null,null),
('AdminCustomerUpdate','0','Update A Wechat Customer',null,null),
('AdminPermissionsRoleCreate','0','Create A Role',null,null),
('AdminPermissionsRoleDelete','0','Delete A Role',null,null),
('AdminPermissionsRoles','0','Role Manager',null,null),
('AdminPermissionsRoleUpdate','0','Update A Role',null,null),
('AdminPermissionsUserCreate','0','Create A User',null,null),
('AdminPermissionsUserDelete','0','Delete A User',null,null),
('AdminPermissionsUsers','0','User Manager',null,null),
('AdminPermissionsUserUpdate','0','Update A User',null,null),
('All Menus','1',null,null,null),
('All Menus Task','1','',null,'N;'),
('Analytics','1',null,null,null),
('Api Tag Task','1',null,null,null),
('Api User Task','1',null,null,null),
('Applied Template Task','1',null,null,null),
('Ask Jerry Dashboard','1','Ask Jerry Dashboard',null,'N;'),
('Auto Responders','1',null,null,null),
('Behavior Analytics','1',null,null,null),
('Campaign Analytics Task','1',null,null,null),
('Category And Tags Task','1',null,null,null),
('Channel Select Settings Task','1',null,null,null),
('Child Modules','1',null,null,null),
('Connection Engine Task','1',null,null,null),
('Content','1',null,null,null),
('Conversation Task','1',null,null,null),
('ConversationValidateMobileNumber','0','Conversation Validate Mobile Number',null,'N;'),
('Coupon Cards Task','1',null,null,null),
('Custom Dashboard Task','1',null,null,null),
('Custom Data','1',null,null,null),
('Custom Data Call Back Task','1',null,null,null),
('Custom Data Report Task','1',null,null,null),
('Custom Data Task','1',null,null,null),
('Custom Field Task','1',null,null,null),
('Customer Service','2','master',null,null),
('Customize Task','1',null,null,null),
('Dashboard Task','1',null,null,null),
('Data Analyst','2','master',null,null),
('Default Message Task','1',null,null,null),
('Dynamic Api Task','1',null,null,null),
('Ecommerce Analytics Task','1',null,null,null),
('Ecommerce Setting Task','1','',null,'N;'),
('Editor','2','master',null,null),
('Eidt Profile Task','1',null,null,null),
('EIP Followers Task','1',null,null,null),
('EIP Management','1',null,null,null),
('EIP Management Task','1',null,null,null),
('EIP Settings Task','1',null,null,null),
('Email','1',null,null,null),
('Email Module Task','1',null,null,null),
('Email Record Task','1',null,null,null),
('Email Send a Preview Task','1','',null,'N;'),
('Email Setting Task','1',null,null,null),
('Email Template Task','1',null,null,null),
('Engagement','1',null,null,null),
('Event Callback Api Task','1','',null,'N;'),
('Events','1',null,null,null),
('Follower Actions Log Task','1',null,null,null),
('Follower Analytics','1',null,null,null),
('Follower Attribution Task','1',null,null,null),
('Follower Custom Field Task','1',null,null,null),
('Follower Growth Analytics Task','1',null,null,null),
('Follower KOL Task','1',null,null,null),
('Follower Management','1',null,null,null),
('Follower Networks Task','1',null,null,null),
('Follower Overview Task','1',null,null,null),
('Follower Rating Rules Task','1',null,null,null),
('FollowerEavCategory Task','1',null,null,null),
('Followers Task','1',null,null,null),
('Form Event Analytics Task','1',null,null,null),
('Form Events Task','1',null,null,null),
('Grata Service Api Task','1',null,null,null),
('Health Check Email Task','1',null,null,null),
('Health Check Report Task','1',null,null,null),
('Health Check Score Standard Task','1',null,null,null),
('Health Check Task','1',null,null,null),
('HTML5 Pages Task','1',null,null,null),
('Journey Task','1',null,null,null),
('JS Tracking Tester','2','master',null,null),
('Keyword Auto-Reply Task','1',null,null,null),
('Lead Board Task','1',null,null,null),
('Manage Posts Task','1',null,null,null),
('ManagerAccessTokenCreate','0','',null,'N;'),
('ManagerApiAdmin','0','',null,'N;'),
('ManagerApiTagAdmin','0','',null,'N;'),
('ManagerAskjeryDashboardIndex','0',' Ask Jerry Dashboard',null,'N;'),
('ManagerCampaignAnalyticsAdmin','0','Campaign Analytics',null,null),
('ManagerCampaignAnalyticsCreate','0','Create A Campaign',null,null),
('ManagerCampaignAnalyticsDelete','0','Delete A Campaign',null,null),
('ManagerCampaignAnalyticsUpdate','0','Update A Campaign',null,null),
('ManagerCampaignsAdmin','0','Manage Promotion',null,null),
('ManagerCampaignsCreate','0','Create a Promotion',null,null),
('ManagerCampaignsNotifiction','0','Notifiction a Promotion',null,null),
('ManagerCampaignsUpdate','0','Update a Promotion',null,null),
('ManagerCardsAdmin','0','Manage Cards',null,null),
('ManagerCardsCreate','0','Create a Coupon',null,null),
('ManagerCardsRedeem','0','Redeem a Coupon',null,null),
('ManagerCardsUpdate','0','Update a Coupon',null,null),
('ManagerChannelSelectSettingsIndex','0','Channel Select Settings',null,null),
('ManagerConversationAdmin','0','',null,'N;'),
('ManagerConversationCopy','0','Copy Conversation',null,null),
('ManagerConversationCreate','0','Create Conversation',null,null),
('ManagerConversationTree','0','View Conversation',null,null),
('ManagerConversationUpdate','0','Update Conversation',null,null),
('ManagerCouponAnalyticsIndex','0','Preview A Coupon Analytics',null,null),
('ManagerCouponPromotionAnalyticsIndex','0','Christmas Promotion',null,null),
('ManagerCustomDataReportAdmin','0','Custom Data Report',null,null),
('ManagerCustomDataReportCreate','0','Create A Custom Data Report',null,null),
('ManagerCustomDataReportDelete','0','Delete A Custom Data Report',null,null),
('ManagerCustomDataReportUpdate','0','Update A Custom Data Report',null,null),
('ManagerCustomerUpdate','0','Eidt Profile',null,null),
('ManagerCustomThemesModify','0','Customize',null,null),
('ManagerDataStatisticsFollowerAttribution','0','Follower Attribution',null,null),
('ManagerDataStatisticsMessagePostAnalytics','0','Messaged Posts',null,null),
('ManagerDataStatisticsPostAnalytics','0','Published Posts',null,null),
('ManagerDataStatisticsShareReport','0','Share Report',null,null),
('ManagerDefaultCustom','0','Custom Dashboard',null,null),
('ManagerDefaultIndex','0','Dashboard',null,null),
('ManagerDefaultMessagesModify','0','Manage Default Message',null,null),
('ManagerDefaultNapWeek','0','Weekly Report',null,null),
('ManagerDynamicRulesAdmin','0','Segmentation',null,null),
('ManagerDynamicRulesCreate','0','Create A Segmentation',null,null),
('ManagerDynamicRulesUpdate','0','Update A Segmentation',null,null),
('ManagerEcommerceIndex','0','Ecommerce Analytics',null,null),
('ManagerEcommerceSetting','0','ecommerce setting',null,'N;'),
('ManagerEipFollowers','0','EIP Followers',null,null),
('ManagerEipList','0','EIP List Update',null,null),
('ManagerEipUsers','0','EIP Admin User',null,null),
('ManagerEventAdmin','0','Message Event List',null,null),
('ManagerEventCallbackCreate','0','',null,'N;'),
('ManagerEventCreate','0','Create an Event',null,null),
('ManagerEventUpdate','0','Update an Event',null,null),
('ManagerExtensionsCreate','0','Create Extensions',null,null),
('ManagerFirstAttentionAdmin','0','Welcome Message',null,null),
('ManagerFirstAttentionCreate','0','Create A Welcome Message',null,null),
('ManagerFirstAttentionUpdate','0','Update A Welcome Message',null,null),
('ManagerFollowerAnalyseAll','0','Follower Overview',null,null),
('ManagerFollowerAnalyseIndex','0','Follower Growth Analytics',null,null),
('ManagerFollowerAnalyseKol','0','Follower KOL',null,null),
('ManagerFollowerAnalyseNetwork','0','Follower Networks',null,null),
('ManagerFollowerEavCategoryList','0','',null,'N;'),
('ManagerFollowerEavCreate','0','Create Follower Eav Attribute',null,null),
('ManagerFollowerEavIndex','0','Follower Custom Field',null,null),
('ManagerFollowerEavUpdate','0','Update Follower Eav Attribute',null,null),
('ManagerFollowerRatingRulesAdmin','0','Follower Rating Rules',null,null),
('ManagerFollowerRatingRulesImport','0','Import Default Rules',null,null),
('ManagerFollowerRatingRulesUpdate','0','Edit Follower Rating Rules',null,null),
('ManagerFormEventAdmin','0','Manage Form Events',null,null),
('ManagerFormEventAnalyticsAdmin','0','Form Event Analytics',null,null),
('ManagerFormEventCreate','0','Create A Form Event',null,null),
('ManagerFormEventUpdate','0','Update A Form Event',null,null),
('ManagerGrataCreate','0','',null,'N;'),
('ManagerGroupMessageRecordAdmin','0','Sent Posts List',null,null),
('ManagerGroupMessageRecordAdminschedule','0','Scheduled Posts List',null,null),
('ManagerGroupMessageRecordDeleteRecord','0','Delete A Post Record',null,null),
('ManagerGroupMessageRecordFortyhours','0','48 Posts List',null,null),
('ManagerGroupsMessage','0','Schedule a Post',null,null),
('ManagerGroupsPreview','0','Send a Preview',null,null),
('ManagerHealthCheckEmailIndex','0','Health Check Email',null,null),
('ManagerHealthCheckScoreIndex','0','Health Check Report',null,null),
('ManagerHealthCheckStandardIndex','0','Health Check Score Standard',null,null),
('ManagerHtmlFivePagesAdmin','0','HTML5 Pages',null,null),
('ManagerHtmlFivePagesCreate','0','Create a Page',null,null),
('ManagerHtmlFivePagesDelete','0','Delete a Page',null,null),
('ManagerHtmlFivePagesUpdate','0','Update a Page',null,null),
('ManagerInteractiveRecordAdmin','0','The 48 Hour List',null,null),
('ManagerJourneyAdmin','0','Journey',null,null),
('ManagerKeyWordAdmin','0','Keyword Auto-Responders',null,null),
('ManagerKeyWordCreate','0','Create Keyword Reply',null,null),
('ManagerKeyWordUpdate','0','Update Keyword Reply',null,null),
('ManagerMenuAdmin','0','Custom Menu',null,null),
('ManagerMenuClear','0','Delete All Menu Setting',null,null),
('ManagerMenuMenuAnalytics','0','Menu Analytics',null,null),
('ManagerMenuUpdateMenu','0','Update Menu',null,null),
('ManagerMessageList','0','Message Inbox',null,null),
('ManagerMessageReceivedMessageStatistic','0','View Message Analytics',null,null),
('ManagerMessageReply','0','Reply A Message',null,null),
('ManagerMessageSetAllAsRead','0','Set All Messages As Read',null,null),
('ManagerMultipChannelEmailPreview','0','Send a Preview',null,null),
('ManagerMultipChannelEmailRecord','0','Email Record',null,null),
('ManagerMultipChannelEmailSetting','0','Email Setting',null,'N;'),
('ManagerMultipChannelEmailTemplates','0','Mailing Templates',null,null),
('ManagerMultipChannelSMSPreview','0','Send a Preview',null,null),
('ManagerMultipChannelSMSRecord','0','SMS Record',null,null),
('ManagerMultipChannelSMSSetting','0','SMS Setting',null,'N;'),
('ManagerMultipChannelSMSTemplates','0','SMS Template',null,null),
('ManagerMultipChannelTemplateAdmin','0','Wechat Template',null,null),
('ManagerMultipChannelTemplateApplied','0','Applied Template',null,null),
('ManagerMultipChannelTemplateList','0','',null,'N;'),
('ManagerMultipChannelTemplatePreview','0','Preview Template',null,null),
('ManagerMultipChannelTemplateRecord','0','Record Template',null,null),
('ManagerMultipChannelTemplateSchedule','0','',null,'N;'),
('ManagerMultiSegmentMessage','0','',null,'N;'),
('ManagerOnlineOfflineCampaignIndex','0','Online Offline Campaign',null,null),
('ManagerPersonalMenuAdmin','0','',null,'N;'),
('ManagerPersonalMenuList','0','',null,'N;'),
('ManagerPollAdmin','0','Manage Polls',null,null),
('ManagerPollAnalytics','0','Poll Analytics',null,null),
('ManagerPollCreate','0','Create a Poll',null,null),
('ManagerPollUpdate','0','Update a Poll',null,null),
('ManagerProductManagementAdmin','0','Product List',null,null),
('ManagerProductManagementImportRecords','0','Update History',null,null),
('ManagerProductManagementSetting','0','Product List Settings',null,null),
('ManagerProductManagementTemplateSetting','0','Product Template Settings',null,null),
('ManagerProfileSetting','0','Profile',null,null),
('ManagerQrcodeAdmin','0','QR Codes',null,null),
('ManagerQrcodeCreate','0','Create a QR Code',null,null),
('ManagerQrcodeUpdate','0','Update a QR Code',null,null),
('ManagerQueryCreate','0','Menu Query',null,null),
('ManagerResAdmin','0','Manage Posts',null,null),
('ManagerResCopy','0','Copy A Post',null,null),
('ManagerResCreateMore','0','Create A Post',null,null),
('ManagerResCreateMorePost','0','',null,'N;'),
('ManagerResDelete','0','Delete A Post',null,null),
('ManagerResDistributeSubPost','0','',null,'N;'),
('ManagerResImportPost','0','Import Recent Posts',null,null),
('ManagerResPostLine','0','',null,'N;'),
('ManagerResSyncRecord','0','',null,'N;'),
('ManagerResUpdate','0','Update A Single Post',null,null),
('ManagerResUpdateMore','0','Update A Multi Post',null,null),
('ManagerResUpdateMorePost','0','',null,'N;'),
('ManagerResUpdateReply','0','Update A Single Reply Post',null,null),
('ManagerResUpdateReplyMore','0','Update A Multi Reply Post',null,null),
('ManagerResUpdateReplyMorePost','0','',null,'N;'),
('ManagerRotateAdmin','0','Manage Wheel of Fortune',null,null),
('ManagerRotateCreate','0','Create a Wheel',null,null),
('ManagerRotateprizeAdmin','0','Winners Manage',null,null),
('ManagerRotateUpdate','0','Update a Wheel',null,null),
('ManagerSegAnalyticsAdmin','0','',null,'N;'),
('ManagerSegAnalyticsAnalytics','0','',null,'N;'),
('ManagerSegAnalyticsCreate','0','',null,'N;'),
('ManagerShowBenchMark','0','',null,'N;'),
('ManagerSmsMessage','0','Send SMS',null,null),
('ManagerSmsMessageSmsCreate','0','SMS Setting',null,null),
('ManagerSmsRecordAdmin','0','SMS Log',null,null),
('ManagerSurveyAdmin','0','Surveys',null,null),
('ManagerSurveyCreate','0','Create a Survey',null,null),
('ManagerSurveyUpdate','0','Update a Survey',null,null),
('ManagerTagDelete','0','tag delete',null,'N;'),
('ManagerTagsAdmin','0','Tags',null,null),
('ManagerTagsCreate','0','Create A Tag',null,null),
('ManagerTagsCreateCategory','0','Create a Tag Category
',null,null),
('ManagerTagsTagCategoryList','0','Tag Category List',null,null),
('ManagerTagsUpdate','0','Update A Tag',null,null),
('ManagerTagsUpdateCategory','0','Update Tag Category',null,null),
('ManagerTrackingSearch','0','Custom Data Call Back',null,null),
('ManagerTriggersAdmin','0','Manage Triggers',null,null),
('ManagerTriggersCreate','0','Create a Trigger',null,null),
('ManagerTriggersDelete','0','Delete a Trigger',null,null),
('ManagerTriggersLbsCreate','0','Create a LBS Trigger',null,null),
('ManagerTriggersLbsUpdate','0','Update a LBS Trigger',null,null),
('ManagerTriggersUpdate','0','Update a Trigger',null,null),
('ManagerUnionAnalyticsGetVennChartData','0','Preview Union Venn',null,null),
('ManagerUnionAnalyticsIndex','0','Union Tracking',null,null),
('ManagerUserActionRecordAdmin','0','Follower Actions Log',null,null),
('ManagerWechatCustomerAdmin','0','Follower List',null,null),
('ManagerWechatCustomerGetAllUser','0','Synchronize Followers',null,null),
('ManagerWechatCustomerGetUnfollower','0','UnFollower List',null,null),
('ManagerWechatCustomerUpdateActionCount','0','Update Action Count',null,null),
('ManagerWechatCustomerView','0','Preview A Follower',null,null),
('ManagerWechatshopAdmin','0','Manage Wechat Stores',null,null),
('ManagerWechatshopCreate','0','Create a Store',null,null),
('ManagerWechatshopDelete','0','Delete a Store',null,null),
('ManagerWechatshopUpdate','0','Update a Store',null,null),
('ManagerWheelOfFortuneAnalyticsAdmin','0','Wheel of Fortune Analytics',null,null),
('ManagerWindowSettingsConfig','0','Connection Engine Settings',null,'N;'),
('ManagerWindowSettingsIndex','0','Window Settings',null,null),
('MasterResDistributeSubPost','0','',null,'N;'),
('Menu','1',null,null,null),
('Menu Analytics Task','1',null,null,null),
('Menu Query Task','1',null,null,null),
('Menu Task','1',null,null,null),
('Menus Task','1',null,null,null),
('Message Events Task','1',null,null,null),
('Message Inbox Task','1',null,null,null),
('Messaged Posts Task','1',null,null,null),
('Messaging','1',null,null,null),
('Modules','1',null,null,null),
('Multip Channel Task','1',null,null,null),
('NAPEIP Task','1',null,null,null),
('New Editor Post Task','1','',null,'N;'),
('O2O Management Task','1',null,null,null),
('O2O Set Up Task','1',null,null,null),
('O2oManagement','0','',null,'N;'),
('O2oPointsAdmin','0','Sales Points',null,'N;'),
('O2oSalesLevelAdmin','0','Sales Level',null,'N;'),
('O2oSalesTeamAdmin','0','',null,'N;'),
('O2oSalesTeamLeadBoard','0','',null,'N;'),
('O2oSettingCreate','0','',null,'N;'),
('O2oStoresAdmin','0','',null,'N;'),
('Online Offline Campaign Task','1',null,null,null),
('Personal Shopper','2','master2',null,null),
('Poll Task','1',null,null,null),
('Post Analytics','1',null,null,null),
('Post Lists','1',null,null,null),
('Post Send And Push Log','1',null,null,null),
('Post Sync List Task','1','',null,'N;'),
('Posts Task','1',null,null,null),
('Product List Settings Task','1',null,null,null),
('Product List Task','1',null,null,null),
('Product Management Task','1',null,null,null),
('Product Template Settings Task','1',null,null,null),
('Profile Task','1',null,null,null),
('Promotion Analytics','1',null,null,null),
('Promotion Task','1',null,null,null),
('PS Admin','2','master2',null,null),
('Publish List Task','1',null,null,null),
('Published Posts Task','1',null,null,null),
('QR Codes Task','1',null,null,null),
('RBAC','1',null,null,null),
('Republish Post Task','1','',null,'N;'),
('RepublishPostTask','0','',null,'N;'),
('Role Manager Task','1',null,null,null),
('Sales Level Task','1','',null,'N;'),
('Sales Points Task','1','',null,'N;'),
('Sales Team Task','1','',null,'N;'),
('SalesAdmin','2','master',null,'N;'),
('Schedule a Post Task','1',null,null,null),
('Scheduled Posts List Task','1',null,null,null),
('Segmentation Task','1',null,null,null),
('SegmentationExportInfo','0','',null,'N;'),
('Segmentator Task','1','',null,'N;'),
('Segmentor Task','1',null,null,null),
('Select Active Journey','1','',null,'N;'),
('Send SMS Task','1',null,null,null),
('Sent Posts List Task','1',null,null,null),
('Setup','1',null,null,null),
('Share Report Task','1',null,null,null),
('Shop Location Task','1',null,null,null),
('Smart Posts','1',null,null,null),
('SMS','1',null,null,null),
('SMS Log Task','1',null,null,null),
('SMS Module Task','1',null,null,null),
('SMS Record Task','1',null,null,null),
('SMS Send a Preview Task','1','',null,'N;'),
('SMS Setting Task','1',null,null,null),
('SMS Template Task','1',null,null,null),
('SubscribeAdmin','2','master',null,'N;'),
('SuperAdmin','2',null,null,null),
('Surveys Task','1',null,null,null),
('Tag Category Task','1',null,null,null),
('Tags Task','1',null,null,null),
('Team Management Task','1',null,null,null),
('Template Message','1',null,null,null),
('Template Message Send a Preview Task','1','',null,'N;'),
('Template Record Task','1',null,null,null),
('TemplateSegmentation','0','',null,'N;'),
('The 48 Hour List Task','1',null,null,null),
('Trigger Actions Task','1',null,null,null),
('Union Analytics Task','1',null,null,null),
('Update History Task','1',null,null,null),
('User Manager','1',null,null,null),
('WebPower Email Module','1',null,null,null),
('WebPower SMS Module','1',null,null,null),
('Wechat Customers','1',null,null,null),
('Wechat Tempalte Task','1',null,null,null),
('Wechat Template Task','1',null,null,null),
('Weekly Report Task','1',null,null,null),
('Welcome Message Task','1',null,null,null),
('Wheel of Fortune Analytics Task','1',null,null,null),
('Wheel of Fortune Task','1',null,null,null),
('Window Settings Task','1',null,null,null);


insert into `authitemchild`(`parent`,`child`) values
('Account Admin','48 Posts List Task'),
('Account User','48 Posts List Task'),
('Post Lists','48 Posts List Task'),
('Post Send And Push Log','48 Posts List Task'),
('PS Admin','48 Posts List Task'),
('SubscribeAdmin','48 Posts List Task'),
('Admin Setup','Access Token Api Task'),
('PS Admin','Access Token Api Task'),
('SuperAdmin','Admin Setup'),
('Wechat Customers','AdminCustomerCreate'),
('Wechat Customers','AdminCustomerUpdate'),
('Role Manager Task','AdminPermissionsRoleCreate'),
('Role Manager Task','AdminPermissionsRoleDelete'),
('Role Manager Task','AdminPermissionsRoles'),
('Role Manager Task','AdminPermissionsRoleUpdate'),
('User Manager','AdminPermissionsUserCreate'),
('User Manager','AdminPermissionsUserDelete'),
('User Manager','AdminPermissionsUsers'),
('User Manager','AdminPermissionsUserUpdate'),
('Menu','All Menus'),
('SuperAdmin','All Menus Task'),
('SuperAdmin','Analytics'),
('All Menus','Api Tag Task'),
('Admin Setup','Api User Task'),
('PS Admin','Api User Task'),
('Setup','Api User Task'),
('Template Message','Applied Template Task'),
('SuperAdmin','Ask Jerry Dashboard'),
('Account Admin','Auto Responders'),
('Account User','Auto Responders'),
('Editor','Auto Responders'),
('Engagement','Auto Responders'),
('Messaging','Auto Responders'),
('PS Admin','Auto Responders'),
('SubscribeAdmin','Auto Responders'),
('Analytics','Behavior Analytics'),
('SubscribeAdmin','Behavior Analytics'),
('Analytics','Campaign Analytics Task'),
('Behavior Analytics','Campaign Analytics Task'),
('Account Admin','Category And Tags Task'),
('Account User','Category And Tags Task'),
('PS Admin','Category And Tags Task'),
('Setup','Category And Tags Task'),
('SubscribeAdmin','Category And Tags Task'),
('Connection Engine Task','Channel Select Settings Task'),
('Engagement','Child Modules'),
('Admin Setup','Connection Engine Task'),
('SuperAdmin','Content'),
('Account Admin','Conversation Task'),
('Account User','Conversation Task'),
('Engagement','Conversation Task'),
('PS Admin','Conversation Task'),
('SubscribeAdmin','Conversation Task'),
('SuperAdmin','ConversationValidateMobileNumber'),
('Engagement','Coupon Cards Task'),
('Analytics','Custom Dashboard Task'),
('Account Admin','Custom Data'),
('Account User','Custom Data'),
('Behavior Analytics','Custom Data'),
('PS Admin','Custom Data'),
('Custom Data','Custom Data Call Back Task'),
('Custom Data Task','Custom Data Call Back Task'),
('Data Analyst','Custom Data Call Back Task'),
('JS Tracking Tester','Custom Data Call Back Task'),
('SuperAdmin','Custom Data Call Back Task'),
('Custom Data','Custom Data Report Task'),
('Custom Data Task','Custom Data Report Task'),
('Analytics','Custom Data Task'),
('Data Analyst','Custom Data Task'),
('JS Tracking Tester','Custom Data Task'),
('Follower Custom Field Task','Custom Field Task'),
('Account Admin','Customize Task'),
('Account User','Customize Task'),
('PS Admin','Customize Task'),
('Setup','Customize Task'),
('SubscribeAdmin','Customize Task'),
('Account Admin','Dashboard Task'),
('Account User','Dashboard Task'),
('Analytics','Dashboard Task'),
('Data Analyst','Dashboard Task'),
('PS Admin','Dashboard Task'),
('SubscribeAdmin','Dashboard Task'),
('Auto Responders','Default Message Task'),
('Admin Setup','Dynamic Api Task'),
('Setup','Dynamic Api Task'),
('Account Admin','Ecommerce Analytics Task'),
('Account User','Ecommerce Analytics Task'),
('Analytics','Ecommerce Analytics Task'),
('Behavior Analytics','Ecommerce Analytics Task'),
('Data Analyst','Ecommerce Analytics Task'),
('PS Admin','Ecommerce Analytics Task'),
('Admin Setup','Ecommerce Setting Task'),
('PS Admin','Ecommerce Setting Task'),
('SuperAdmin','Ecommerce Setting Task'),
('Setup','Eidt Profile Task'),
('EIP Management','EIP Followers Task'),
('EIP Management Task','EIP Followers Task'),
('Personal Shopper','EIP Followers Task'),
('EIP Management Task','EIP Management'),
('NAPEIP Task','EIP Management Task'),
('SuperAdmin','EIP Management Task'),
('EIP Management','EIP Settings Task'),
('EIP Management Task','EIP Settings Task'),
('Content','Email'),
('Multip Channel Task','Email Module Task'),
('Email','Email Record Task'),
('WebPower Email Module','Email Record Task'),
('Email','Email Send a Preview Task'),
('WebPower Email Module','Email Send a Preview Task'),
('WebPower Email Module','Email Setting Task'),
('Email','Email Template Task'),
('WebPower Email Module','Email Template Task'),
('SuperAdmin','Engagement'),
('Admin Setup','Event Callback Api Task'),
('Setup','Event Callback Api Task'),
('SuperAdmin','Event Callback Api Task'),
('Child Modules','Events'),
('Engagement','Events'),
('Account Admin','Exfollowers Task'),
('Follower Analytics','Follower Actions Log Task'),
('Account Admin','Follower Analytics'),
('Account User','Follower Analytics'),
('Analytics','Follower Analytics'),
('Data Analyst','Follower Analytics'),
('PS Admin','Follower Analytics'),
('SubscribeAdmin','Follower Analytics'),
('Follower Analytics','Follower Attribution Task'),
('Setup','Follower Custom Field Task'),
('SuperAdmin','Follower Custom Field Task'),
('Follower Analytics','Follower Growth Analytics Task'),
('Follower Analytics','Follower KOL Task'),
('SuperAdmin','Follower Management'),
('Follower Analytics','Follower Networks Task'),
('SubscribeAdmin','Follower Networks Task'),
('Follower Analytics','Follower Overview Task'),
('Setup','Follower Rating Rules Task'),
('Follower Custom Field Task','FollowerEavCategory Task'),
('Account Admin','Followers Task'),
('Account User','Followers Task'),
('Follower Management','Followers Task'),
('Promotion Analytics','Form Event Analytics Task'),
('Editor','Form Events Task'),
('Events','Form Events Task'),
('Admin Setup','Grata Service Api Task'),
('PS Admin','Grata Service Api Task'),
('Setup','Grata Service Api Task'),
('Health Check Task','Health Check Email Task'),
('Account Admin','Health Check Report Task'),
('Account User','Health Check Report Task'),
('Analytics','Health Check Report Task'),
('PS Admin','Health Check Report Task'),
('SubscribeAdmin','Health Check Report Task'),
('Account Admin','Health Check Score Standard Task'),
('Account User','Health Check Score Standard Task'),
('Health Check Task','Health Check Score Standard Task'),
('PS Admin','Health Check Score Standard Task'),
('SubscribeAdmin','Health Check Score Standard Task'),
('Setup','Health Check Task'),
('Account Admin','HTML5 Pages Task'),
('Account User','HTML5 Pages Task'),
('Child Modules','HTML5 Pages Task'),
('Editor','HTML5 Pages Task'),
('Engagement','HTML5 Pages Task'),
('PS Admin','HTML5 Pages Task'),
('SubscribeAdmin','HTML5 Pages Task'),
('Engagement','Journey Task'),
('Auto Responders','Keyword Auto-Reply Task'),
('Customer Service','Keyword Auto-Reply Task'),
('SubscribeAdmin','Keyword Auto-Reply Task'),
('Sales Team Task','Lead Board Task'),
('Account Admin','Manage Posts Task'),
('Account User','Manage Posts Task'),
('Posts Task','Manage Posts Task'),
('PS Admin','Manage Posts Task'),
('Smart Posts','Manage Posts Task'),
('SubscribeAdmin','Manage Posts Task'),
('Access Token Api Task','ManagerAccessTokenCreate'),
('Admin Setup','ManagerAccessTokenCreate'),
('SuperAdmin','ManagerAccessTokenCreate'),
('Admin Setup','ManagerApiAdmin'),
('Api User Task','ManagerApiAdmin'),
('SuperAdmin','ManagerApiAdmin'),
('All Menus Task','ManagerApiTagAdmin'),
('Api Tag Task','ManagerApiTagAdmin'),
(' Ask Jerry Dashboard','ManagerAskjeryDashboardIndex'),
('Ask Jerry Dashboard','ManagerAskjeryDashboardIndex'),
('SuperAdmin','ManagerAskjeryDashboardIndex'),
('Campaign Analytics Task','ManagerCampaignAnalyticsAdmin'),
('Campaign Analytics Task','ManagerCampaignAnalyticsCreate'),
('Campaign Analytics Task','ManagerCampaignAnalyticsDelete'),
('Campaign Analytics Task','ManagerCampaignAnalyticsUpdate'),
('Promotion Task','ManagerCampaignsAdmin'),
('Promotion Task','ManagerCampaignsCreate'),
('Promotion Task','ManagerCampaignsNotifiction'),
('Promotion Task','ManagerCampaignsUpdate'),
('Coupon Cards Task','ManagerCardsAdmin'),
('Data Analyst','ManagerCardsAdmin'),
('Editor','ManagerCardsAdmin'),
('Coupon Cards Task','ManagerCardsCreate'),
('Editor','ManagerCardsCreate'),
('Coupon Cards Task','ManagerCardsRedeem'),
('Editor','ManagerCardsRedeem'),
('Coupon Cards Task','ManagerCardsUpdate'),
('Editor','ManagerCardsUpdate'),
('Channel Select Settings Task','ManagerChannelSelectSettingsIndex'),
('Conversation Task','ManagerConversationAdmin'),
('SuperAdmin','ManagerConversationAdmin'),
('Conversation Task','ManagerConversationCopy'),
('Conversation Task','ManagerConversationCreate'),
('Conversation Task','ManagerConversationTree'),
('Conversation Task','ManagerConversationUpdate'),
('Coupon Cards Task','ManagerCouponAnalyticsIndex'),
('Data Analyst','ManagerCouponAnalyticsIndex'),
('Promotion Task','ManagerCouponPromotionAnalyticsIndex'),
('Custom Data Report Task','ManagerCustomDataReportAdmin'),
('Custom Data Report Task','ManagerCustomDataReportCreate'),
('Custom Data Report Task','ManagerCustomDataReportDelete'),
('Custom Data Report Task','ManagerCustomDataReportUpdate'),
('Eidt Profile Task','ManagerCustomerUpdate'),
('Customize Task','ManagerCustomThemesModify'),
('Follower Attribution Task','ManagerDataStatisticsFollowerAttribution'),
('Messaged Posts Task','ManagerDataStatisticsMessagePostAnalytics'),
('Published Posts Task','ManagerDataStatisticsPostAnalytics'),
('Share Report Task','ManagerDataStatisticsShareReport'),
('Custom Dashboard Task','ManagerDefaultCustom'),
('Dashboard Task','ManagerDefaultIndex'),
('Default Message Task','ManagerDefaultMessagesModify'),
('Weekly Report Task','ManagerDefaultNapWeek'),
('Segmentation Task','ManagerDynamicRulesAdmin'),
('Segmentation Task','ManagerDynamicRulesCreate'),
('Segmentation Task','ManagerDynamicRulesUpdate'),
('Ecommerce Analytics Task','ManagerEcommerceIndex'),
('Admin Setup','ManagerEcommerceSetting'),
('Ecommerce Setting Task','ManagerEcommerceSetting'),
('EIP Followers Task','ManagerEipFollowers'),
('EIP Settings Task','ManagerEipList'),
('EIP Settings Task','ManagerEipUsers'),
('Message Events Task','ManagerEventAdmin'),
('Admin Setup','ManagerEventCallbackCreate'),
('Event Callback Api Task','ManagerEventCallbackCreate'),
('Message Events Task','ManagerEventCreate'),
('Message Events Task','ManagerEventUpdate'),
('Admin Setup','ManagerExtensionsCreate'),
('Dynamic Api Task','ManagerExtensionsCreate'),
('Welcome Message Task','ManagerFirstAttentionAdmin'),
('Welcome Message Task','ManagerFirstAttentionCreate'),
('Welcome Message Task','ManagerFirstAttentionUpdate'),
('Follower Overview Task','ManagerFollowerAnalyseAll'),
('Follower Growth Analytics Task','ManagerFollowerAnalyseIndex'),
('Follower KOL Task','ManagerFollowerAnalyseKol'),
('Follower Networks Task','ManagerFollowerAnalyseNetwork'),
('Follower Custom Field Task','ManagerFollowerEavCategoryList'),
('FollowerEavCategory Task','ManagerFollowerEavCategoryList'),
('Follower Custom Field Task','ManagerFollowerEavCreate'),
('Custom Field Task','ManagerFollowerEavIndex'),
('Follower Custom Field Task','ManagerFollowerEavIndex'),
('Follower Custom Field Task','ManagerFollowerEavUpdate'),
('Follower Rating Rules Task','ManagerFollowerRatingRulesAdmin'),
('Follower Rating Rules Task','ManagerFollowerRatingRulesImport'),
('Follower Rating Rules Task','ManagerFollowerRatingRulesUpdate'),
('Form Events Task','ManagerFormEventAdmin'),
('Form Event Analytics Task','ManagerFormEventAnalyticsAdmin'),
('Form Events Task','ManagerFormEventCreate'),
('Form Events Task','ManagerFormEventUpdate'),
('Admin Setup','ManagerGrataCreate'),
('Grata Service Api Task','ManagerGrataCreate'),
('SuperAdmin','ManagerGrataCreate'),
('Personal Shopper','ManagerGroupMessageRecordAdmin'),
('Sent Posts List Task','ManagerGroupMessageRecordAdmin'),
('Scheduled Posts List Task','ManagerGroupMessageRecordAdminschedule'),
('Sent Posts List Task','ManagerGroupMessageRecordDeleteRecord'),
('48 Posts List Task','ManagerGroupMessageRecordFortyhours'),
('Schedule a Post Task','ManagerGroupsMessage'),
('Schedule a Post Task','ManagerGroupsPreview'),
('Health Check Email Task','ManagerHealthCheckEmailIndex'),
('Health Check Task','ManagerHealthCheckEmailIndex'),
('Health Check Report Task','ManagerHealthCheckScoreIndex'),
('Health Check Score Standard Task','ManagerHealthCheckStandardIndex'),
('Health Check Task','ManagerHealthCheckStandardIndex'),
('HTML5 Pages Task','ManagerHtmlFivePagesAdmin'),
('HTML5 Pages Task','ManagerHtmlFivePagesCreate'),
('HTML5 Pages Task','ManagerHtmlFivePagesDelete'),
('HTML5 Pages Task','ManagerHtmlFivePagesUpdate'),
('The 48 Hour List Task','ManagerInteractiveRecordAdmin'),
('Engagement','ManagerJourneyAdmin'),
('Journey Task','ManagerJourneyAdmin'),
('Keyword Auto-Reply Task','ManagerKeyWordAdmin'),
('Keyword Auto-Reply Task','ManagerKeyWordCreate'),
('Keyword Auto-Reply Task','ManagerKeyWordUpdate'),
('Editor','ManagerMenuAdmin'),
('Menu Task','ManagerMenuAdmin'),
('Editor','ManagerMenuClear'),
('Menu Task','ManagerMenuClear'),
('Menu Analytics Task','ManagerMenuMenuAnalytics'),
('Menu Task','ManagerMenuUpdateMenu'),
('Customer Service','ManagerMessageList'),
('Data Analyst','ManagerMessageList'),
('Message Inbox Task','ManagerMessageList'),
('Data Analyst','ManagerMessageReceivedMessageStatistic'),
('Message Inbox Task','ManagerMessageReceivedMessageStatistic'),
('Customer Service','ManagerMessageReply'),
('Message Inbox Task','ManagerMessageReply'),
('Personal Shopper','ManagerMessageReply'),
('Message Inbox Task','ManagerMessageSetAllAsRead'),
('Email Module Task','ManagerMultipChannelEmailPreview'),
('Email Send a Preview Task','ManagerMultipChannelEmailPreview'),
('Email Module Task','ManagerMultipChannelEmailRecord'),
('Email Record Task','ManagerMultipChannelEmailRecord'),
('Email Module Task','ManagerMultipChannelEmailSetting'),
('Email Setting Task','ManagerMultipChannelEmailSetting'),
('Email Module Task','ManagerMultipChannelEmailTemplates'),
('Email Template Task','ManagerMultipChannelEmailTemplates'),
('SMS Module Task','ManagerMultipChannelSMSPreview'),
('SMS Send a Preview Task','ManagerMultipChannelSMSPreview'),
('SMS Module Task','ManagerMultipChannelSMSRecord'),
('SMS Record Task','ManagerMultipChannelSMSRecord'),
('SMS Module Task','ManagerMultipChannelSMSSetting'),
('SMS Setting Task','ManagerMultipChannelSMSSetting'),
('SMS Module Task','ManagerMultipChannelSMSTemplates'),
('SMS Template Task','ManagerMultipChannelSMSTemplates'),
('Wechat Tempalte Task','ManagerMultipChannelTemplateAdmin'),
('Wechat Template Task','ManagerMultipChannelTemplateAdmin'),
('Applied Template Task','ManagerMultipChannelTemplateApplied'),
('Wechat Tempalte Task','ManagerMultipChannelTemplateApplied'),
('Wechat Tempalte Task','ManagerMultipChannelTemplateList'),
('Template Message Send a Preview Task','ManagerMultipChannelTemplatePreview'),
('Wechat Tempalte Task','ManagerMultipChannelTemplatePreview'),
('Template Record Task','ManagerMultipChannelTemplateRecord'),
('Wechat Tempalte Task','ManagerMultipChannelTemplateRecord'),
('Wechat Tempalte Task','ManagerMultipChannelTemplateSchedule'),
('SuperAdmin','ManagerMultiSegmentMessage'),
('Online Offline Campaign Task','ManagerOnlineOfflineCampaignIndex'),
('All Menus Task','ManagerPersonalMenuAdmin'),
('Menus Task','ManagerPersonalMenuAdmin'),
('All Menus Task','ManagerPersonalMenuList'),
('Publish List Task','ManagerPersonalMenuList'),
('Data Analyst','ManagerPollAdmin'),
('Editor','ManagerPollAdmin'),
('Poll Task','ManagerPollAdmin'),
('Data Analyst','ManagerPollAnalytics'),
('Poll Task','ManagerPollAnalytics'),
('Editor','ManagerPollCreate'),
('Poll Task','ManagerPollCreate'),
('Editor','ManagerPollUpdate'),
('Poll Task','ManagerPollUpdate'),
('Product List Task','ManagerProductManagementAdmin'),
('Update History Task','ManagerProductManagementImportRecords'),
('Product List Settings Task','ManagerProductManagementSetting'),
('Product Template Settings Task','ManagerProductManagementTemplateSetting'),
('Profile Task','ManagerProfileSetting'),
('QR Codes Task','ManagerQrcodeAdmin'),
('QR Codes Task','ManagerQrcodeCreate'),
('QR Codes Task','ManagerQrcodeUpdate'),
('Admin Setup','ManagerQueryCreate'),
('Menu Query Task','ManagerQueryCreate'),
('Manage Posts Task','ManagerResAdmin'),
('Personal Shopper','ManagerResAdmin'),
('Manage Posts Task','ManagerResCopy'),
('Personal Shopper','ManagerResCopy'),
('Manage Posts Task','ManagerResCreateMore'),
('Manage Posts Task','ManagerResCreateMorePost'),
('New Editor Post Task','ManagerResCreateMorePost'),
('Personal Shopper','ManagerResCreateMorePost'),
('Manage Posts Task','ManagerResDelete'),
('Personal Shopper','ManagerResDelete'),
('SuperAdmin','ManagerResDistributeSubPost'),
('Manage Posts Task','ManagerResImportPost'),
('SuperAdmin','ManagerResPostLine'),
('Post Sync List Task','ManagerResSyncRecord'),
('Manage Posts Task','ManagerResUpdate'),
('Manage Posts Task','ManagerResUpdateMore'),
('Manage Posts Task','ManagerResUpdateMorePost'),
('New Editor Post Task','ManagerResUpdateMorePost'),
('Personal Shopper','ManagerResUpdateMorePost'),
('Manage Posts Task','ManagerResUpdateReply'),
('Manage Posts Task','ManagerResUpdateReplyMore'),
('Manage Posts Task','ManagerResUpdateReplyMorePost'),
('New Editor Post Task','ManagerResUpdateReplyMorePost'),
('Personal Shopper','ManagerResUpdateReplyMorePost'),
('Wheel of Fortune Task','ManagerRotateAdmin'),
('Wheel of Fortune Task','ManagerRotateCreate'),
('Wheel of Fortune Task','ManagerRotateprizeAdmin'),
('Wheel of Fortune Task','ManagerRotateUpdate'),
('Segmentator Task','ManagerSegAnalyticsAdmin'),
('Segmentator Task','ManagerSegAnalyticsAnalytics'),
('Segmentor Task','ManagerSegAnalyticsAnalytics'),
('Segmentator Task','ManagerSegAnalyticsCreate'),
('SuperAdmin','ManagerShowBenchMark'),
('Send SMS Task','ManagerSmsMessage'),
('SMS Setting Task','ManagerSmsMessageSmsCreate'),
('SMS Log Task','ManagerSmsRecordAdmin'),
('Surveys Task','ManagerSurveyAdmin'),
('Surveys Task','ManagerSurveyCreate'),
('Surveys Task','ManagerSurveyUpdate'),
('SuperAdmin','ManagerTagDelete'),
('Tags Task','ManagerTagsAdmin'),
('Tags Task','ManagerTagsCreate'),
('Tag Category Task','ManagerTagsCreateCategory'),
('Tags Task','ManagerTagsCreateCategory'),
('Tag Category Task','ManagerTagsTagCategoryList'),
('Tags Task','ManagerTagsTagCategoryList'),
('Tags Task','ManagerTagsUpdate'),
('Tag Category Task','ManagerTagsUpdateCategory'),
('Tags Task','ManagerTagsUpdateCategory'),
('Custom Data Call Back Task','ManagerTrackingSearch'),
('Account Admin','ManagerTriggersAdmin'),
('Account User','ManagerTriggersAdmin'),
('Editor','ManagerTriggersAdmin'),
('PS Admin','ManagerTriggersAdmin'),
('SubscribeAdmin','ManagerTriggersAdmin'),
('Trigger Actions Task','ManagerTriggersAdmin'),
('Account Admin','ManagerTriggersCreate'),
('Account User','ManagerTriggersCreate'),
('Editor','ManagerTriggersCreate'),
('PS Admin','ManagerTriggersCreate'),
('SubscribeAdmin','ManagerTriggersCreate'),
('Trigger Actions Task','ManagerTriggersCreate'),
('Account Admin','ManagerTriggersDelete'),
('Account User','ManagerTriggersDelete'),
('Editor','ManagerTriggersDelete'),
('PS Admin','ManagerTriggersDelete'),
('SubscribeAdmin','ManagerTriggersDelete'),
('Trigger Actions Task','ManagerTriggersDelete'),
('Trigger Actions Task','ManagerTriggersLbsCreate'),
('Trigger Actions Task','ManagerTriggersLbsUpdate'),
('Account Admin','ManagerTriggersUpdate'),
('Account User','ManagerTriggersUpdate'),
('Editor','ManagerTriggersUpdate'),
('PS Admin','ManagerTriggersUpdate'),
('SubscribeAdmin','ManagerTriggersUpdate'),
('Trigger Actions Task','ManagerTriggersUpdate'),
('Union Analytics Task','ManagerUnionAnalyticsGetVennChartData'),
('Union Analytics Task','ManagerUnionAnalyticsIndex'),
('Follower Actions Log Task','ManagerUserActionRecordAdmin'),
('Account Admin','ManagerWechatCustomerAdmin'),
('Account User','ManagerWechatCustomerAdmin'),
('Customer Service','ManagerWechatCustomerAdmin'),
('Followers Task','ManagerWechatCustomerAdmin'),
('PS Admin','ManagerWechatCustomerAdmin'),
('SubscribeAdmin','ManagerWechatCustomerAdmin'),
('Followers Task','ManagerWechatCustomerGetAllUser'),
('Account Admin','ManagerWechatCustomerGetUnfollower'),
('Account User','ManagerWechatCustomerGetUnfollower'),
('Customer Service','ManagerWechatCustomerGetUnfollower'),
('Followers Task','ManagerWechatCustomerGetUnfollower'),
('PS Admin','ManagerWechatCustomerGetUnfollower'),
('SubscribeAdmin','ManagerWechatCustomerGetUnfollower'),
('Followers Task','ManagerWechatCustomerUpdateActionCount'),
('Account Admin','ManagerWechatCustomerView'),
('Account User','ManagerWechatCustomerView'),
('Customer Service','ManagerWechatCustomerView'),
('Data Analyst','ManagerWechatCustomerView'),
('Editor','ManagerWechatCustomerView'),
('Followers Task','ManagerWechatCustomerView'),
('Personal Shopper','ManagerWechatCustomerView'),
('PS Admin','ManagerWechatCustomerView'),
('SubscribeAdmin','ManagerWechatCustomerView'),
('Shop Location Task','ManagerWechatshopAdmin'),
('Shop Location Task','ManagerWechatshopCreate'),
('Shop Location Task','ManagerWechatshopDelete'),
('Shop Location Task','ManagerWechatshopUpdate'),
('Wheel of Fortune Analytics Task','ManagerWheelOfFortuneAnalyticsAdmin'),
('Select Active Journey','ManagerWindowSettingsConfig'),
('Window Settings Task','ManagerWindowSettingsIndex'),
('Engagement','Menu'),
('Account Admin','Menu Analytics Task'),
('Account User','Menu Analytics Task'),
('Behavior Analytics','Menu Analytics Task'),
('PS Admin','Menu Analytics Task'),
('Admin Setup','Menu Query Task'),
('Setup','Menu Query Task'),
('Account Admin','Menu Task'),
('Account User','Menu Task'),
('Menu','Menu Task'),
('PS Admin','Menu Task'),
('Setup','Menu Task'),
('SubscribeAdmin','Menu Task'),
('All Menus','Menus Task'),
('Events','Message Events Task'),
('Account Admin','Message Inbox Task'),
('Account User','Message Inbox Task'),
('Editor','Message Inbox Task'),
('Engagement','Message Inbox Task'),
('Messaging','Message Inbox Task'),
('PS Admin','Message Inbox Task'),
('SubscribeAdmin','Message Inbox Task'),
('Data Analyst','Messaged Posts Task'),
('Post Analytics','Messaged Posts Task'),
('PS Admin','Messaged Posts Task'),
('SubscribeAdmin','Messaged Posts Task'),
('SuperAdmin','Messaging'),
('SuperAdmin','Modules'),
('SuperAdmin','Multip Channel Task'),
('Modules','NAPEIP Task'),
('PS Admin','NAPEIP Task'),
('Editor','New Editor Post Task'),
('SuperAdmin','New Editor Post Task'),
('Modules','O2O Management Task'),
('Setup','O2O Set Up Task'),
('Sales Team Task','O2oManagement'),
('Sales Points Task','O2oPointsAdmin'),
('Sales Team Task','O2oPointsAdmin'),
('Sales Level Task','O2oSalesLevelAdmin'),
('Sales Team Task','O2oSalesTeamAdmin'),
('Team Management Task','O2oSalesTeamAdmin'),
('Lead Board Task','O2oSalesTeamLeadBoard'),
('Sales Team Task','O2oSalesTeamLeadBoard'),
('O2O Set Up Task','O2oSettingCreate'),
('Sales Team Task','O2oSettingCreate'),
('Sales Team Task','O2oStoresAdmin'),
('Setup','Online Offline Campaign Task'),
('Account Admin','Poll Task'),
('Account User','Poll Task'),
('Child Modules','Poll Task'),
('Editor','Poll Task'),
('Engagement','Poll Task'),
('Account Admin','Post Analytics'),
('Account User','Post Analytics'),
('Analytics','Post Analytics'),
('PS Admin','Post Analytics'),
('Smart Posts','Post Lists'),
('Posts Task','Post Send And Push Log'),
('Post Send And Push Log','Post Sync List Task'),
('SuperAdmin','Post Sync List Task'),
('Content','Posts Task'),
('Product Management Task','Product List Settings Task'),
('Personal Shopper','Product List Task'),
('Product Management Task','Product List Task'),
('NAPEIP Task','Product Management Task'),
('SuperAdmin','Product Management Task'),
('Product Management Task','Product Template Settings Task'),
('Account Admin','Profile Task'),
('Account User','Profile Task'),
('PS Admin','Profile Task'),
('Setup','Profile Task'),
('SubscribeAdmin','Profile Task'),
('Analytics','Promotion Analytics'),
('Engagement','Promotion Task'),
('All Menus','Publish List Task'),
('Data Analyst','Published Posts Task'),
('Post Analytics','Published Posts Task'),
('SubscribeAdmin','Published Posts Task'),
('Account Admin','QR Codes Task'),
('Account User','QR Codes Task'),
('Editor','QR Codes Task'),
('Engagement','QR Codes Task'),
('SuperAdmin','RBAC'),
('SuperAdmin','Republish Post Task'),
('Republish Post Task','RepublishPostTask'),
('RBAC','Role Manager Task'),
('Sales Team Task','Sales Level Task'),
('Sales Team Task','Sales Points Task'),
('O2O Management Task','Sales Team Task'),
('SalesAdmin','Sales Team Task'),
('SuperAdmin','Sales Team Task'),
('Account Admin','Schedule a Post Task'),
('Account User','Schedule a Post Task'),
('Posts Task','Schedule a Post Task'),
('PS Admin','Schedule a Post Task'),
('Smart Posts','Schedule a Post Task'),
('SubscribeAdmin','Schedule a Post Task'),
('Account Admin','Scheduled Posts List Task'),
('Account User','Scheduled Posts List Task'),
('Post Lists','Scheduled Posts List Task'),
('Post Send And Push Log','Scheduled Posts List Task'),
('PS Admin','Scheduled Posts List Task'),
('SubscribeAdmin','Scheduled Posts List Task'),
('Account Admin','Segmentation Task'),
('Account User','Segmentation Task'),
('Follower Management','Segmentation Task'),
('PS Admin','Segmentation Task'),
('SubscribeAdmin','Segmentation Task'),
('SuperAdmin','SegmentationExportInfo'),
('SuperAdmin','Segmentator Task'),
('Follower Management','Segmentor Task'),
('Connection Engine Task','Select Active Journey'),
('SMS','Send SMS Task'),
('Account Admin','Sent Posts List Task'),
('Account User','Sent Posts List Task'),
('Post Lists','Sent Posts List Task'),
('Post Send And Push Log','Sent Posts List Task'),
('PS Admin','Sent Posts List Task'),
('SubscribeAdmin','Sent Posts List Task'),
('SuperAdmin','Setup'),
('Post Analytics','Share Report Task'),
('Child Modules','Shop Location Task'),
('Editor','Shop Location Task'),
('Setup','Shop Location Task'),
('Editor','Smart Posts'),
('SuperAdmin','Smart Posts'),
('Content','SMS'),
('Messaging','SMS'),
('SMS','SMS Log Task'),
('Multip Channel Task','SMS Module Task'),
('WebPower SMS Module','SMS Record Task'),
('SMS','SMS Send a Preview Task'),
('WebPower SMS Module','SMS Send a Preview Task'),
('Setup','SMS Setting Task'),
('WebPower SMS Module','SMS Setting Task'),
('WebPower SMS Module','SMS Template Task'),
('Child Modules','Surveys Task'),
('Editor','Surveys Task'),
('Engagement','Surveys Task'),
('Category And Tags Task','Tag Category Task'),
('Category And Tags Task','Tags Task'),
('Editor','Tags Task'),
('Follower Management','Tags Task'),
('Sales Team Task','Team Management Task'),
('Content','Template Message'),
('Template Message','Template Message Send a Preview Task'),
('Template Message','Template Record Task'),
('SuperAdmin','TemplateSegmentation'),
('Account Admin','The 48 Hour List Task'),
('Account User','The 48 Hour List Task'),
('Customer Service','The 48 Hour List Task'),
('Editor','The 48 Hour List Task'),
('Follower Management','The 48 Hour List Task'),
('PS Admin','The 48 Hour List Task'),
('SubscribeAdmin','The 48 Hour List Task'),
('Engagement','Trigger Actions Task'),
('Messaging','Trigger Actions Task'),
('Analytics','Union Analytics Task'),
('Product Management Task','Update History Task'),
('Account Admin','User Manager'),
('PS Admin','User Manager'),
('RBAC','User Manager'),
('SubscribeAdmin','User Manager'),
('Content','WebPower Email Module'),
('Content','WebPower SMS Module'),
('RBAC','Wechat Customers'),
('Multip Channel Task','Wechat Tempalte Task'),
('Template Message','Wechat Template Task'),
('Analytics','Weekly Report Task'),
('Auto Responders','Welcome Message Task'),
('Promotion Analytics','Wheel of Fortune Analytics Task'),
('Engagement','Wheel of Fortune Task'),
('Connection Engine Task','Window Settings Task');

