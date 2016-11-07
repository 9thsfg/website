<?php
class WP_w3all_admin {

public static function wp_w3all_init() {

	add_action( 'admin_menu', array( 'WP_w3all_admin', 'wp_w3all_menu' ) );
  self::get_form_set_update();

}

public static function wp_w3all_menu() {
	
	$wp_w3all_transfer_phpbb = get_option( 'w3all_transfer_phpbb_yn' );
	
	add_options_page( 'w3all Options', 'WP w3all', 'manage_options', 'wp-w3all-options', array( 'WP_w3all_admin', 'wp_w3all_options' ) );
  if ( $wp_w3all_transfer_phpbb == 1 ) {
     add_options_page( 'w3all WP users to phpBB', 'WP w3all transfer', 'manage_options', 'wp-w3all-users-to-phpbb', array( 'WP_w3all_admin', 'wp_w3all_users_to_phpbb' ) );
   }
}

public static function wp_w3all_users_to_phpbb() {

	 if ( !current_user_can( 'manage_options' ) )  {
		 wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	 }
	 
    $name = 'wp_w3all_users_to_phpbb';
		$file = WPW3ALL_PLUGIN_DIR . 'views/'. $name . '.php';
		
		 include( $file );
		 
 }


public static function wp_w3all_options() {

	 if ( !current_user_can( 'manage_options' ) )  {
		 wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	 }

    $name = 'config';
		$file = WPW3ALL_PLUGIN_DIR . 'views/'. $name . '.php';
		
		 include( $file );
		 
 }

public static function get_form_set_update() {

  if ( isset($_POST['w3all_conf']) ){
  	
  	    	if ( empty ( $_POST["w3all_conf"]["w3all_path_to_cms"] ) ){
    		$_POST["w3all_conf"]["w3all_path_to_cms"] = 'path-to-phpbb-config-file-here';
    	}
     	
    	 	if (isset( $_POST["w3all_conf"]["w3all_path_to_cms"] ) ){
    	
          $_POST["w3all_conf"]["w3all_path_to_cms"] = stripslashes($_POST["w3all_conf"]["w3all_path_to_cms"]);
    	}
    	
    	
    	 $w3all_conf = $_POST['w3all_conf'];
       $data_update = $w3all_conf;
   
    } elseif ( isset($_POST['w3all_conf_pref']) ){
    	 	$w3all_conf_pref = $_POST['w3all_conf_pref'];
    	  $data_update = $w3all_conf_pref;
    	}
    	 	
       	/*elseif ( isset($_POST['w3all_conf_pref_phpbb_config']) ){
    	 	
    	  $_POST["w3all_conf_pref_phpbb_config"]["w3all_phpbb_dbms"] = stripslashes($_POST["w3all_conf_pref_phpbb_config"]["w3all_phpbb_dbms"]);
        $_POST["w3all_conf_pref_phpbb_config"]["w3all_phpbb_adm_relative_path"] = stripslashes($_POST["w3all_conf_pref_phpbb_config"]["w3all_phpbb_adm_relative_path"]);
        $_POST["w3all_conf_pref_phpbb_config"]["w3all_phpbb_acm_type"] = stripslashes($_POST["w3all_conf_pref_phpbb_config"]["w3all_phpbb_acm_type"]);
 
    	 	$w3all_conf_pref_phpbb_config = $_POST['w3all_conf_pref_phpbb_config'];
    
    	  $w3all_conf_pref_phpbb_config = serialize($w3all_conf_pref_phpbb_config);
    	 	  
         $data_update = array('w3all_conf_pref_phpbb_config' => $w3all_conf_pref_phpbb_config);
    	 }*/

   	 	elseif ( isset($_POST['w3all_conf_avatars']) ){
    	   	$w3all_conf_avatars = $_POST['w3all_conf_avatars'];
    	   	$w3all_conf_avatars = serialize($w3all_conf_avatars);
    	   	$data_update = array('w3all_conf_avatars' => $w3all_conf_avatars);
    	  }
       	elseif ( isset($_POST['w3all_conf_add_users_to_phpbb']) ){
    	   	$w3all_conf_add_users_to_phpbb = $_POST['w3all_conf_add_users_to_phpbb'];
    	    $data_update = $w3all_conf_add_users_to_phpbb;
    	  }
    	   elseif ( isset($_POST['w3all_conf_pref_template_embed']) ){
    	   	$_POST["w3all_conf_pref_template_embed"]["w3all_forum_template_wppage"] =	trim($_POST["w3all_conf_pref_template_embed"]["w3all_forum_template_wppage"]);
    	 	  	$w3all_conf_pref_template_embed = $_POST['w3all_conf_pref_template_embed'];
    	      $data_update = $w3all_conf_pref_template_embed;
    	   }
    	   elseif ( isset($_POST['w3all_conf_pref_template_embed_link']) ){
      	  	$w3all_conf_pref_template_embed_link = $_POST['w3all_conf_pref_template_embed_link'];
    	      $data_update = $w3all_conf_pref_template_embed_link;
    	   }
     
     else { return; }
     
     while (list($option_name, $val) = each($data_update)) {
     
            update_option( $option_name, $val );
      }
    

}

public static function clean_up_on_plugin_off(){
	
	
	unregister_widget( 'WP_w3all_widget_login' );
	unregister_widget( 'WP_w3all_widget_last_topics' );
	
	// clean up w3all db rows
	delete_option( 'w3all_conf_avatars' );
	delete_option( 'w3all_phpbb_user_deactivated_yn' );
	delete_option( 'widget_wp_w3all_widget_login' );
	delete_option( 'widget_wp_w3all_widget_last_topics' );
	delete_option( 'w3all_path_to_cms' );
	delete_option( 'w3all_url_to_cms' );
  delete_option( 'w3all_iframe_phpbb_link_yn' );
	delete_option( 'w3all_forum_template_wppage' );
	delete_option( 'w3all_exclude_phpbb_forums' );
	delete_option( 'w3all_transfer_phpbb_yn' );
	
}




}
?>