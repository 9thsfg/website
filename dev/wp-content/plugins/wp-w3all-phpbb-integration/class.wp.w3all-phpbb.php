<?php
class WP_w3all_phpbb {
	
// lost on the way

 // protected $config = '';
 // protected $w3db_conn = '';
 // protected $phpbb_config = '';
 // protected $phpbb_user_session = '';
  
public static function wp_w3all_phpbb_init() {
	
	global $w3all_get_phpbb_avatar_yn;
	
      self::verify_phpbb_credentials();
      	
      	if ( $w3all_get_phpbb_avatar_yn == 1 ): 
      	self::init_w3all_avatars(); 
      	endif;

	}
	
private static function w3all_wp_logout(){

	   		global $w3all_config,$w3cookie_domain,$useragent;
	  	$phpbb_config = self::get_phpbb_config();
	  	$phpbb_config_file = $w3all_config;
	  	$w3phpbb_conn = self::w3all_db_connect();
	    $user = wp_get_current_user();
	     	
        $k   = $phpbb_config["cookie_name"].'_k';
        $sid = $phpbb_config["cookie_name"].'_sid';
        $u   = $phpbb_config["cookie_name"].'_u';
        
        
        if ( preg_match('/[^0-9A-Za-z]/',$_COOKIE[$k]) OR preg_match('/[^0-9A-Za-z]/',$_COOKIE[$sid]) OR preg_match('/[^0-9]/',$_COOKIE[$u]) ){
 	           	 die( "Please clean up bad cookies on your browser." );
 	            }     
 	
   $k_md5 = md5($_COOKIE[$k]);
 	 $u_id = $_COOKIE[$u];
 	 $s_id = $_COOKIE[$sid];
 	 
 	//$w3phpbb_conn->query("DELETE ".$phpbb_config_file["table_prefix"]."sessions, ".$phpbb_config_file["table_prefix"]."sessions_keys FROM ".$phpbb_config_file["table_prefix"]."sessions INNER JOIN ".$phpbb_config_file["table_prefix"]."sessions_keys WHERE ".$phpbb_config_file["table_prefix"]."sessions.session_id = '".$_COOKIE["$sid"]."' AND ".$phpbb_config_file["table_prefix"]."sessions.session_user_id = '".$_COOKIE["$u"]."' AND ".$phpbb_config_file["table_prefix"]."sessions_keys.user_id = '".$_COOKIE["$u"]."' AND ".$phpbb_config_file["table_prefix"]."sessions_keys.key_id = '".md5($_COOKIE["$k"])."'");
   $w3phpbb_conn->query("DELETE FROM ".$phpbb_config_file["table_prefix"]."sessions WHERE session_id = '$s_id' AND session_user_id = '$u_id' OR session_user_id = '$u_id' AND session_browser = '$useragent'");
   $w3phpbb_conn->query("DELETE FROM ".$phpbb_config_file["table_prefix"]."sessions_keys WHERE key_id = '$k_md5' AND user_id = '$u_id'");
  
   	// remove phpBB cookies 

 	    setcookie ("$k", "", time() - 3600, "/");
 	    setcookie ("$sid", "", time() - 3600, "/"); 
 	    setcookie ("$u", "", time() - 3600, "/"); 
 	    setcookie ("$k", "", time() - 3600, "/", "$w3cookie_domain");
 	    setcookie ("$sid", "", time() - 3600, "/", "$w3cookie_domain"); 
 	    setcookie ("$u", "", time() - 3600, "/", "$w3cookie_domain"); 

	wp_logout();
	
	unset($_REQUEST,$_POST,$_GET);
  
  wp_redirect( home_url() ); exit;
  
 }


private static function w3all_db_connect(){

 global $w3all_config;
 
	  $w3db_conn = new wpdb($w3all_config["dbuser"], $w3all_config["dbpasswd"], $w3all_config["dbname"], $w3all_config["dbhost"]);
	return  $w3db_conn;
}



private static function get_phpbb_config(){
	
	   global $w3all_config;
    $config = $w3all_config;
    $w3db_conn = self::w3all_db_connect();

   $a = $w3db_conn->get_results("SELECT * FROM ". $config["table_prefix"] ."config WHERE config_name IN('allow_autologin','avatar_gallery_path','avatar_path','avatar_salt','cookie_domain','cookie_name', 'max_autologin_time', 'rand_seed', 'rand_seed_last_update', 'script_path','session_length') ORDER BY config_name ASC");

      // Order is alphabetical 
      $res = array( 'allow_autologin' => $a[0]->config_value,
                    'avatar_gallery_path'     => $a[1]->config_value,
                    'avatar_path'     => $a[2]->config_value,
                    'avatar_salt'     => $a[3]->config_value,
                    'cookie_domain'   => $a[4]->config_value,
                    'cookie_name'     => $a[5]->config_value,
                    'max_autologin_time'      => $a[6]->config_value,
                    'rand_seed'               => $a[7]->config_value,
                    'rand_seed_last_update'   => $a[8]->config_value,
                    'script_path'     => $a[9]->config_value,
                    'session_length'  => $a[10]->config_value
                  );

   return $res;
   
 }


private static function verify_phpbb_credentials(){
	
           global $w3all_config, $wpdb, $w3all_ext_login_yn, $useragent, $w3cookie_domain;
           $config = $w3all_config;
        	 $phpbb_config = self::get_phpbb_config();
        	 $w3db_conn = self::w3all_db_connect();


        	  $k   = $phpbb_config["cookie_name"].'_k';
            $sid = $phpbb_config["cookie_name"].'_sid';
            $u   = $phpbb_config["cookie_name"].'_u';
   		  	       
   		  if ( is_user_logged_in() && $_COOKIE[$u] < 2 ) {
   		  	 
   		          self::w3all_wp_logout();
              }
      
          // HERE INSIDE WE ARE SECURE //
 
         $_COOKIE[$u] = (isset($_COOKIE[$u])) ? $_COOKIE[$u] : ''; 
         
 	     if ( $_COOKIE[$u] > 1 ){ // phpBB: uid 1 guest, uid 2 default install admin
 	      
 	        if ( !isset($_COOKIE[$k]) ){ $_COOKIE[$k] = ''; }
 	        	
 	           if ( preg_match('/[^0-9A-Za-z]/',$_COOKIE[$k]) OR preg_match('/[^0-9A-Za-z]/',$_COOKIE[$sid]) OR preg_match('/[^0-9]/',$_COOKIE[$u]) ){
 	           	
                die( "Clean up cookie on your browser please." );
 	            }
 	            
 	           $phpbb_k   = $_COOKIE[$k];
 	           $phpbb_sid = $_COOKIE[$sid];
 	           $phpbb_u   = $_COOKIE[$u];

 	         // group id:  1=anonimous; 5=admin; 6=bots; 
         	 // user_type: 1=not active accounts:banned,confirmation email,deactivated (and i presume coppa?)
         	 
         	 // remove AND u.group_id != '1' to check user after instead, deactivating before also in WP the user and logging him out so in WP
         	 // or on WP user never checked/updated about deactivation, as here, a deactivated user on phpBB, never return
         	 
 	    if ( empty( $phpbb_k ) ){ // it is not a remember login
 	 
  	 	$phpbb_user_session = $w3db_conn->get_results("SELECT *  
                                              FROM ". $config["table_prefix"] ."users  
                                               JOIN ". $config["table_prefix"] ."sessions ON ". $config["table_prefix"] ."sessions.session_id =  '".$phpbb_sid."'   
                                                AND ". $config["table_prefix"] ."sessions.session_user_id = ". $config["table_prefix"] ."users.user_id 
                                                AND ". $config["table_prefix"] ."sessions.session_user_id = '".$phpbb_u."' 
                                                AND ". $config["table_prefix"] ."sessions.session_browser = '".$useragent."' 
                                               JOIN ". $config["table_prefix"] ."groups ON ". $config["table_prefix"] ."groups.group_id = ". $config["table_prefix"] ."users.group_id 
                                              LEFT JOIN ". $config["table_prefix"] ."profile_fields_data ON ". $config["table_prefix"] ."profile_fields_data.user_id = ". $config["table_prefix"] ."sessions.session_user_id");
        
       } else { // remember me auto login
       	
       	       	 	 	$phpbb_user_session = $w3db_conn->get_results("SELECT *  
                                               FROM ". $config["table_prefix"] ."users  
                                                JOIN ". $config["table_prefix"] ."sessions_keys ON ". $config["table_prefix"] ."sessions_keys.key_id = '".md5($phpbb_k)."' 
                                                 AND ". $config["table_prefix"] ."users.user_id = ". $config["table_prefix"] ."sessions_keys.user_id 
                                                  LEFT JOIN ". $config["table_prefix"] ."sessions ON ". $config["table_prefix"] ."sessions.session_user_id = ". $config["table_prefix"] ."sessions_keys.user_id 
                                                 AND ". $config["table_prefix"] ."sessions.session_browser = '".$useragent."' 
                                                LEFT JOIN ". $config["table_prefix"] ."groups ON ". $config["table_prefix"] ."groups.group_id = ". $config["table_prefix"] ."users.group_id 
                                               LEFT JOIN ". $config["table_prefix"] ."profile_fields_data ON ". $config["table_prefix"] ."profile_fields_data.user_id = ". $config["table_prefix"] ."sessions_keys.user_id ");        
                
               }

                if ( $phpbb_user_session[0]->user_type == 1 ){ // is this user deactivated/banned in phpBB? / logout/and deactivate in WP
                   
                     $user = get_user_by( 'login', $phpbb_user_session[0]->username );
                     $wpu_db_utab = $wpdb->prefix . 'usermeta';
	                   $wpdb->query("UPDATE $wpu_db_utab SET meta_value = 'a:0:{}' WHERE user_id = '$user->ID' AND meta_key = 'wp_capabilities'");
	                
                  self::w3all_wp_logout();
               }     
               
    // if no session at this point, it is not a valid user to be add or login
   if ( empty( $phpbb_user_session ) OR $phpbb_user_session == 0 ) {

   	    self::w3all_wp_logout();
   	  
   	}                      

 if ( !empty( $phpbb_user_session ) ){
  $phpbb_user_session[0]->user_id = (!empty($phpbb_user_session[0]->user_id)) ? $phpbb_user_session[0]->user_id : $phpbb_user_session[0]->session_user_id;
}
 
  	if ( is_user_logged_in() ) {
  
   		$current_user = wp_get_current_user();
   		
   		if (  ( time() - $phpbb_config["session_length"] ) > $phpbb_user_session[0]->session_time && empty( $phpbb_k ) ){

            self::w3all_wp_logout();  

 	     	} else { // update

                // NOTE phpbb_update_profile do the update of same fields so if code changes are done here
                // we need to look also the phpbb_update_profile method and add same things on it

   			 	           $w3db_conn->query("UPDATE ". $config["table_prefix"] ."sessions SET session_time = '".time()."' WHERE session_id = '$phpbb_sid' OR session_browser = '".$useragent ."' AND session_user_id = '".$phpbb_user_session[0]->user_id."'");

                  		// check for users profile fields here here and return for wp-admin and uppdate, for external plugins
                  	  // check that email, password and site url match on both for this user // add any other profile field to be updated here

            if( isset($_GET['updated']) && $_GET['updated'] == 1 ){ // on wp update
            	
           	  self::phpbb_update_profile($current_user->ID, $current_user);
            	
            } 
            
                      // WP $current_user at this point (only onlogin load) DO NOT contain all data fields
                  	  // $current_user->user_pass for example is empty at this point onlogin
                  	  // so this update is done any time user login wp, almost one time

              	  // check for match between wp and phpbb profile fields. If some profile field still not exist on phpBB at this point for this user
              	  // we pass the existent/related wp profile field value, if exist: so it will be updated as is and after added on phpBB also

        // if( isset($_GET['updated']) && $_GET['updated'] != 1  OR is_user_logged_in() ){ 
              $phpbb_user_session[0]->pf_phpbb_website = (!empty($phpbb_user_session[0]->pf_phpbb_website)) ? $phpbb_user_session[0]->pf_phpbb_website : $current_user->user_url;

   	         if( $phpbb_user_session[0]->user_password != $current_user->user_pass OR $phpbb_user_session[0]->user_email != $current_user->user_email OR $phpbb_user_session[0]->pf_phpbb_website != $current_user->user_url )
   	         {
   	         	//	self::phpbb_update_profile($current_user->ID, $current_user);
                $wpu_db_utab = $wpdb->prefix . 'users';
      		      $phpbb_upass = $phpbb_user_session[0]->user_password;
      		      $phpbb_uemail = $phpbb_user_session[0]->user_email;
      		      $phpbb_uurl = $phpbb_user_session[0]->pf_phpbb_website;
	              $wpdb->query("UPDATE $wpu_db_utab SET user_pass = '$phpbb_upass', user_email = '$phpbb_uemail', user_url = '$phpbb_uurl' WHERE ID = '$current_user->ID'");
              if ( defined( 'WP_ADMIN' ) ) { // going on profile directly from forum iframe for example, update onload user's profile fields
                 wp_redirect( admin_url().'profile.php', $status );
                 exit;
                }
             }
         
   		   // }
   		                  // END check for profile fields
   		         
         } // END update
   	  
   	  if ( defined( 'WP_ADMIN' ) ) {
   	  	return;
   	  }
   	  
	} // END is_user_logged_in()
   	
     // switch the admin uid1 on WP to admin uid 2 on phpBB, and viceversa //
  
   	$user_id = ($phpbb_user_session[0]->user_id == 2) ? '1' : $phpbb_user_session[0]->user_id;

    if( $user_id != 1 ){
    	
      $phpbb_real_username = sanitize_user( $phpbb_user_session[0]->username, $strict = false );
    	
      $user_id = username_exists( $phpbb_real_username );
      
     }
 
      if ( ! $user_id  ) { 

        if ( $phpbb_user_session[0]->group_name == 'ADMINISTRATORS' ){
      	      
      	      $role = 'administrator';
      	      
            } elseif ( $phpbb_user_session[0]->group_name == 'GLOBAL_MODERATORS' ){
            	
            	   $role = 'editor';
          	  
               }  else { $role = 'subscriber'; }  // for all others phpBB Groups default to WP subscriber
               	
         if ( $phpbb_user_session[0]->user_type == 1 ){
               	  $role = '';
              }
          
         //////// phpBB username chars fix          	   	
         // phpBB need to have users without characters like ' that is not allowed in WP as username
         // If old phpBB usersnames are like myuse'name on WP_w3all integration, do not add into WP
         // check for 2 more of these on this class.wp.w3all-phpbb.php, and 1 on ext_plugins_fixes.php in case you need to add something or remove
         
          $pattern = '/\'/';
          preg_match($pattern, $phpbb_user_session[0]->username, $matches);
          
          if($matches){
	        echo '<p style="padding:30px;background-color:#fff;color:#000;font-size:1.3em">Sorry, your <strong>registered username on our forum contain characters not allowed on this CMS system</strong>, you can\'t be added or login in this site side (and you\'ll see this message) until logged in on forums as <b>'.$phpbb_user_session[0]->username.'</b>. Please return back and contact the administrator reporting about this error issue. Thank you <input type="button" value="Go Back" onclick="history.back(-1)" /></p>';
          return;
          	//exit;
          }
          	
          ///////////////////
          ///////////////////
          	
              $phpbb_user_session[0]->username = sanitize_user( $phpbb_user_session[0]->username, $strict = false ); 
              
              $userdata = array(
               'user_login'       =>  $phpbb_user_session[0]->username,
               'user_pass'        =>  $phpbb_user_session[0]->user_password,
               'user_email'       =>  $phpbb_user_session[0]->user_email,
               'user_registered'  =>  date_i18n( 'Y-m-d H:i:s', $phpbb_user_session[0]->user_regdate ),
               'role'             =>  $role
               );
               
           $user_id = wp_insert_user( $userdata ) ;
           
          if ( ! is_wp_error( $user_id ) ) { // here we revert wp sanitized username to what we need: phpBB username
      	
        	$user = get_user_by( 'ID', $user_id );
   
      	  if ( $phpbb_real_username != $user->user_login  ) {
      	   // not equal update needed 
      		    $wpu_db_utab = $wpdb->prefix . 'users';
	            $wpdb->query("UPDATE $wpu_db_utab SET user_login = '$phpbb_real_username', user_login = '$phpbb_real_username', user_nicename = '$phpbb_real_username' WHERE ID = '$user->ID'");
        
      	    }
           }

      }
  
     $current_user = wp_get_current_user();
 
     if ( ! is_user_logged_in() && ! is_wp_error( $user_id ) ) {
     
     	$remember = ( empty($phpbb_k) ) ? false : true;
     	 
       $secure = is_ssl();
       
        wp_set_auth_cookie( $user_id, $remember, $secure );


		    if ( ! empty( $_REQUEST['redirect_to'] ) ) {
		    	
	       	$redirect_to = $requested_redirect_to = $_REQUEST['redirect_to'];
	      
	       } else {
		              $redirect_to = $_SERVER['PHP_SELF'];
		              $requested_redirect_to = '';
	              }
	
	     $redirect_to = apply_filters( 'login_redirect', $redirect_to, $requested_redirect_to, $current_user );
	     
	     wp_safe_redirect( $redirect_to );
	     exit;
    }
   
    return $phpbb_user_session;

 }  // END // HERE INSIDE WE ARE SECURE // END // 
    
 return;
    
}  // END verify_phpbb_credentials(){ // END //


private static function last_forums_topics($ntopics = 10){

     global $w3all_config;
     $config = $w3all_config;
     $w3db_conn = self::w3all_db_connect();
     
     $ntopics = (empty($ntopics)) ? '10' : $ntopics; 
         
           $forumlist_exclude = get_option ('w3all_exclude_phpbb_forums');
           
                // Credits: queries improvements here thank to sitmo2012
                // https://profiles.wordpress.org/sitmo2012
             
   if (empty( $forumlist_exclude )){
         	
         	    //$topics = $w3db_conn->get_results("SELECT * FROM ".$config["table_prefix"]."posts, ".$config["table_prefix"]."topics WHERE (SELECT MAX(topic_last_post_time) FROM ".$config["table_prefix"]."topics WHERE topic_visibility = 1) AND ".$config["table_prefix"]."posts.post_id = ".$config["table_prefix"]."topics.topic_last_post_id AND ".$config["table_prefix"]."posts.topic_id = ".$config["table_prefix"]."topics.topic_id AND ".$config["table_prefix"]."posts.post_visibility = 1 ORDER BY post_time DESC LIMIT 0,$ntopics");
              $topics = $w3db_conn->get_results("SELECT T.*, P.* FROM ".$config["table_prefix"]."topics AS T, ".$config["table_prefix"]."posts AS P
              WHERE T.topic_visibility = 1
              AND T.topic_last_post_id = P.post_id
              AND P.post_visibility = 1
              ORDER BY T.topic_last_post_time DESC LIMIT 0,$ntopics");

     } else {
        	
        	      if ( preg_match('/^[0-9,]+$/', $forumlist_exclude )) { 

        	         	$exp = explode(",", $forumlist_exclude);
        	         	$no_forums_list = '';
                    while (list(, $value) = each($exp)) {
	                        $no_forums_list .= "'".$value."',";
                        }
                        
                    $no_forums_list = substr($no_forums_list, 0, -1);
                    
        	  		   //$topics = $w3db_conn->get_results("SELECT * FROM ".$config["table_prefix"]."posts, ".$config["table_prefix"]."topics WHERE (SELECT MAX(topic_last_post_time) FROM ".$config["table_prefix"]."topics WHERE topic_visibility = 1) AND ".$config["table_prefix"]."topics.forum_id NOT IN(".$no_forums_list.")  AND ".$config["table_prefix"]."posts.post_id = ".$config["table_prefix"]."topics.topic_last_post_id AND ".$config["table_prefix"]."posts.topic_id = ".$config["table_prefix"]."topics.topic_id AND ".$config["table_prefix"]."posts.post_visibility = 1 ORDER BY post_time DESC LIMIT 0,$ntopics");
                   $topics = $w3db_conn->get_results("SELECT T.*, P.* FROM ".$config["table_prefix"]."topics AS T, ".$config["table_prefix"]."posts AS P
                   WHERE T.topic_visibility = 1
                   AND T.forum_id NOT IN(".$no_forums_list.")
                   AND T.topic_last_post_id = P.post_id
                   AND P.post_visibility = 1
                   ORDER BY T.topic_last_post_time DESC LIMIT 0,$ntopics");
                  
                  } else {  
        	          //$topics = $w3db_conn->get_results("SELECT * FROM ".$config["table_prefix"]."posts, ".$config["table_prefix"]."topics WHERE (SELECT MAX(topic_last_post_time) FROM ".$config["table_prefix"]."topics WHERE topic_visibility = 1) AND ".$config["table_prefix"]."posts.post_id = ".$config["table_prefix"]."topics.topic_last_post_id AND ".$config["table_prefix"]."posts.topic_id = ".$config["table_prefix"]."topics.topic_id AND ".$config["table_prefix"]."posts.post_visibility = 1 ORDER BY post_time DESC LIMIT 0,$ntopics");
                    $topics = $w3db_conn->get_results("SELECT T.*, P.* FROM ".$config["table_prefix"]."topics AS T, ".$config["table_prefix"]."posts AS P
                    WHERE T.topic_visibility = 1
                    AND T.topic_last_post_id = P.post_id
                    AND P.post_visibility = 1
                    ORDER BY T.topic_last_post_time DESC LIMIT 0,$ntopics");
                   }                
	          }
	          
	  return $topics; 
}


private static function phpBB_user_session_set($wp_user_data){

	      global $w3all_config,$wpdb,$w3cookie_domain;
       $phpbb_config_file = $w3all_config;
	     $phpbb_config = self::get_phpbb_config();
       $w3phpbb_conn = self::w3all_db_connect();
      	
        $k   = $phpbb_config["cookie_name"].'_k';
        $sid = $phpbb_config["cookie_name"].'_sid';
        $u   = $phpbb_config["cookie_name"].'_u';
         
         if ( $wp_user_data->ID == 0 ){
		  	      return; 
		      }    

     if( $wp_user_data->ID == 1 ){ // switch admin
         	
         	$user_id = 2;
         	
       } else { 
       	
               $phpbb_uid = $w3phpbb_conn->get_row("SELECT * FROM ".$phpbb_config_file["table_prefix"]."users WHERE username = '$wp_user_data->user_login' OR user_email = '$wp_user_data->user_email' ") ;
          
               $user_id = $phpbb_uid->user_id;
          
                if ( $phpbb_uid->user_type == 1 ){ // is this user deactivated/banned in phpBB? / logout/and deactivate in WP
           
                  $wpu_db_utab = $wpdb->prefix . 'usermeta';
	                $wpdb->query("UPDATE $wpu_db_utab SET meta_value = 'a:0:{}' WHERE user_id = '$wp_user_data->ID' AND meta_key = 'wp_capabilities'");
	                
                   self::w3all_wp_logout();
               }
             }
           

 
       $time = time();
       $val = md5($phpbb_config["rand_seed"] . microtime()); // to user_form_salt
       $val = md5($val);
       $phpbb_config["rand_seed"] = md5( $phpbb_config["rand_seed"] . $val . rand() ); // the rand seed to be updated
       $phpbb_rand_seed = $phpbb_config["rand_seed"];
       
        $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."config SET config_value = '$phpbb_rand_seed' WHERE config_name = 'rand_seed'");
        $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."config SET config_value = '$time' WHERE config_name = 'rand_seed_last_update'");
        $w3_unique_id = substr($val, 4, 16); 
        $w3session_id = md5($w3_unique_id);
     
  //   $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."users SET user_form_salt = '$val' WHERE user_id = '$user_id'");
   
        $uip = (!empty($_SERVER['REMOTE_ADDR'])) ? $_SERVER['REMOTE_ADDR'] : '127.0.0.1';
        $uag = (!empty($_SERVER['HTTP_USER_AGENT'])) ? $_SERVER['HTTP_USER_AGENT'] : 'unknown';
        $auto_login = 1; 
           $w3phpbb_conn->query("INSERT INTO ".$phpbb_config_file["table_prefix"]."sessions (session_id, session_user_id, session_last_visit, session_start, session_time, session_ip, session_browser, session_forwarded_for, session_page, session_viewonline, session_autologin, session_admin, session_forum_id) 
          VALUES ('$w3session_id', '$user_id', '$time', '$time', '$time', '$uip', '$uag', '', 'index.php', '1', '$auto_login', '0', '0')");
 
     // $key_id = unique_id(hexdec(substr($this->session_id, 0, 8))); // phpBB

      $key_id = hexdec(substr($w3session_id, 0, 8));
      $valk = $phpbb_config["rand_seed"] . microtime() . $key_id;
      $valk = md5($valk);
      
      $key_id_k  = substr($valk, 4, 16); // to k

      $key_id_sk = md5($key_id_k); // to sessions_keys
      
  // if ( $phpbb_config["allow_autologin"] == 1 ){//  phpBB 'if allowed autologin' feature // enable it here and below

   //  if (! empty( $_POST['rememberme'] )){ 
    
            $w3phpbb_conn->query("INSERT INTO ".$phpbb_config_file["table_prefix"]."sessions_keys (key_id, user_id, last_ip, last_login) 
           VALUES ('$key_id_sk', '$user_id', '$uip', '$time')");
       
  //    }
 
  //}
  
	    $cookie_expire = $time + (($phpbb_config['max_autologin_time']) ? 86400 * (int) $phpbb_config['max_autologin_time'] : 31536000);

// if ( $phpbb_config["allow_autologin"] == 1 ){//  phpBB 'if allowed autologin' feature // enable it also here

    $secure = is_ssl();
    
 // if (! empty( $_POST['rememberme'] )){ 

	    setcookie ("$k", "$key_id_k", $cookie_expire, "/", $w3cookie_domain, $secure);
	// }
	    
	  // }
	    
 	    setcookie ("$sid", "$w3session_id", $cookie_expire, "/", $w3cookie_domain, $secure); 
 	    setcookie ("$u", "$user_id", $cookie_expire, "/", $w3cookie_domain, $secure);

}

private static function create_phpBB_user($wpu){
	
	global $w3all_config;
   $phpbb_config_file = $w3all_config;
	 $w3phpbb_conn = self::w3all_db_connect();
   $phpbb_config = self::get_phpbb_config();   	 
        	  	     
     if( empty($wpu) ){ return; }
     
       $phpbb_any = $w3phpbb_conn->get_row("SELECT username, user_email FROM ".$phpbb_config_file["table_prefix"]."users WHERE username = '$wpu->user_login' OR user_email = '$wpu->user_email'");
       
       if ( null !== $phpbb_any ) {
       	 //temp_wp_w3_error_on_update();
         //exit; // block user login if user come form phpBB, so, just return 
         // in case set here what to do on wp_w3all_phpbb_registration_save2() where create_phpBB_user call this method
         return;
       }
     
            $u   = $phpbb_config["cookie_name"].'_u';
            
            if ( preg_match('/[^0-9]/',$_COOKIE[$u]) ){
 	           	
                die( "Clean up cookie on your browser please!" );
 	            }
 	            
 	           $phpbb_u = $_COOKIE[$u];
 	        
 	    // only need to fire when user do not exist on phpBB already, and/or user is an admin that add an user manually 
   if ( $phpbb_u < 2 OR !empty($phpbb_u) && current_user_can( 'manage_options' ) === true ) {
      
      // check that the user need to be added as activated or not into phpBB   
      	$pud = get_option('w3all_phpbb_user_deactivated_yn');
        $phpbb_user_type = ($pud == 1) ? 1 : 0;       
        //$phpbb_user_type = 0; // if no capabilities on WP, this should be set to 1 as deactivated on phpBB
        $wpu->user_registered = time($wpu->user_registered); // as phpBB do
	      $user_email_hash = sprintf('%u', crc32(strtolower($wpu->user_email))) . strlen($wpu->user_email); // as phpBB do
 
      $wpur = $wpu->user_registered;
      $wpul = $wpu->user_login;
      //$wpunn = $wpu->user_nicename;
      $wpup = $wpu->user_pass;
      $wpue = $wpu->user_email;
      $time = time();
      
      $wpunn = strtolower($wpul);
  
      $w3phpbb_conn->query("INSERT INTO ".$phpbb_config_file["table_prefix"]."users (user_id, user_type, group_id, user_permissions, user_perm_from, user_ip, user_regdate, username, username_clean, user_password, user_passchg, user_email, user_email_hash, user_birthday, user_lastvisit, user_lastmark, user_lastpost_time, user_lastpage, user_last_confirm_key, user_last_search, user_warnings, user_last_warning, user_login_attempts, user_inactive_reason, user_inactive_time, user_posts, user_lang, user_timezone, user_dateformat, user_style, user_rank, user_colour, user_new_privmsg, user_unread_privmsg, user_last_privmsg, user_message_rules, user_full_folder, user_emailtime, user_topic_show_days, user_topic_sortby_type, user_topic_sortby_dir, user_post_show_days, user_post_sortby_type, user_post_sortby_dir, user_notify, user_notify_pm, user_notify_type, user_allow_pm, user_allow_viewonline, user_allow_viewemail, user_allow_massemail, user_options, user_avatar, user_avatar_type, user_avatar_width, user_avatar_height, user_sig, user_sig_bbcode_uid, user_sig_bbcode_bitfield, user_jabber, user_actkey, user_newpasswd, user_form_salt, user_new, user_reminded, user_reminded_time)
         VALUES ('','$phpbb_user_type','2','','0','', '$wpur', '$wpul', '$wpunn', '$wpup', '0', '$wpue', '$user_email_hash', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', 'en', 'Europe/Rome', 'D M d, Y g:i a', '1', '0', '', '0', '0', '0', '0', '-3', '0', '0', 't', 'd', 0, 't', 'a', '0', '1', '0', '1', '1', '1', '1', '230271', '', '', '0', '0', '', '', '', '', '', '', '', '0', '0', '0')");
      
      $phpBBlid = $w3phpbb_conn->insert_id;
   
     $w3phpbb_conn->query("INSERT INTO ".$phpbb_config_file["table_prefix"]."user_group (group_id, user_id, group_leader, user_pending) VALUES ('2','$phpBBlid','0','0')");
     $w3phpbb_conn->query("INSERT INTO ".$phpbb_config_file["table_prefix"]."user_group (group_id, user_id, group_leader, user_pending) VALUES ('7','$phpBBlid','0','0')");

     $w3phpbb_conn->query("INSERT INTO ".$phpbb_config_file["table_prefix"]."acl_users (user_id, forum_id, auth_option_id, auth_role_id, auth_setting) VALUES ('$phpBBlid','0','0','6','0')");
    		
       $tot_users_count = $w3phpbb_conn->get_var("SELECT COUNT(*) FROM ".$phpbb_config_file["table_prefix"]."users WHERE group_id !='6' AND group_id !='1'");
 
     $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."config SET config_value = '$tot_users_count' WHERE config_name = 'num_users'");

       $newest_member = $w3phpbb_conn->get_results(" SELECT * FROM ".$phpbb_config_file["table_prefix"]."users WHERE user_id = (SELECT Max(user_id) FROM ".$phpbb_config_file["table_prefix"]."users) AND group_id != '6'");
       $uname = $newest_member[0]->username;
       $uid   = $newest_member[0]->user_id;
     $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."config SET config_value = '$uname' WHERE config_name = 'newest_username'");
     $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."config SET config_value = '$uid' WHERE config_name = 'newest_user_id'");

 
 }// if cookie not set

}


// check existance in phpBB, of provided username and email on-register in WP // 
  public static function phpBB_user_check( $sanitized_user_login, $user_email, $is_admin_action = 1 ){

	      global $w3all_config;
        $phpbb_config_file = $w3all_config;
	      $w3phpbb_conn = self::w3all_db_connect();
        $phpbb_config = self::get_phpbb_config();
    
      $u = $phpbb_config["cookie_name"].'_u';
            
            if ( isset($_COOKIE["$u"]) && preg_match('/[^0-9]/',$_COOKIE[$u]) ){
 	           	
                die( "Clean up cookie on your browser please!" );
 	            }
 	        
 	     if( $is_admin_action == 1 ){
 	     	         $phpbb_any = $w3phpbb_conn->get_row("SELECT username, user_email FROM ".$phpbb_config_file["table_prefix"]."users WHERE username = '$sanitized_user_login' OR user_email = '$user_email'");
         if ( null !== $phpbb_any ) {
           return true;
 	       }
 	     }
 	     	       
 	     	  $_COOKIE[$u] = (isset($_COOKIE[$u])) ? $_COOKIE[$u] : '';
 	     	  
 	        if ( $_COOKIE["$u"] < 2 && $is_admin_action == 0 ){ // check this only if NEW phpBB user come as NOT logged in or get 'undefined wp_delete' error

         $phpbb_any = $w3phpbb_conn->get_row("SELECT username, user_email FROM ".$phpbb_config_file["table_prefix"]."users WHERE username = '$sanitized_user_login' OR user_email = '$user_email'");
       if ( null !== $phpbb_any ) {
        return true;
     }
     
    }
    
     return false;

  }
  
// check existance in phpBB, of provided username and email on-register in WP 2nd // 
// add_filter( 'registration_errors', 'wp_w3all_check_fields', 10, 3 );
  public static function phpBB_user_check2( $errors, $sanitized_user_login, $user_email ){

	      global $w3all_config;
        $phpbb_config_file = $w3all_config;
	      $w3phpbb_conn = self::w3all_db_connect();

         $phpbb_is_there_anybody = $w3phpbb_conn->get_row("SELECT username, user_email FROM ".$phpbb_config_file["table_prefix"]."users WHERE username = '$sanitized_user_login' OR user_email = '$user_email'");
       if ( null !== $phpbb_is_there_anybody ) {
        return true;
     }

    return false;
  }  


public static function check_phpbb_passw_match_on_wp_auth ( $username, $is_phpbb_admin = 0 ) {
  
     global $wpdb, $w3all_config;
     $phpbb_config_file = $w3all_config;
     
   if( empty($username) ){ return; }

	    $w3phpbb_conn = self::w3all_db_connect();

      $wpu = get_user_by('login', $username);
      
      if( $is_phpbb_admin == 1 ){ // wp default install admin

      $phpbb_pae = $w3phpbb_conn->get_row("SELECT user_password, user_email FROM ".$phpbb_config_file["table_prefix"]."users WHERE user_id = '2'");

	     if( $phpbb_pae->user_password != $wpu->user_pass && !empty($phpbb_pae->user_password) ){
	
	        $wpu_db_utab = $wpdb->prefix . 'users';
	        $wpdb->query("UPDATE $wpu_db_utab SET user_pass = '$phpbb_pae->user_password' WHERE ID = '1'");
        
        return $phpbb_pae->user_password;
     }
  }
 
    if( $is_phpbb_admin == 0 ){ // passw change for all others

      $phpbb_pae = $w3phpbb_conn->get_row("SELECT user_password, user_email FROM ".$phpbb_config_file["table_prefix"]."users WHERE username = '$wpu->user_login'");

// pass empty, do not check if user isn't created in phpBB
	     if( $phpbb_pae->user_password != $wpu->user_pass && !empty($phpbb_pae->user_password) ){
	
	        $wpu_db_utab = $wpdb->prefix . 'users';
	        $wpdb->query("UPDATE $wpu_db_utab SET user_pass = '$phpbb_pae->user_password' WHERE user_login = '$wpu->user_login'");

        return $phpbb_pae->user_password;
    }
  }
  
  return false;
   
}

  
  
public static function wp_w3all_phpbb_logout() {
	 
	 global $w3all_config,$w3cookie_domain,$useragent;
      $phpbb_config_file = $w3all_config;
  	  $w3phpbb_conn = self::w3all_db_connect();
	  	$phpbb_config = self::get_phpbb_config();
        	
        $k   = $phpbb_config["cookie_name"].'_k';
        $sid = $phpbb_config["cookie_name"].'_sid';
        $u   = $phpbb_config["cookie_name"].'_u';
        
        
      if ( preg_match('/[^0-9A-Za-z]/',$_COOKIE[$k]) OR preg_match('/[^0-9A-Za-z]/',$_COOKIE[$sid]) OR preg_match('/[^0-9]/',$_COOKIE[$u]) ){
 	           	 die( "Please clean up cookies on your browser." );
 	            }

   $k_md5 = md5($_COOKIE[$k]);
 	 $u_id = $_COOKIE[$u];
 	 $s_id = $_COOKIE[$sid];

    // logout user
    $w3phpbb_conn->query("DELETE FROM ".$phpbb_config_file["table_prefix"]."sessions WHERE session_id = '$s_id' AND session_user_id = '$u_id' OR session_user_id = '$u_id' AND session_browser = '$useragent'");
    $w3phpbb_conn->query("DELETE FROM ".$phpbb_config_file["table_prefix"]."sessions_keys WHERE key_id = '$k_md5' AND user_id = '$u_id'");
  // $w3phpbb_conn->query("DELETE ".$phpbb_config_file["table_prefix"]."sessions, ".$phpbb_config_file["table_prefix"]."sessions_keys FROM ".$phpbb_config_file["table_prefix"]."sessions INNER JOIN ".$phpbb_config_file["table_prefix"]."sessions_keys WHERE ".$phpbb_config_file["table_prefix"]."sessions.session_id = '".$_COOKIE["$sid"]."' AND ".$phpbb_config_file["table_prefix"]."sessions.session_user_id = '".$_COOKIE["$u"]."' AND ".$phpbb_config_file["table_prefix"]."sessions_keys.user_id = '".$_COOKIE["$u"]."' AND ".$phpbb_config_file["table_prefix"]."sessions_keys.key_id = '".md5($_COOKIE["$k"])."'");
  
 	// remove phpBB cookies
 	
      setcookie ("$k", "", time() - 3600, "/");
 	    setcookie ("$sid", "", time() - 3600, "/"); 
 	    setcookie ("$u", "", time() - 3600, "/"); 
 	    setcookie ("$k", "", time() - 3600, "/", "$w3cookie_domain");
 	    setcookie ("$sid", "", time() - 3600, "/", "$w3cookie_domain"); 
 	    setcookie ("$u", "", time() - 3600, "/", "$w3cookie_domain"); 


}

    
public static function phpbb_pass_update($user, $new_pass) {

     	 global $w3all_config;
     
     $phpbb_config_file = $w3all_config;
     $w3phpbb_conn = self::wp_w3all_phpbb_conn_init();
     $new_pass = self::phpBB_password_hash($new_pass); 
      
      if ( $user->ID == 1 ){ // update uid2
      	
       $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."users SET user_password = '$new_pass' WHERE	user_id = '2'");
     // we should reset any session here
     // $w3phpbb_conn->query("DELETE ".$phpbb_config_file["table_prefix"]."sessions, ".$phpbb_config_file["table_prefix"]."sessions_keys FROM ".$phpbb_config_file["table_prefix"]."sessions INNER JOIN ".$phpbb_config_file["table_prefix"]."sessions_keys WHERE ".$phpbb_config_file["table_prefix"]."sessions.session_user_id = '2' AND ".$phpbb_config_file["table_prefix"]."sessions_keys.user_id = '2'");


      } else { // update using uname
     
       $ulogin = $user->user_login;
       
       $phpbb_uid = $w3phpbb_conn->get_row("SELECT user_id FROM ".$phpbb_config_file["table_prefix"]."users WHERE username = '$ulogin'");
 
       $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."users SET user_password = '$new_pass' WHERE username = '$ulogin'");
    // we should reset any session here
	   //  $w3phpbb_conn->query("DELETE ".$phpbb_config_file["table_prefix"]."sessions, ".$phpbb_config_file["table_prefix"]."sessions_keys FROM ".$phpbb_config_file["table_prefix"]."sessions INNER JOIN ".$phpbb_config_file["table_prefix"]."sessions_keys WHERE ".$phpbb_config_file["table_prefix"]."sessions.session_user_id = '$phpbb_uid->user_id' AND ".$phpbb_config_file["table_prefix"]."sessions_keys.user_id = '$phpbb_uid->user_id'");

       
     } 

    }
    
public static function phpbb_update_profile($user_id, $old_user_data) {

   global $wpdb,$w3all_config;

     $phpbb_config_file = $w3all_config;
     $w3phpbb_conn = self::wp_w3all_phpbb_conn_init();
     
     $wpu = get_user_by('ID', $user_id);

    $phpbb_user_type = ( empty($wpu->roles) ) ? '1' : '0';

     if ( $wpu->ID == 1 ) {
     	
      $phpbb_is_there_anybody = $w3phpbb_conn->get_row("SELECT username, user_email FROM ".$phpbb_config_file["table_prefix"]."users WHERE user_email = '$wpu->user_email' AND user_id != '2'");
 	    	 
 	    	    if ( null !== $phpbb_is_there_anybody ) { // revert // if there are usernames or email address, reset to old value and return error
      	
        $wpu_db_utab = $wpdb->prefix . 'users';
	      $wpdb->query("UPDATE $wpu_db_utab SET user_email = '$old_user_data->user_email' WHERE user_login = '$old_user_data->user_login'");
   
       return true;
       
     }
                                               
               $phpbb_user_data = $w3phpbb_conn->get_results("SELECT *  
                                   FROM ". $phpbb_config_file["table_prefix"] ."users  
                                   JOIN ". $phpbb_config_file["table_prefix"] ."groups ON ". $phpbb_config_file["table_prefix"] ."groups.group_id = ". $phpbb_config_file["table_prefix"] ."users.group_id 
                                   AND  ". $phpbb_config_file["table_prefix"] ."users.user_id = '2' 
                                   LEFT JOIN ". $phpbb_config_file["table_prefix"] ."profile_fields_data ON ". $phpbb_config_file["table_prefix"] ."profile_fields_data.user_id = '2'");
                                        
      
      
      } else {
      	
      $phpbb_is_there_anybody = $w3phpbb_conn->get_row("SELECT username, user_email FROM ".$phpbb_config_file["table_prefix"]."users WHERE user_email = '$wpu->user_email' AND username != '$wpu->user_login'");
 	    	    
 	    	       if ( null !== $phpbb_is_there_anybody ) { // revert // if there are usernames or email address, reset to old value and return error
      	
        $wpu_db_utab = $wpdb->prefix . 'users';
	      $wpdb->query("UPDATE $wpu_db_utab SET user_email = '$old_user_data->user_email' WHERE user_login = '$old_user_data->user_login'");
   
       return true;
       
     }
 	         
           	$phpbb_user_data = $w3phpbb_conn->get_results("SELECT *  
                                              FROM ". $phpbb_config_file["table_prefix"] ."users  
                                              JOIN ". $phpbb_config_file["table_prefix"] ."groups ON ". $phpbb_config_file["table_prefix"] ."groups.group_id = ". $phpbb_config_file["table_prefix"] ."users.group_id 
                                              AND  ". $phpbb_config_file["table_prefix"] ."users.user_email = '".$wpu->user_email."' 
                                              LEFT JOIN ". $phpbb_config_file["table_prefix"] ."profile_fields_data ON ". $phpbb_config_file["table_prefix"] ."profile_fields_data.user_id = ". $phpbb_config_file["table_prefix"] ."users.user_id");       
             	
             $phpbb_udata_rget = $w3phpbb_conn->get_results("SELECT * FROM ".$phpbb_config_file["table_prefix"]."users WHERE username = '".$wpu->user_login."'");	// as we have not the uid on phpBB with above query
           
           
      
                                   
  }
    
   // update 
   
            // NOTE phpbb_verify_credentials do the update of same fields so if code changes are done here
            // we need to look also the phpbb_verify_credentials method and add same things on it
            
              $user_email_hash = sprintf('%u', crc32(strtolower($wpu->user_email))) . strlen($wpu->user_email); // as phpBB do
             
            if ( $wpu->ID == 1 ) { // install admin update // except roles
            	
            	               	// profile row exist for this user?
               	        	$phpbb_profile_fields = $w3phpbb_conn->get_results("SELECT *  
                                              FROM ". $phpbb_config_file["table_prefix"] ."profile_fields_data  
                                              JOIN ". $phpbb_config_file["table_prefix"] ."users ON ". $phpbb_config_file["table_prefix"] ."users.user_id = ". $phpbb_config_file["table_prefix"] ."profile_fields_data.user_id  
                                              AND  ". $phpbb_config_file["table_prefix"] ."users.user_id = '2'");
             
             $uid = 2; // switch to admin uid 
             
             if(empty($phpbb_profile_fields)){
              	// you need to add here for admin and below for others users UPDATE, any other value for external plugins updates!
              	// the same need to be done into phpbb_verify_credentials method
              	
              	$u_url = $wpu->user_url;
              
              $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."users SET user_password = '$wpu->user_pass', user_email = '$wpu->user_email', user_email_hash = '$user_email_hash' WHERE user_id = '2'");
  	         if(!empty( $u_url )){
  	          $w3phpbb_conn->query("INSERT INTO ".$phpbb_config_file["table_prefix"]."profile_fields_data (user_id, pf_phpbb_interests, pf_phpbb_occupation, pf_phpbb_facebook, pf_phpbb_googleplus, pf_phpbb_icq, pf_phpbb_location, pf_phpbb_skype, pf_phpbb_twitter, pf_phpbb_website, pf_phpbb_wlm, pf_phpbb_yahoo, pf_phpbb_youtube, pf_phpbb_aol)
                  VALUES ('$uid','','','','','','','','','$u_url','','','','') ON DUPLICATE KEY UPDATE pf_phpbb_website = '$u_url'");
        	    }
        	} else {
        		
       		  // add here any other value for external plugins updates!
              $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."users SET user_password = '$wpu->user_pass', user_email = '$wpu->user_email', user_email_hash = '$user_email_hash' WHERE user_id = '2'");
              $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."profile_fields_data SET pf_phpbb_website = '$wpu->user_url' WHERE user_id = '$uid'");
	
	             // update more fields here: phpBB tab -> 'phpbb_profile_fields_data'
     

            }
            
               } else { // all others // also roles
               	// the same need to be done into phpbb_verify_credentials
               	
               	$uid = $phpbb_udata_rget[0]->user_id; 
               	$u_url = $wpu->user_url;
               	
               	        	$phpbb_profile_fields = $w3phpbb_conn->get_results("SELECT *  
                                              FROM ". $phpbb_config_file["table_prefix"] ."profile_fields_data  
                                              JOIN ". $phpbb_config_file["table_prefix"] ."users ON ". $phpbb_config_file["table_prefix"] ."users.user_id = ". $phpbb_config_file["table_prefix"] ."profile_fields_data.user_id  
                                              AND  ". $phpbb_config_file["table_prefix"] ."users.username = '".$wpu->user_login."'");
              
        
                if(empty($phpbb_profile_fields)){
              
              	// you need to add here and below UPDATE, any other value for external plugins updates!
               // $uid = $phpbb_udata_rget[0]->user_id; 
                $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."users SET user_type = '$phpbb_user_type', user_password = '$wpu->user_pass', user_email = '$wpu->user_email', user_email_hash = '$user_email_hash' WHERE user_id = '$uid'");

                //$u_url = $wpu->user_url;
              	
              	if (!empty($u_url)){
                 $w3phpbb_conn->query("INSERT INTO ".$phpbb_config_file["table_prefix"]."profile_fields_data (user_id, pf_phpbb_interests, pf_phpbb_occupation, pf_phpbb_facebook, pf_phpbb_googleplus, pf_phpbb_icq, pf_phpbb_location, pf_phpbb_skype, pf_phpbb_twitter, pf_phpbb_website, pf_phpbb_wlm, pf_phpbb_yahoo, pf_phpbb_youtube, pf_phpbb_aol)
                  VALUES ('$uid','','','','','','','','','$u_url','','','','') ON DUPLICATE KEY UPDATE pf_phpbb_website = '$u_url'");
        	      }
              } else {
           // you need to add here any other value for external plugins updates!
           
             //$uid = $phpbb_udata_rget[0]->user_id; 
             //$u_url = $wpu->user_url; 
   
           
               	          $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."users SET user_type = '$phpbb_user_type', user_password = '$wpu->user_pass', user_email = '$wpu->user_email', user_email_hash = '$user_email_hash' WHERE user_id = '$uid'");
                          $w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."profile_fields_data SET pf_phpbb_website = '$u_url' WHERE user_id = '$uid'");
                        // on pass change user should be logged out here and everywhere?
            	        }
        }
}     

        
public static function w3_check_phpbb_profile_wpnu($username){

 global $w3all_config,$wpdb;
 $phpbb_config_file = $w3all_config;
 $w3phpbb_conn = self::wp_w3all_phpbb_conn_init();

if(isset($_POST["log"])){
	

     $username = sanitize_user( $username, $strict = false );
      
            //////// phpBB username chars fix          	   	
         // phpBB need to have users without characters like ' that is not allowed in WP as username
         // If old phpBB usersnames are like myuse'name on WP_w3all integration, do not add into WP
         // check for 2 more of these on this class.wp.w3all-phpbb.php, and 1 on ext_plugins_fixes.php in case you need to add something or remove
  
          $pattern = '/\'/';
          preg_match($pattern, $username, $matches);
          
          if($matches){
	        echo '<p style="padding:30px;background-color:#fff;color:#000;font-size:1.3em">Sorry, your <strong>registered username on our forum contain characters not allowed on this CMS system</strong>, you can\'t be added or login in this site side (and you\'ll see this message) until logged in on forums with this username. Please return back and contact the administrator reporting about this error issue. Thank you <input type="button" value="Go Back" onclick="history.back(-1)" /></p>';
          return;
          	//exit;
          }
          	
          ///////////////////
          ///////////////////    
  
 // switch admin not necessary: the default admin always exist
 // modified, removed AND u.user_type != '1': 
               	    	     $phpbb_user = $w3phpbb_conn->get_results("SELECT u.*, g.* 
                                               FROM ". $phpbb_config_file["table_prefix"] ."users u, ". $phpbb_config_file["table_prefix"] ."groups g 
                                               WHERE u.username = '".$username."' 
                                               AND u.group_id != '1' AND u.group_id != '6' 
                                               AND u.group_id = g.group_id");  
                                   

     if ( $phpbb_user[0]->user_id < 3 ){ // exclude the default phpBB install admin
      	return; 
		  }

    $user_id = username_exists( $username );
    $user_info = get_userdata( $user_id );

	 // activated on phpBB?
	 if( $phpbb_user[0]->user_type != 1 && empty($user_info->wp_capabilities) ){ // reactivate this 'No role' WP user

	 	 // user should be re-activated with proper role maybe: subscriber as default as it is 
	 	    $wpu_db_utab = $wpdb->prefix . 'usermeta';
	 	    $subscriber = 'a:1:{s:10:"subscriber";b:1;}';
	      $wpdb->query("UPDATE $wpu_db_utab SET meta_value = '$subscriber' WHERE user_id = '$user_id' AND meta_key = 'wp_capabilities'");
	   
	    }


	 if ( ! $user_id  ) { 

        if ( $phpbb_user[0]->group_name == 'ADMINISTRATORS' ){
      	      
      	      $role = 'administrator';
      	      
            } elseif ( $phpbb_user[0]->group_name == 'GLOBAL_MODERATORS' ){
            	
            	   $role = 'editor';
          	  
               } elseif ( $phpbb_user[0]->user_type != 1 && empty($user_info->wp_capabilities) ) {
               	 $role = '';
              }
               
               else { $role = 'subscriber'; }  // for all others phpBB Groups default to WP subscriber
               
               
          	
              $userdata = array(
               'user_login'       =>  $phpbb_user[0]->username,
               'user_pass'        =>  $phpbb_user[0]->user_password,
               'user_email'       =>  $phpbb_user[0]->user_email,
               'user_registered'  =>  date_i18n( 'Y-m-d H:i:s', $phpbb_user[0]->user_regdate ),
               'role'             =>  $role
               );
               
           $user_id = wp_insert_user( $userdata ) ;

        }	  
		}
		
		return;
}    


public static function wp_w3all_get_phpbb_user_info($username){
	
 global $w3all_config;
 $phpbb_config_file = $w3all_config;
 $w3phpbb_conn = self::wp_w3all_phpbb_conn_init();
 
         //////// phpBB username chars fix          	   	
         // phpBB need to have users without characters like ' that is not allowed in WP as username
         // If old phpBB usersnames are like myuse'name, do not add into WP
         // check for 2 more of these on this class.wp.w3all-phpbb.php, and 1 on ext_plugins_fixes.php in case you need to add something or remove

              
          $pattern = '/\'/';
          preg_match($pattern, $username, $matches);
          
          if($matches){
	        echo '<p style="padding:30px;background-color:#fff;color:#000;font-size:1.3em">Sorry, your <strong>registered username on our forum contain characters not allowed on this CMS system</strong>, you can\'t be added or login in this site side (and you\'ll see this message) until logged in on forums with this username. Please return back and contact the administrator reporting about this error issue. Thank you <input type="button" value="Go Back" onclick="history.back(-1)" /></p>';
         return;
          	//exit;
          }
          
          /////////////
          /////////////
 
  $pattern = '/^.*@[-a-z0-9]+\.+[-a-z0-9]+[\.[a-z0-9]+]?/'; // we only need to know what is used to login email or username
  preg_match($pattern, $username, $uname_email);

  $uname_email = (empty($uname_email)) ? 'username' : 'user_email';

  $phpbb_user_data = $w3phpbb_conn->get_row("SELECT * FROM ".$phpbb_config_file["table_prefix"]."users 
  JOIN ". $phpbb_config_file["table_prefix"] ."groups ON ". $phpbb_config_file["table_prefix"] ."groups.group_id = ". $phpbb_config_file["table_prefix"] ."users.group_id
  AND ".$phpbb_config_file["table_prefix"]."users.".$uname_email." = '".$username."'");

 return $phpbb_user_data;
 
} 
    

public static function wp_w3all_phpbb_delete_user ($user_id){
	
 global $w3all_config;
 $phpbb_config_file = $w3all_config;
 $w3phpbb_conn = self::wp_w3all_phpbb_conn_init();
// TODO: delete user in phpBB when deleted in WP

// Tmp fix: only deactivate user in phpBB if deleted on WP

 $user = get_user_by( 'ID', $user_id );
 
$w3phpbb_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."users SET user_type = '1' WHERE username = '$user->user_login'");

}


 public static function wp_w3all_wp_after_pass_reset( $user ) { 
	
	 global $w3all_config;
	
	$w3db_conn = self::wp_w3all_phpbb_conn_init();
	$phpbb_config_file = $w3all_config;
	
	//$wpu_meta = get_user_meta($user->ID, $key, $single);
	//if (empty($wpu_meta[default_password_nag][0])){
	
	  $user_info = get_userdata($user->ID);
    $wp_user_role = implode(', ', $user_info->roles);
  
	$w3all_phpbb_user_deactivated_yn = get_option('w3all_phpbb_user_deactivated_yn');

	if ( $w3all_phpbb_user_deactivated_yn == 1 && !empty($wp_user_role) ){
		
		$phpbb_user_data = self::wp_w3all_get_phpbb_user_info($user->user_login);

		if ( $phpbb_user_data->user_type == 1 ) {
			
			$res = $w3db_conn->query("UPDATE ".$phpbb_config_file["table_prefix"]."users SET user_type = '0' WHERE username = '$user->user_login'");
   
     }

  }
}
   
    
public static function phpBB_password_hash($pass){

		require_once( ABSPATH . WPINC . '/class-phpass.php');

    $hasher = new PasswordHash(8, FALSE);

    $hash = $hasher->HashPassword($pass);

  return $hash;
}


// START ABOUT AVATARS ONLY //

public static function wp_w3all_assoc_phpbb_wp_users() {
	 
	global $w3all_get_phpbb_avatar_yn, $w3all_last_t_avatar_yn, $w3all_lasttopic_avatar_num;
	$w3all_avatars_yn = $w3all_get_phpbb_avatar_yn == 1 ? true : false;

    $nposts = get_option( 'posts_per_page' ); // to be improved maybe, and get only the strict

 $post_list = get_posts( array(
    'user_id',
    'numberposts'    => $nposts,
    'sort_order' => 'desc',
    'post_status' => 'publish'
  ) );
  
    foreach ( $post_list as $post ) {
    	
     $uname = get_user_by('ID', $post->post_author);
     $p_unames[] = $uname->user_login;
   
     $comments = get_comments( array( 'post_id' => $post->ID ) );
      foreach ( $comments as $comment ) :
       if ( $comment->user_id > 0 ):
        $p_unames[] = $comment->comment_author;
       endif;
      endforeach;
   }
   
// after comments and posts usernames, we add the current user
// if any other condition where we fail assigning avatars to users, we'll add here than

   // add current user
   $current_user = wp_get_current_user();
   if ($current_user->ID > 0){
   $p_unames[] = $current_user->user_login;
  }
 
  // add usernames for last topics widget, if needed
 if ( $w3all_avatars_yn ) :
  $w3all_last_posts_users = self::last_forums_topics($w3all_lasttopic_avatar_num);
   if(!empty($w3all_last_posts_users)):
      foreach ( $w3all_last_posts_users as $post_uname ) :
       $pun = esc_sql($post_uname->topic_last_poster_name);
       $p_unames[] = $pun;
      endforeach;
   endif;
 endif;

  $w3_un_results = array_unique($p_unames); 
 
$query_un ='';
   foreach($w3_un_results as $w3_unames_ava)
   {
    	$query_un .= '\''.$w3_unames_ava.'\',';
   }

 $query_un = substr($query_un, 0, -1);
      
 $w3all_u_ava_urls = self::w3all_get_phpbb_avatars_url($query_un);
 
 if (!empty($w3all_u_ava_urls)){

    foreach( $w3all_u_ava_urls as $ava_set_x ){
   
    	$usid = get_user_by('login', $ava_set_x['uname']);

   	$wp_user_phpbb_avatar[] = array("wpuid" => $usid->ID, "phpbbavaurl" => $ava_set_x['uavaurl']);
  }
}
 
  return $wp_user_phpbb_avatar;

}

public static function w3all_get_phpbb_avatars_url( $w3unames ) {
   global $w3all_config;
  $config = $w3all_config;
  $w3db_conn = self::w3all_db_connect();
	$phpbb_config = self::get_phpbb_config();
// fix here for reported bug
      $uavatars = $w3db_conn->get_results("SELECT username, user_avatar, user_avatar_type FROM ".$config["table_prefix"]."users WHERE username IN(".$w3unames.") ORDER BY user_id DESC");

   	foreach($uavatars as $user_ava) {
   		
     if(!empty($user_ava->user_avatar)){
     	
     		if ( $user_ava->user_avatar_type == 'avatar.driver.local' ){
     			
     			$phpbb_avatar_url = get_option( 'w3all_url_to_cms' ) . '/' . $phpbb_config["avatar_gallery_path"] . '/' . $user_ava->user_avatar;
     			$u_a[] = array("uname" => $user_ava->username, "uavaurl" => $phpbb_avatar_url);
     		
     		} else {
    	
 	        	$avatar_entry = $user_ava->user_avatar;
            $ext = substr(strrchr($avatar_entry, '.'), 1);
	          $avatar_entry	= intval($avatar_entry);
	          $phpbb_avatar_filename = $phpbb_config["avatar_salt"] . '_' . $avatar_entry . '.' . $ext;
            $phpbb_avatar_url = get_option( 'w3all_url_to_cms' ).'/'.$phpbb_config["avatar_path"].'/'.$phpbb_avatar_filename;

    	// in phpBB there is Gravatar as option available as profile image
    	// so if it is the case, the user at this point can have an email address, instead than an image url as value
          $pemail = '/^.*@[-a-z0-9]+\.+[-a-z0-9]+[\.[a-z0-9]+]?/';
         preg_match($pemail, $user_ava->user_avatar, $url_email);
         $phpbb_avatar_url = (empty($url_email)) ? $phpbb_avatar_url : $user_ava->user_avatar;
    
        $u_a[] = array("uname" => $user_ava->username, "uavaurl" => $phpbb_avatar_url);
      }
     }
    } 
    
  return $u_a;
}

public static function wp_w3all_phpbb_custom_avatar( $avatar, $id_or_email, $size, $default, $alt ) {
	
$uids_urls = self::wp_w3all_assoc_phpbb_wp_users();

    if ( is_numeric( $id_or_email ) ) {

        $id = (int) $id_or_email;
        $user = get_user_by( 'id' , $id );

    } elseif ( is_object( $id_or_email ) ) {

        if ( ! empty( $id_or_email->user_id ) ) {
            $id = (int) $id_or_email->user_id;
            $user = get_user_by( 'id' , $id );
        }

    } else {
        $user = get_user_by( 'email', $id_or_email );	
    }

 	if ( isset($user) && $user && is_object( $user ) ) {

     if (!empty($uids_urls)){
    	 	
       foreach($uids_urls as $w3all_wupa) {
     	
    	    $pemail = '/^.*@[-a-z0-9]+\.+[-a-z0-9]+[\.[a-z0-9]+]?/';
          preg_match($pemail, $w3all_wupa["phpbbavaurl"], $is_email);
         
          if(!empty($is_email)) { // if email as value, than we get before the URL
           $w3all_wupa["phpbbavaurl"] = get_avatar_url( $w3all_wupa["phpbbavaurl"] );
          } 
         
          if ( $user->data->ID == $w3all_wupa["wpuid"] ) {
           	  $avatar = $w3all_wupa["phpbbavaurl"];
              $avatar = "<img alt='{$alt}' src='{$avatar}' class='avatar avatar-{$size} photo' height='{$size}' width='{$size}' />";
         } 
       }
     } 
 }
   
    return $avatar;
}

public static function init_w3all_avatars(){
	
	add_filter( 'get_avatar', array( 'WP_w3all_phpbb', 'wp_w3all_phpbb_custom_avatar' ), 10 , 5  );

}

public static function create_phpBB_user_res($wpu) {
	
    $res = self::create_phpBB_user($wpu);
    return $res;
 }  

public static function phpBB_user_session_set_res($wp_user_data){
	
      $res = self::phpBB_user_session_set($wp_user_data);                                 
	   return $res; 
}


public static function phpbb_pass_update_res($user, $new_pass){
	
      $res = self::phpbb_pass_update($user, $new_pass);                                 
	   return $res; 
}


public static function last_forums_topics_res($ntopics){
	
      $topics_display = self::last_forums_topics($ntopics);                                 
	   return $topics_display; 
}


public static function wp_w3all_phpbb_config_init() {
	
        	$phpbb_config = self::get_phpbb_config();
        	
        	return $phpbb_config;
	}




public static function wp_w3all_phpbb_conn_init() {
	
        	$w3db_conn = self::w3all_db_connect();	
        	
        	return $w3db_conn;
	}




} // END class WP_w3all_phpbb
?>