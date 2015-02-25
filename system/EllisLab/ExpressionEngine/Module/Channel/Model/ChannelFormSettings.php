<?php

namespace EllisLab\ExpressionEngine\Module\Channel\Model;

use EllisLab\ExpressionEngine\Service\Model\Model;

/**
 * ExpressionEngine - by EllisLab
 *
 * @package		ExpressionEngine
 * @author		EllisLab Dev Team
 * @copyright	Copyright (c) 2003 - 2015, EllisLab, Inc.
 * @license		http://ellislab.com/expressionengine/user-guide/license.html
 * @link		http://ellislab.com
 * @since		Version 3.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * ExpressionEngine Channel Form Settings Model
 *
 * @package		ExpressionEngine
 * @subpackage	File
 * @category	Model
 * @author		EllisLab Dev Team
 * @link		http://ellislab.com
 */
class ChannelFormSettings extends Model {

	protected static $_primary_key = 'channel_form_settings_id';
	protected static $_table_name = 'channel_form_settings';

	protected $channel_form_settings_id;
	protected $site_id;
	protected $channel_id;
	protected $default_status;
	protected $require_captcha;
	protected $allow_guest_posts;
	protected $default_author;
}