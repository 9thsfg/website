<div style="text-align:right;padding:2.5em 2.5em 0"><form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="GUPQNQPZ6V9NG">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/it_IT/i/scr/pixel.gif" width="1" height="1">
</form></div>
<?php

$config_file    = get_option( 'w3all_path_to_cms' );
$config_avatars = get_option( 'w3all_conf_avatars' );
$w3all_config_avatars = unserialize($config_avatars);


	       if (!empty($config_file)){
        
           $config_file =  get_option( 'w3all_path_to_cms' ) . '/config.php';
 	    
 	    	ob_start();
		     include( $config_file );
        ob_end_clean(); 
}

 if (isset( $_POST["w3all_conf"]["w3all_path_to_cms"] ) ){

 $config_file =  $_POST["w3all_conf"]["w3all_path_to_cms"] . '/config.php';
} 
   
    if ( !defined('PHPBB_INSTALLED') ){
     	
     	echo "<h3 style=\"color:#ff0000\">WARNING!<span style=\"color:#000\"> Wp w3all miss phpBB configuration file (or you have the phpBB config.php not well configured):</span><br /><br /></h3>";
    	echo "<h3 style=\"color:#ff0000\">Set the correct full ABSOLUTE PATH to phpBB config.php folder!</h3>";
      echo "<h3 style=\"color:red\">Notice: <span style=\"color:green\">WP_w3all for subdomains installations.</span> Use the manual config option. If you choose to include/use the phpBB config.php and result impossible to correctly setup the wp_w3all config path<br />please read this <a target=\"_blank\" href=\"http://www.axew3.com/w3/2016/03/how-to-disable-open_basedir-for-subdomain-file-inclusion/\">post about files inclusions restrictions</a>, when in php.ini file is set the open_basedir directive</h3>";
     }
    
$up_conf_w3all_url = admin_url() . 'options-general.php?page=wp-w3all-options';


if (isset( $_POST["w3all_conf_pref_template_embed"]["w3all_forum_template_wppage"] ) ){

// if you want auto name your embedded board page with something different like 'myniceforum' add it here
$w3all_pages = array('board' => 'board', 'boards' => 'boards', 'community' => 'community', 'forums' => 'forums', 'forum' => 'forum');

$w3all_embed_page_name =  get_option( 'w3all_forum_template_wppage' );

 if( ! in_array($w3all_embed_page_name, $w3all_pages) && !empty($w3all_embed_page_name) ){
 		echo "<h2 style=\"color:#ff0000\">Error: please choose and set the correct name for template page. Available valid names are:<br /><i style=\"color:#000\">board, boards, community, forum, forums</i><br />The page name <i style=\"color:#000\">forum</i> has been created. You can repeat the process if you like another name.<br />Now it is necessary to create a blank WordPress page titled/named the same as you set this value.</h2>";
 	  $w3all_embed_page_name = "forum";
}

 $w3all_emb_page = 'page-' . $w3all_embed_page_name . '.php';

 $w3all_page_td = get_template_directory() . '/' . $w3all_emb_page;

foreach ($w3all_pages as $page) {
   $w3all_emb_page_tg = get_template_directory() . '/' . 'page-' . $page . '.php';
    @unlink($w3all_emb_page_tg);
}

$w3fpath = WPW3ALL_PLUGIN_DIR . 'addons/page-forum.php';
$w3all_default_template = file_get_contents($w3fpath);
file_put_contents($w3all_page_td, $w3all_default_template);

}

if(!defined('PHPBB_INSTALLED')){
	$style_warn = 'color:#FF0000;';
} else {
	$style_warn = 'color:green;';
}
?>


<div class="wrap">

<div class=""><h1 style="color:green">WP_w3all Path and Url configuration</h1></div>
<form name="w3all_conf" id="w3all-conf" action="<?php echo esc_url( $up_conf_w3all_url ); ?>" method="POST">
<hr />

<div class="">
<b>Note:</b> This is the most important setting, the absolute path to a phpBB <i>config.php</i> file, that can be the <b>phpBB root <i>config.php</i> file</b> or a <b>custom <i>config.php</i> file</b> on a custom folder, as below explained. Advanced users can just read this to be in 1min up and running. 
WP_w3all require a correct <i>config.php</i> file to work: you can setup here the path to include the <b>root phpBB config.php file</b> OR a <b>manual edited custom config.php file</b>. Manual custom config.php has been introduced to get WP_w3all easy to be installed on subdomains, and for compatibility issues about some external plugin that seem to conflict with phpBB vars names as are on a <i>phpBB root config.php</i> default file: <b>it isn't strictly required</b>, but some external images plugin for example, require to choose manual custom config.php on WP_w3all to work as expected. 
<br /><br /><b>Manual custom config.php and path to config.php how to</b>: you can choose to use/include an <b>edited custom config.php file</b> OR the <b>phpBB root config.php</b> file. If you choose to use/include, the manual edited custom <i>config.php</i>, set the correct path to it after you have complete this easy procedure:
<br /><b><a href="http://www.axew3.com/w3/2016/09/how-to-setup-wp_w3all-manual-phpbb-config-php-file-and-path/" target="_blank">How to setup custom manual config.php and set correct path</a></b>

<br /><br /><b>Skip custom manual config.php, setup path to phpBB root config.php how to</b>: <b><a href="http://www.axew3.com/w3/index.php/forum/?viewforum=7&viewtopic=61" target="_blank">Path config how to</a></b>

<br /><br />Path Example for manual custom WP_w3all phpBB config.php: <i>/web/htdocs/home/wp-content/plugins/<b>wp-w3all-config</b></i>
<br /><br />Path Example for config.php on phpBB root folder: <i>/web/htdocs/home/<b>forum</b></i>
<br /><br />If you have choose to include/use the custom <i>wp-content/plugins/wp-w3all-config/<b>config.php</b></i> file, <b>edit it</b> before to apply the path value to file's folder here
<br />
<input id="w3all_path_to_cms" name="w3all_conf[w3all_path_to_cms]" type="text" size="25" value="<?php echo esc_attr( get_option('w3all_path_to_cms') ); ?>"> <b><span style="<?php echo $style_warn ?>"> (REQUIRED)</span> Path</b> - <b style="<?php echo $style_warn ?>">Absolute path to config.php file on <b><i>wp-content/plugins/wp-w3all-config</i></b> OR phpBB root folder</b> - NOTE: do NOT add final slash '/' here</div>
<hr />
<div class="">
<input id="w3all_url_to_cms" name="w3all_conf[w3all_url_to_cms]" type="text" size="25" value="<?php echo esc_attr( get_option('w3all_url_to_cms') ); ?>"> <b>(REQUIRED) </span> URL</b> &nbsp;- Real phpBB URL - NOTE: do NOT add final slash '/' here. <strong>Example</strong>: http://www.axew3.com/forum</div>
<hr />
<input type="submit" name="submit" id="submit" class="button button-primary" value="<?php esc_attr_e('Save WP_w3all configuration', 'wp_w3all_phpbb');?>">
<?php wp_nonce_field( 'w3all_conf_nonce', 'w3all_conf_nonce_f' ); ?>
</form></div>


<div class="wrap" style="margin-top:4.0em;">
<form name="w3all_conf_pref" id="w3all-conf-pref" action="<?php echo esc_url( $up_conf_w3all_url ); ?>" method="POST">	
<div class=""><h1 style="color:green">WP_w3all Preferences</h1></div>
<hr />
<div class=""><h3>Exclude phpBB forums from listing on Last Topics Posts</h3></div>
<p><label""><input id="w3all_exclude_phpbb_forums" name="w3all_conf_pref[w3all_exclude_phpbb_forums]" type="text" size="25" value="<?php echo esc_attr( get_option('w3all_exclude_phpbb_forums') ); ?>"> Comma separated, phpBB forums ID to be excluded from w3all Last Topics Posts widget</label><br /><b>Note</b>: if string contain a different sequence than pairs <b>numberComma</b> the option will not work (or return error inside the front end widget) <b>Correct example: 2,3,7,12,20</b></p>
<hr />
<div class=""><h3>Deactivate phpBB user account until WP confirmation</h3>If this option is set to Yes, users are added on phpBB as <b><i>deactivated</i></b> when they register on WordPress. The phpBB user account will be <b><i>activated</i></b> only after his first login on WordPress.
<br /><br /><b>Note</b>: this work only with default WP registration system where WP send an email link to set first user's password, that user do not know at this time. If you have install an external registration plugin that let choose the password to the user on register, than this option will not work. A little addition of code on WP_w3all in this case is required, different from plugin to plugin, it depend on how it is coded. If your registration plugin provide option to let choose password or not on register for users, than set no on it the option, and all here should work as expected about WP/phpBB account confirmation.</div>
<p><label""><input type="radio" name="w3all_conf_pref[w3all_phpbb_user_deactivated_yn]" id="w3all_phpbb_user_deactivated_yn_1" value="1" <?php checked('1', get_option('w3all_phpbb_user_deactivated_yn')); ?> /> <?php esc_html_e('Yes', 'wp_w3all_phpbb'); ?></label></p>
<p><label""><input type="radio" name="w3all_conf_pref[w3all_phpbb_user_deactivated_yn]" id="w3all_phpbb_user_deactivated_yn_0" value="0" <?php checked('0', get_option('w3all_phpbb_user_deactivated_yn')); ?> /> <?php esc_html_e('No', 'wp_w3all_phpbb'); ?></label></p>
<hr />
<div class=""><h3>Activate WordPress to phpBB users transfer</h3>Once activated it will be visible in wordpress admin side menu under Settings Menu: when transfer has been finished, you can turn it off (and remove from admin side Settings Menu).</div>
<p><label""><input type="radio" name="w3all_conf_pref[w3all_transfer_phpbb_yn]" id="w3all_transfer_phpbb_yn_1" value="1" <?php checked('1', get_option('w3all_transfer_phpbb_yn')); ?> /> <?php esc_html_e('Yes', 'wp_w3all_phpbb'); ?></label></p>
<p><label""><input type="radio" name="w3all_conf_pref[w3all_transfer_phpbb_yn]" id="w3all_transfer_phpbb_yn_0" value="0" <?php checked('0', get_option('w3all_transfer_phpbb_yn')); ?> /> <?php esc_html_e('No', 'wp_w3all_phpbb'); ?></label></p>
<hr />
<input type="submit" name="submit" id="submit" class="button button-primary" value="<?php esc_attr_e('Save WP_w3all Preferences', 'wp_w3all_phpbb');?>">
</form></div>


<div class="wrap" style="margin-top:4.0em;">
<form name="w3all_conf_pref" id="w3all-conf-pref" action="<?php echo esc_url( $up_conf_w3all_url ); ?>" method="POST">	
<div class=""><h1 style="color:green">WP_w3all Avatars Options (1.0)</h1></div>
<hr />
<div class=""><h3>Use phpBB avatar to replace WordPress user's avatar</h3>If set to Yes, Gravatars profiles images on WordPress, are replaced by phpBB user's avatars images, where an avatar's image is available in phpBB for the user. Return WP Gravatar of the user, if no avatar's image has been found in phpBB (one single fast query to get avatars for all users).
<br /><b>Note</b>: you can activate only this option, if you do not want to display user's avatars on WP_w3all Last Forum Topics Widgets, but only on WP posts. The opposite will be possible on next versions.
<br /><b>If this option is set to No (not active) others avatar's options <i>Last Forums Topics widgets</i> here below, do not affect</b>.
<br />Note for Apache server: <b>"i've setup avatar here, but avatar's images aren't displayed!" ... please <a href="http://www.axew3.com/w3/2016/09/phpbb-htaccess-set-avatars-images-available-over-your-domain/" target="_blank">take a look to this easy <i>why and how to resolve</i> post</a></b> before you activate this feature.
<br />Check that on <i>WordPress Admin -> Settings -> Discussion</i> the setting about avatars is enabled. Check also that isn't set to BLANK this setting (if you do not want really it) as avatar for users that have not setup one in WP, or phpBB profile.
<br /><b>Note</b>: looking WP options about avatars, in WordPress Admin -> Settings -> Discussion, you'll see that avatars have been replaced all, by your avatar: this not affect nothing, it is normal. Setup settings as you need and all will work as expected.</div>
<p><label""><input type="radio" name="w3all_conf_avatars[w3all_get_phpbb_avatar_yn]" id="w3all_conf_pref_avatar_1" value="1" <?php checked('1', $w3all_config_avatars['w3all_get_phpbb_avatar_yn']); ?> /> <?php esc_html_e('Yes', 'wp_w3all_phpbb'); ?></label></p>
<p><label""><input type="radio" name="w3all_conf_avatars[w3all_get_phpbb_avatar_yn]" id="w3all_conf_pref_avatar_0" value="0" <?php checked('0', $w3all_config_avatars['w3all_get_phpbb_avatar_yn']); ?> /> <?php esc_html_e('No', 'wp_w3all_phpbb'); ?></label></p>
<div style="padding:20px 35px;background-color:#fff;border-top:2px solid #869eff;border-bottom:2px solid #869eff">
<div class=""><h3 style="color:#869eff">Activate phpBB avatars on Last Forums Topics widgets</h3>Add avatars for each user on Last Forums Topics widget (add a query more, for each loaded widget on page)</div>
<p><label""><input type="radio" name="w3all_conf_avatars[w3all_avatar_on_last_t_yn]" id="w3all_avatar_on_last_t_1" value="1" <?php checked('1', $w3all_config_avatars['w3all_avatar_on_last_t_yn']); ?> /> <?php esc_html_e('Yes', 'wp_w3all_phpbb'); ?></label></p>
<p><label""><input type="radio" name="w3all_conf_avatars[w3all_avatar_on_last_t_yn]" id="w3all_avatar_on_last_t_0" value="0" <?php checked('0', $w3all_config_avatars['w3all_avatar_on_last_t_yn']); ?> /> <?php esc_html_e('No', 'wp_w3all_phpbb'); ?></label></p>
<hr />
<div class=""><h3>Last Forums Topics Widget avatar's dimension</h3>Set the avatar dimension for Last Forum Topics Widget (Ex: 50).<br />Note: affect only if the above <i style="color:#869eff">Activate phpBB avatars on Last Forums Topics widgets</i> option is set to yes</div>
<p><label""><input id="w3all_lasttopic_avatar_dim" name="w3all_conf_avatars[w3all_lasttopic_avatar_dim]" type="text" size="25" value="<?php echo esc_attr( $w3all_config_avatars['w3all_lasttopic_avatar_dim'] ); ?>"></p>
<hr />
<div class=""><h3>Last Forums Topics number of users's avatars to retrieve</h3><b>Notice</b>: if not set, 10 by default, but this value should be set the same as is the most hight value, of topic's numbers you have choose to display on Last Topics Widgets, for example:<br />if activating different Last Forums Topics widgets, you have choose to display 5 topics in one widget instance, and 10 topics in another, than set 10 as value here.<br />Note: affect only if the above <i style="color:#869eff">Activate phpBB avatars on Last Forums Topics widgets</i> option is set to yes</div>
<p><label""><input id="w3all_lasttopic_avatar_num" name="w3all_conf_avatars[w3all_lasttopic_avatar_num]" type="text" size="25" placeholder="10" value="<?php echo esc_attr( $w3all_config_avatars['w3all_lasttopic_avatar_num'] ); ?>"></p>
</div><!-- close <div style="padding:20px 35px -->
<hr />
<input type="submit" name="submit" id="submit" class="button button-primary" value="<?php esc_attr_e('Save WP_w3all Avatars Options', 'wp_w3all_phpbb');?>">
</form></div>


<div class="wrap" style="margin-top:4.0em;">
<form name="w3all_conf_pref_template_embed" id="w3all-conf-pref-template-embed" action="<?php echo esc_url( $up_conf_w3all_url ); ?>" method="POST">	
<div class=""><h1 style="color:green">WP_w3all phpBB embedded on WordPress Template</h1></div>
<hr style="border-color:gray" />
<div class=""><h4 style="color:#333">Before you activate this option, <b><a href="http://www.axew3.com/w3/2016/02/embed-phpbb-into-wordpress-template-iframe-responsive/" target="_blank">please read this article</a></b><br />it is necessary to edit the phpBB overall_footer.html template file, and to add the "iframeResizer.contentWindow.min.js" file into phpBB root folder.
<br />Note: you can completely ignore this part about using iframe mode and use wp_w3all without embed phpBB template in a WP page.<br />Please remember about widgets login/out and last post: activate this option if you use the iframe mode, deactivate if you are not going to be using the WP_w3all iframe mode, or widget links will points to wrong urls (page name option not affected)</h4></div>
<div class=""><h3>Create or rebuild WordPress forum page template</h3></div>
<p><label""><input id="w3all_forum_template_wppage" name="w3all_conf_pref_template_embed[w3all_forum_template_wppage]" type="text" size="25" value="<?php echo get_option('w3all_forum_template_wppage'); ?>"> Valid names to be used are: <b>board, boards, community, forum, forums</b>. Do not use different terms or <i>page-<b>forum</b>.php</i> will be created by default.<br />
<br />This option set the name of (and create) the page template that will embed the phpBB forum iframe on WordPress.<br />It is required to create a new BLANK page on WordPress (WP admin -> Pages -> Add New), with the same title as set here that will contain the embedded iframe phpBB  forum on WordPress. Ex: if you entered "board" as the value you will need to create a new page in wp named board. Open this page after to see your embedded phpbb forum in WP.<br />To create the template page with a different name, ask how to at <a href="https://wordpress.org/support/plugin/wp-w3all-phpbb-integration" target="_blank">WP w3all phpBB integration WordPress support forum</a> or at <a href="http://www.axew3.com/w3/" target="_blank">axew3.com</a>.
<br /><br />The created template file will be located inside your WordPress <b>wp-content/themes/yourtheme</b> template folder. It can be edited as any other WordPress template page.
<br /><br />The template file name to search for, inside the active theme, template directory, can be: <b>page-forum.php</b> or <b>page-board.php</b>, and so on, depending on how you set the value here.
<br /><br /><b>Warning (for on same domain installations)</b>: if your forum folder is located on a sub-folder on the same WP root, like <b>wordpress/forum</b></i> in this case it is required to choose a different name than <i>forum</i> for the template page to be created here. If not, WordPress will point to the existent <i>forum folder</i> and will return content not found. It is a normal WP behavior.
<br /><br /><b>Warning</b>: Any click on "Create WP_w3all phpBB Page Template" button, will replace the template page with the default content file: the previous created template page will be removed and substituted with the default content file. In case you made modifications to the template page after its his creation, and that you do not want to lose, you should rename or move the template file in some different folder than the theme template folder, before you click on "Create WP_w3all phpBB Page Template" button.</p>
<input type="submit" name="submit" id="submit" class="button button-primary" value="<?php esc_attr_e('Create/Rebuild WP_w3all phpBB Page Template', 'wp_w3all_phpbb');?>">
</form></div>

<div class="wrap" style="margin-top:4.0em;">
<form name="w3all_conf_pref_template_embed_link" id="w3all-conf-pref-template-embed-link" action="<?php echo esc_url( $up_conf_w3all_url ); ?>" method="POST">	
<div class=""><h3>Last Topics and Login widgets links for embedded phpBB iframe into WordPress</h3></div>
Changes the links for wp_w3all Last Topics Post and wp_w3all Login widgets to embedded page:<br />if set to Yes, it changes the links on <i>Last Topics Posts Widget and Login/out links</i> that will point to the created WP page that contain the embedded phpBB forum iframe, if set the No it will link to the real phpbb URL/folder.
<p><label""><input type="radio" name="w3all_conf_pref_template_embed_link[w3all_iframe_phpbb_link_yn]" id="w3all_iframe_phpbb_link_1" value="1" <?php checked('1', get_option('w3all_iframe_phpbb_link_yn')); ?> /> <?php esc_html_e('Yes', 'wp_w3all_phpbb'); ?></label></p>
<p><label""><input type="radio" name="w3all_conf_pref_template_embed_link[w3all_iframe_phpbb_link_yn]" id="w3all_iframe_phpbb_link_0" value="0" <?php checked('0', get_option('w3all_iframe_phpbb_link_yn')); ?> /> <?php esc_html_e('No', 'wp_w3all_phpbb'); ?></label></p>
<input type="submit" name="submit" id="submit" class="button button-primary" value="<?php esc_attr_e('Save Last Topics and Login/Out widgets links for Embedded Template', 'wp_w3all_phpbb');?>">
</form><br /><hr style="border-color:gray" /></div>