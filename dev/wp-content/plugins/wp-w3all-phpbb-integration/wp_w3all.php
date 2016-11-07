<?php
/**
 * @package wp_w3all
 */
/*
Plugin Name: WordPress w3all phpBB integration
Plugin URI: http://axew3.com/w3
Description: Integration plugin between WordPress and phpBB. It provide free integration - users transfer/login/register. Easy, light, secure, powerful. 
Version: 1.5.3
Author: axew3
Author URI: http://www.axew3.com/w3
License: GPLv2 or later
Text Domain: wp_w3all_phpbb

=====================================================================================
Copyright (C) 2016 axew3.com
=====================================================================================
*/

// Security
defined( 'ABSPATH' ) or die( 'No script kiddies please!' );
if ( !function_exists( 'add_action' ) ) {
	echo 'Hi there!  I\'m just a plugin, not much I can do when called directly.';
	exit;
}

define( 'WPW3ALL_VERSION', '1.5.3' );
define( 'WPW3ALL_MINIMUM_WP_VERSION', '4.0' );
define( 'WPW3ALL_PLUGIN_URL', plugin_dir_url( __FILE__ ) );
define( 'WPW3ALL_PLUGIN_DIR', plugin_dir_path( __FILE__ ) );

  $w3cookie_domain = ($_SERVER['HTTP_HOST'] != 'localhost') ? $_SERVER['HTTP_HOST'] : false;
  $w3cookie_domain = preg_replace('/^[^\.]*\.([^\.]*)\.(.*)$/', '\1.\2', $w3cookie_domain);
  $useragent = (!empty($_SERVER['HTTP_USER_AGENT'])) ? $_SERVER['HTTP_USER_AGENT'] : 'unknown';
  
  $config_avatars = get_option( 'w3all_conf_avatars' );
  $w3all_config_avatars = unserialize($config_avatars);
  $w3all_get_phpbb_avatar_yn = $w3all_config_avatars['w3all_get_phpbb_avatar_yn'];
  $w3all_last_t_avatar_yn = $w3all_config_avatars['w3all_avatar_on_last_t_yn'];
  $w3all_last_t_avatar_dim = $w3all_config_avatars['w3all_lasttopic_avatar_dim'];
  $w3all_lasttopic_avatar_num = $w3all_config_avatars['w3all_lasttopic_avatar_num'];
  
if ( defined( 'WP_ADMIN' ) ) { 

	 if ( isset( $_POST["w3all_conf"]["w3all_url_to_cms"]) ){
      	
    	$_POST["w3all_conf"]["w3all_url_to_cms"] = utf8_encode ($_POST["w3all_conf"]["w3all_url_to_cms"]);
    	$_POST["w3all_conf"]["w3all_url_to_cms"] = trim($_POST["w3all_conf"]["w3all_url_to_cms"]);
    
     if ( preg_match('/[^-a-zA-Z0-9\/\\\._~:]+/', $_POST["w3all_conf"]["w3all_url_to_cms"]) ){
	    	echo "<h2 style=\"text-align:center;color:#ff0000\">WARNING! <span style=\"color:#000\">unwanted chars detected as phpBB URL value</span></h2>";
        $_POST["w3all_conf"]["w3all_url_to_cms"] = "Set correct URL to phpBB";
	    }
    	
    }
     
      if ( isset( $_POST["w3all_conf"]["w3all_path_to_cms"]) ){
      	
    	$_POST["w3all_conf"]["w3all_path_to_cms"] = utf8_encode ($_POST["w3all_conf"]["w3all_path_to_cms"]);
    	$_POST["w3all_conf"]["w3all_path_to_cms"] = trim($_POST["w3all_conf"]["w3all_path_to_cms"]);
     
     if ( preg_match('/[^-a-zA-Z0-9\/\\\._~:]+/', $_POST["w3all_conf"]["w3all_path_to_cms"]) ){
	    	echo "<h2 style=\"text-align:center;color:#ff0000\">WARNING! <span style=\"color:#000\">unwanted chars detected as phpBB path value</span></h2>";
        $_POST["w3all_conf"]["w3all_path_to_cms"] = "Set correct full absolute path to phpBB";
	    }
	    
    	$config_file = $_POST["w3all_conf"]["w3all_path_to_cms"] . '/config.php';  
    ob_start();
		 include( $config_file );
    ob_end_clean(); 
   }  else  {
   	          	// or will search for some config file elsewhere instead
                	$w3all_path_to_cms = get_option( 'w3all_path_to_cms' );
	                if(!empty($w3all_path_to_cms)){ 
                   $config_file = get_option( 'w3all_path_to_cms' ) . '/config.php';
                     	ob_start();
		                   include( $config_file );
                      ob_end_clean(); 
                 }
            }
    
 if ( defined('PHPBB_INSTALLED') ){
    
  if ( defined('WP_W3ALL_MANUAL_CONFIG') ){
  	
  	        $w3all_config = array(
                  'dbms'     => $w3all_dbms,
                  'dbhost'   => $w3all_dbhost,
                  'dbport'   => $w3all_dbport,
                  'dbname'   => $w3all_dbname,
                  'dbuser'   => $w3all_dbuser,
                  'dbpasswd' => $w3all_dbpasswd,
                  'table_prefix' => $w3all_table_prefix,
                  'acm_type' => $w3all_acm_type 
                  );
      	
  } else { // to be romoved on next versions
      
        $w3all_config = array(
                  'dbms'     => $dbms,
                  'dbhost'   => $dbhost,
                  'dbport'   => $dbport,
                  'dbname'   => $dbname,
                  'dbuser'   => $dbuser,
                  'dbpasswd' => $dbpasswd,
                  'table_prefix' => $table_prefix,
                  'acm_type' => $acm_type 
                  );
            }      
     }
    
    
		  require_once( WPW3ALL_PLUGIN_DIR . 'class.wp.w3all-admin.php' );
		  require_once( WPW3ALL_PLUGIN_DIR . 'class.wp.w3all.widgets-phpbb.php' );	
	  	add_action( 'init', array( 'WP_w3all_admin', 'wp_w3all_init' ) );

 if ( defined('PHPBB_INSTALLED') ){

	   require_once( WPW3ALL_PLUGIN_DIR . 'class.wp.w3all-phpbb.php' ); 
	    
      add_action( 'init', array( 'WP_w3all_phpbb', 'wp_w3all_phpbb_config_init' ) );
	    add_action( 'init', array( 'WP_w3all_phpbb', 'wp_w3all_phpbb_conn_init' ) );

// for the user profile update, when profile changes done by user on phpBB and go directly to visit his profile on WP
	   require_once( WPW3ALL_PLUGIN_DIR . 'class.wp.w3all-phpbb.php' );
     add_action( 'init', array( 'WP_w3all_phpbb', 'wp_w3all_phpbb_init' ) );


    function wp_w3all_phpbb_registration_save( $user_id ) {

      $wpu  = get_user_by('id', $user_id);
      
       $wp_w3_ck_phpbb_ue_exist = WP_w3all_phpbb::phpBB_user_check($wpu->user_login, $wpu->user_email, 1);
 
         if($wp_w3_ck_phpbb_ue_exist === true){
         	
           wp_delete_user( $user_id ); // remove WP user just created, username or email exist on phpBB
          
           temp_wp_w3_error_on_update();
           exit;  // REVIEW // REVIEW // add_action( 'admin_notices', 
        
         }
         
       if(!$wp_w3_ck_phpbb_ue_exist){
         $phpBB_user_add = WP_w3all_phpbb::create_phpBB_user_res($wpu);
         define('W3ALLPHPBBUADDED',true);
       }
 }

// review this
function wp_w3all_up_phpbb_prof($user_id, $old_user_data) {

   $phpBB_upp = WP_w3all_phpbb::phpbb_update_profile($user_id, $old_user_data);
   
     if($phpBB_upp === true){
     	// REVIEW TO BE CHANGED: PAGE ADMIN WITH WP ERRORS SHOULD RETURN instead
      temp_wp_w3_error_on_update();
      exit;
 
    }
   }
   

   
   // stuff about profile changes WP to phpBB
 add_action( 'profile_update', 'wp_w3all_up_phpbb_prof', 10, 2 );
 add_action( 'user_register', 'wp_w3all_phpbb_registration_save', 10, 1 );
 add_action( 'delete_user', array( 'WP_w3all_phpbb', 'wp_w3all_phpbb_delete_user' ) ); // todo // just deactivated on phpBB, when deleted in WP

 } // if defined phpbb installed end


	//register_activation_hook( __FILE__, array( 'WP_w3all_admin', '' ) );
    register_uninstall_hook( __FILE__, array( 'WP_w3all_admin', 'clean_up_on_plugin_off' ) );

} else { // not in admin
	
	// or will search for some config file elsewhere instead
	$w3all_path_to_cms = get_option( 'w3all_path_to_cms' );
	if(!empty($w3all_path_to_cms)){ 
   $config_file = get_option( 'w3all_path_to_cms' ) . '/config.php';
    ob_start();
		 include( $config_file );
    ob_end_clean();       
   }
    
  if ( defined('PHPBB_INSTALLED') ){ 

  if ( defined('WP_W3ALL_MANUAL_CONFIG') ){
  	
  	        $w3all_config = array(
                  'dbms'     => $w3all_dbms,
                  'dbhost'   => $w3all_dbhost,
                  'dbport'   => $w3all_dbport,
                  'dbname'   => $w3all_dbname,
                  'dbuser'   => $w3all_dbuser,
                  'dbpasswd' => $w3all_dbpasswd,
                  'table_prefix' => $w3all_table_prefix,
                  'acm_type' => $w3all_acm_type 
                  );
      	
  } else { // to be romoved on next versions

  $w3all_config = array(
                  'dbms'=> $dbms,
                  'dbhost'   => $dbhost,
                  'dbport'   => $dbport,
                  'dbname'   => $dbname,
                  'dbuser'   => $dbuser,
                  'dbpasswd' => $dbpasswd,
                  'table_prefix' => $table_prefix,
                  'acm_type' => $acm_type 
                  );
	
   }

	   require_once( WPW3ALL_PLUGIN_DIR . 'class.wp.w3all-phpbb.php' ); 
     require_once( WPW3ALL_PLUGIN_DIR . 'class.wp.w3all.widgets-phpbb.php' );
     add_action( 'init', array( 'WP_w3all_phpbb', 'wp_w3all_phpbb_init'));

//// workaround for some plugin that substitute wp-login.php default login page
//// it is not strictly required, but used by default for compatibilities with some external plugin

 require_once( WPW3ALL_PLUGIN_DIR . 'addons/ext_plugins_fixes.php' );
  
//// END workaround for some plugin that substitute wp-login.php default login page


	  // let user login with his phpBB username and add him as is
	  function w3_sanitize_user($user, $raw_user, $strict = false) {
      $user = $raw_user;
      return $user;
     }
     
      add_filter('sanitize_user', 'w3_sanitize_user', 10, 3);
      
	  function wp_w3all_check_fields( $errors, $sanitized_user_login, $user_email ) {
      
      global $wpdb;
      
     $test = WP_w3all_phpbb::phpBB_user_check2($errors, $sanitized_user_login, $user_email);
           
      if($test === true){
     	// REVIEW TO BE CHANGED: PAGE ADMIN WITH WP ERRORS SHOULD RETURN INSTEAD

        temp_wp_w3_error_on_update();
         exit;
      	
      }
      
      return $errors;

   }

     add_filter( 'registration_errors', 'wp_w3all_check_fields', 10, 3 );
	  
     add_action( 'user_register', 'wp_w3all_phpbb_registration_save2', 10, 1 );

     add_action( 'after_password_reset', 'wp_w3all_wp_after_password_reset', 10, 2 ); 
     

  function wp_w3all_wp_after_password_reset($user, $new_pass) {
 
     $phpBB_user_activate = WP_w3all_phpbb::wp_w3all_wp_after_pass_reset($user); 
   }
   

function wp_w3all_phpbb_registration_save2( $user_id ) {

     $wpu = get_user_by('ID', $user_id);
     
           $wp_w3_ck_phpbb_ue_exist = WP_w3all_phpbb::phpBB_user_check($wpu->user_login, $wpu->user_email, 0);

         if($wp_w3_ck_phpbb_ue_exist === true){

   if (function_exists('wp_delete_user')) {
   
      wp_delete_user( $user_id ); // remove WP user if just created, username or email exist on phpBB

          temp_wp_w3_error_on_update();
          exit;  // REVIEW // REVIEW // 
         }  
        }
        
     if( !$wp_w3_ck_phpbb_ue_exist && !defined("W3ALLPHPBBUADDED") ){
          $phpBB_user_add = WP_w3all_phpbb::create_phpBB_user_res($wpu);
        }


}


// and old phpBB user without login into phpBB, come to WP login first time 
add_action( 'wp_authenticate', array( 'WP_w3all_phpbb', 'w3_check_phpbb_profile_wpnu' ),10,1);  
 
  // do logout stuff for phpBB
 add_action( 'wp_logout', array( 'WP_w3all_phpbb', 'wp_w3all_phpbb_logout' ) );

  
  function wp_w3all_phpbb_login($user_login, $user) {
 
     $phpBB_user_session_set = WP_w3all_phpbb::phpBB_user_session_set_res($user); 
   }
   
  if (!isset($w3all_on_ext_login)) {
   add_action('wp_login', 'wp_w3all_phpbb_login', 10, 1);
  }
           
  function wp_w3all_update_phpbb_pass($user, $new_pass) {
    	
     $phpBB_user_pass_set = WP_w3all_phpbb::phpbb_pass_update_res($user, $new_pass); 
   }
   
   
  add_action( 'after_password_reset', 'wp_w3all_update_phpbb_pass', 10, 2 ); 
  
  
   function wp_w3all_up_wp_prof_on_phpbb($user_id, $old_user_data) {
    	
     $phpBB_user_up_prof_on_wp_prof_up = WP_w3all_phpbb::phpbb_update_profile($user_id, $old_user_data); 
     
             if($phpBB_user_up_prof_on_wp_prof_up === true){
         
        temp_wp_w3_error_on_update();
        exit;
      }
   }

  add_action( 'profile_update', 'wp_w3all_up_wp_prof_on_phpbb', 10, 2 ); 
  
  $phpbb_on_template_iframe = get_option( 'w3all_iframe_phpbb_link_yn' );
  $wp_w3all_forum_folder_wp = get_option( 'w3all_forum_template_wppage' ); // remove from iframe mode links on last topics than
  $w3all_url_to_cms         = get_option( 'w3all_url_to_cms' );

 // this affect the lost password url on WP
// comment out the follow 'add_filter' line to set lost password link point to phpbb lost password page
//add_filter( 'lostpassword_url', 'phpbb_reset_pass_url', 10, 2 ); 

// this affect the register url on WP
// comment out the follow 'add_filter' line to set register link point to phpbb register
//add_filter( 'register_url', 'phpbb_register_url' ); 

  
  function phpbb_reset_pass_url( $lostpassword_url, $redirect ) {
   	
   	global $w3all_url_to_cms, $phpbb_on_template_iframe, $wp_w3all_forum_folder_wp;
   	
    if( $phpbb_on_template_iframe == 1 ){ // lost pass phpBB link iframe mode
    	
   	    $wp_w3all_forum_folder_wp = "index.php/" . $wp_w3all_forum_folder_wp;
   	   	$redirect = $wp_w3all_forum_folder_wp . '/?mode=sendpassword';
   	   return $redirect;
   	   	 
      } else { // lost pass no iframe
    	
   	           $redirect = $w3all_url_to_cms . '/ucp.php?mode=sendpassword';
               return $redirect;
             }
   }
   

    
     function phpbb_register_url( $register_url ) {
   	   	global $w3all_url_to_cms, $phpbb_on_template_iframe, $wp_w3all_forum_folder_wp;
   	
       if( $phpbb_on_template_iframe == 1 ){ 
    	
   	       $wp_w3all_forum_folder_wp = "index.php/" . $wp_w3all_forum_folder_wp;
   	     	 $redirect = $wp_w3all_forum_folder_wp . '/?mode=register';
   	      return $redirect;
   	   	 
         } else { // register no iframe, direct link to phpBB
    	
   	             $redirect = $w3all_url_to_cms . '/ucp.php?mode=register';
                 return $redirect;
               }

      }
   
   
   }
} // end not in admin

  if ( defined('PHPBB_INSTALLED') ){ 
  	
 function temp_wp_w3_error_on_update(){
     	
     		$class = 'notice notice-error';
	      $message = __( '<h3>Error: username or email already exist</h3> The username or/and email address provided already exist, or result associated, to another existent user account on our forum database.<br /><h4><a href="'.get_edit_user_link().'">Please return back</a><h4>', 'wp_w3all_phpbb' );

        printf( '<div class="%1$s"><p>%2$s</p></div>', $class, $message );
    
     }
    

 if ( ! function_exists( 'wp_hash_password' ) ) :

function wp_hash_password( $password ) {
	 
	 $pass = WP_w3all_phpbb::phpBB_password_hash($password);
	
	 return $pass;

}

endif;

 if ( ! function_exists( 'wp_check_password' ) ) :

function wp_check_password($password, $hash, $user_id = '') {
   global $wp_hasher;

   if( $user_id < 1 ){ return; }
 
    $is_phpbb_admin = ( $user_id == 1 ) ? 1 : 0; // switch for phpBB admin // 1 admin 0 all others
    
    $wpu = get_user_by( 'ID', $user_id );
 
   $changed = WP_w3all_phpbb::check_phpbb_passw_match_on_wp_auth($wpu->user_login, $is_phpbb_admin);

	 if ( $changed !== false ){ 
	 	
      $hash = $changed;
    }
	 	 
	 // If the hash is still md5...
    if ( strlen($hash) <= 32 ) {
        $check = hash_equals( $hash, md5( $password ) );
        if ( $check && $user_id ) {
            // Rehash using new hash.
            wp_set_password($password, $user_id);
            $hash = wp_hash_password($password);
        }
     }
     
	// new style phpass portable hash.
	if ( empty($wp_hasher) ) {
		require_once( ABSPATH . WPINC . '/class-phpass.php');
		// By default, use the portable hash from phpass
		$wp_hasher = new PasswordHash(8, true);
	}
	
     $check = $wp_hasher->CheckPassword($password, $hash);
 
	   return apply_filters( 'check_password', $check, $password, $hash, $user_id );

}

endif;


function wp_w3all_remove_bbcode_tags($post_str, $words){

 $post_string = preg_replace('/[[\/\!]*?[^\[\]]*?]/', '', $post_str);
 
 $post_string = strip_tags($post_string);
 
 $post_s = $post_string;
  
 $post_string = explode(' ',$post_string);

  if( count($post_string) < $words ) : return $post_s; endif;

 $post_std = ''; $i = 0; $b = $words;
 
  foreach ($post_string as $post_st) {
	
	  $i++;
	  if( $i < $b + 1 ){ // offset of 1

      $post_std .= $post_st . ' ';
    }
  }

 //$post_std = $post_std . ' ...'; // if should be a link to the post, do it on phpbb_last_topics

return $post_std;

}

} // END   if ( defined('PHPBB_INSTALLED') ){ // 2nd not in admin

?>