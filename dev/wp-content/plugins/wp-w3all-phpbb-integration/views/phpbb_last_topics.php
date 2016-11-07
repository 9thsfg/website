<div class="wrap">
<div style="margin-bottom:8px;"><b>Updated Topics on Forums</b></div>

<?php
$phpbb_on_template_iframe = get_option( 'w3all_iframe_phpbb_link_yn' );
$w3all_phpbb_display_topics_how = get_option( 'w3all_phpbb_display_topics_how' );

$w3all_avatars_yn = ( $w3all_get_phpbb_avatar_yn == 1 && $w3all_last_t_avatar_yn == 1 ) ? true : false; // avatars or not

if ( ! $w3all_avatars_yn  ){ 
	   echo "<ul>";
	 }
	 
foreach ($last_topics as $key => $value) {

	if ( $w3all_avatars_yn ){
	
			  $wpu = get_user_by('login', $value->topic_last_poster_name); 
			  
			  if( ! $wpu ){
			  	
			  	$w3all_avatar_display = get_avatar(0, $w3all_last_t_avatar_dim);
			  } else {
      	
     	      $w3all_avatar_display = ( $wpu == true ) ? get_avatar($wpu->ID, $w3all_last_t_avatar_dim) : '';  	
          }
  } 
 
	$value->topic_last_poster_name = (empty($value->topic_last_poster_name)) ? __( 'Guest', 'wp_w3all_phpbb' ) : $value->topic_last_poster_name;

 if ( $wp_w3all_post_text == 1 ){
   $value->post_text = wp_w3all_remove_bbcode_tags($value->post_text, $wp_w3all_text_words);
  }

  if ( $phpbb_on_template_iframe == 1 ){ // if on iframe mode, links are in this way
  	
  	global $wp_w3all_forum_folder_wp;
  	
  	if ( $wp_w3all_post_text == 0 ){ // only links author and date display: 
  	
  	     	if ( $w3all_avatars_yn ){
  	     		   
  	     		  echo "<div><table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:middle;margin:0;border:0;\"><tr><td style=\"border:0;width:".$w3all_last_t_avatar_dim."px;\">".$w3all_avatar_display."</td><td style=\"border:0;width:auto\"><a href=\"index.php/$wp_w3all_forum_folder_wp/?forum_id=$value->forum_id&amp;topic_id=$value->topic_id&amp;post_id=$value->post_id#p$value->post_id\" title=\"Last Post: $value->post_subject\">$value->topic_title</a><br />by $value->topic_last_poster_name at ".date_i18n( 'H:i Y-m-d', $value->topic_last_post_time )."</td></tr></table></div>";
 
  	     	} else {
  	     		
  	     		echo "<li><a href=\"index.php/$wp_w3all_forum_folder_wp/?forum_id=$value->forum_id&amp;topic_id=$value->topic_id&amp;post_id=$value->post_id#p$value->post_id\" title=\"Last Post: $value->post_subject\">$value->topic_title</a><br />by $value->topic_last_poster_name at ".date_i18n( 'H:i Y-m-d', $value->topic_last_post_time )."</li>";
     
  	     	}
  
      } 
      
  if ( $wp_w3all_post_text == 1 ){ // links, post text, author and date
  	   
  	   if ( $w3all_avatars_yn ){
  	   	
  	   	  echo "<div><table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:middle;margin:0;border:0;\"><tr><td style=\"border:0;width:".$w3all_last_t_avatar_dim."px;\">".$w3all_avatar_display."</td><td style=\"border:0;width:auto\"><a href=\"index.php/$wp_w3all_forum_folder_wp/?forum_id=$value->forum_id&amp;topic_id=$value->topic_id&amp;post_id=$value->post_id#p$value->post_id\" title=\"Last Post: $value->post_subject\">$value->topic_title</a><br />$value->post_text ...<br />by $value->topic_last_poster_name at ".date_i18n( 'H:i Y-m-d', $value->topic_last_post_time )."</td></tr></table></div>";
      
       } else {
  	  	        echo "<li><a href=\"index.php/$wp_w3all_forum_folder_wp/?forum_id=$value->forum_id&amp;topic_id=$value->topic_id&amp;post_id=$value->post_id#p$value->post_id\" title=\"Last Post: $value->post_subject\">$value->topic_title</a><br />$value->post_text ...<br />by $value->topic_last_poster_name at ".date_i18n( 'H:i Y-m-d', $value->topic_last_post_time )."</li>";
     
  	          }
  }
  
  
   } else { // if not iframe phpBB embedded mode, direct url
   	
     	 if ( $wp_w3all_post_text == 0 ){ // only links author and date
     		
     		if ( $w3all_avatars_yn ){
     			
     			echo "<div><table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:middle;margin:0;border:0;\"><tr><td style=\"border:0;width:".$w3all_last_t_avatar_dim."px;\">".$w3all_avatar_display."</td><td style=\"border:0;width:auto\"><a href=\"$w3all_url_to_cms/viewtopic.php?f=$value->forum_id&amp;t=$value->topic_id&amp;p=$value->post_id#p$value->post_id\" title=\"Last Post: $value->post_subject\">$value->topic_title</a><br />by $value->topic_last_poster_name at ".date_i18n( 'H:i Y-m-d', $value->topic_last_post_time )."</td></tr></table></div>";
         
         } else {
     			        
     			        echo "<li><a href=\"$w3all_url_to_cms/viewtopic.php?f=$value->forum_id&amp;t=$value->topic_id&amp;p=$value->post_id#p$value->post_id\" title=\"Last Post: $value->post_subject\">$value->topic_title</a><br />by $value->topic_last_poster_name at ".date_i18n( 'H:i Y-m-d', $value->topic_last_post_time )."</li>";
                }
       }
    
         if ( $wp_w3all_post_text == 1 ){ // links, post text, author and date
         	
         	if ( $w3all_avatars_yn ){
         		
         		 echo "<div><table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:middle;margin:0;border:0;\"><tr><td style=\"border:0;width:".$w3all_last_t_avatar_dim."px;\">".$w3all_avatar_display."</td><td style=\"border:0;width:auto\"><a href=\"$w3all_url_to_cms/viewtopic.php?f=$value->forum_id&amp;t=$value->topic_id&amp;p=$value->post_id#p$value->post_id\" title=\"Last Post: $value->post_subject\">$value->topic_title</a><br />$value->post_text ...<br />by $value->topic_last_poster_name at ".date_i18n( 'H:i Y-m-d', $value->topic_last_post_time )."</td></tr></table></div>";
          
            } else {
           	
         		         echo "<li><a href=\"$w3all_url_to_cms/viewtopic.php?f=$value->forum_id&amp;t=$value->topic_id&amp;p=$value->post_id#p$value->post_id\" title=\"Last Post: $value->post_subject\">$value->topic_title</a><br />$value->post_text ...<br />by $value->topic_last_poster_name at ".date_i18n( 'H:i Y-m-d', $value->topic_last_post_time )."</li>";
                  }
         }
     }
  
} // END foreach

   if ( ! $w3all_avatars_yn  ){ 
	   echo "</ul>";
	 } 
?>
</div>