<?php
class WP_w3all_widget_login extends WP_Widget 
{ 

	function __construct() {
		load_plugin_textdomain( 'wp_w3all_phpbb' );
		
		parent::__construct(
			'wp_w3all_widget_login',
			__( 'WP phpBB w3all Login' , 'wp_w3all_phpbb'),
			array( 'description' => __( 'Display the widget WP phpBB login form' , 'wp_w3all_phpbb') )
		);

	}

public function widget( $args, $instance ) {
		  
		echo $args['before_widget'];
		if ( ! empty( $instance['title'] ) ) {
			echo $args['before_title'] . apply_filters( 'widget_title', $instance['title'] ). $args['after_title'];
		}
		echo __( self::wp_w3all_to_phpbb_form(), 'wp_w3all_phpbb' );
		echo $args['after_widget'];
		
	}
	
public function form( $instance ) {
	
	
		$title = ! empty( $instance['title'] ) ? $instance['title'] : __( 'Login', 'wp_w3all_phpbb' );
		$title_logout = ! empty( $instance['title_logout'] ) ? $instance['title_logout'] : __( 'Logout', 'wp_w3all_phpbb' );
		
		?>
		<p>
		<label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Text for login:' ); ?></label> 
		<input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'title' ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>">
		</p>
		<p>
		<label for="<?php echo $this->get_field_id( 'title_logout' ); ?>"><?php _e( 'Text for logout:' ); ?></label> 
		<input class="widefat" id="<?php echo $this->get_field_id( 'title_logout' ); ?>" name="<?php echo $this->get_field_name( 'title_logout' ); ?>" type="text" value="<?php echo esc_attr( $title_logout ); ?>">
		</p>
		<?php 
}

public function wp_w3all_to_phpbb_form() {
	
	    global $w3all_url_to_cms;
		$phpbb_config = WP_w3all_phpbb::wp_w3all_phpbb_config_init();
		$sid = $phpbb_config["cookie_name"].'_sid';
		$file = WPW3ALL_PLUGIN_DIR . 'views/phpbb_login_form.php';
		
		include( $file );

}

} // END CLASS



class WP_w3all_widget_last_topics extends WP_Widget 
{
	
	

	function __construct() {
		load_plugin_textdomain( 'wp_w3all_phpbb' );
		
		parent::__construct(
			'wp_w3all_widget_last_topics',
			__( 'WP phpBB w3all Last Topics' , 'wp_w3all_phpbb'),
			array( 'description' => __( 'Display the widget WP phpBB last forums topics' , 'wp_w3all_phpbb') )
		);

	}

public function widget( $args, $instance ) {
	
		echo $args['before_widget'];
		if ( ! empty( $instance['title'] ) ) {
			echo $args['before_title'] . apply_filters( 'widget_title', $instance['title'] ). $args['after_title'];
		}
		
 $post_text = (empty($instance['post_text']) OR $instance['post_text'] == 0) ? '0' : $instance['post_text']; // we need 0 or 1

		echo __( self::wp_w3all_phpbb_last_topics( $post_text, $instance['topics_number'], $instance['post_text_words']), 'wp_w3all_phpbb' );
		echo $args['after_widget'];
		
	}
	
public function form( $instance ) {
	
		$title = ! empty( $instance['title'] ) ? $instance['title'] : __( 'Last Topics Posts', 'wp_w3all_phpbb' );
		$topics_number = ! empty( $instance['topics_number'] ) ? $instance['topics_number'] : __( '5', 'wp_w3all_phpbb' );
		$w3all_phpbb_display_topics_post_text = ! empty( $instance['post_text'] ) ? $instance['post_text'] : __( '0', 'wp_w3all_phpbb' );
    $post_text_words = ! empty( $instance['post_text_words'] ) ? $instance['post_text_words'] : __( '30', 'wp_w3all_phpbb' );
		?>
		<p>
		<label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e( 'Title:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'title' ); ?>" type="text" value="<?php echo esc_attr( $title ); ?>">
		</p>
			<p>
		<label for="<?php echo $this->get_field_id( 'topics_number' ); ?>"><?php _e( 'Number of last topics to display:' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'topics_number' ); ?>" name="<?php echo $this->get_field_name( 'topics_number' ); ?>" type="text" value="<?php echo esc_attr( $topics_number ); ?>">
		</p>
			<p>
		<label for="<?php echo $this->get_field_id( 'post_text' ); ?>"><?php _e( 'Display listed topics with post text?' ); ?></label> 
	  <p><label""><input class="widefat" name="<?php echo $this->get_field_name( 'post_text' ); ?>" id="<?php echo $this->get_field_id( 'post_text' ); ?>" type="radio" value="0" <?php if ( 0 == $w3all_phpbb_display_topics_post_text ) echo 'checked="checked"'; ?> /> <?php esc_html_e('No', 'wp_w3all_phpbb'); ?></label></p>
    <p><label""><input class="widefat" name="<?php echo $this->get_field_name( 'post_text' ); ?>" id="<?php echo $this->get_field_id( 'post_text' ); ?>" type="radio" value="1" <?php if ( 1 == $w3all_phpbb_display_topics_post_text ) echo 'checked="checked"'; ?> /> <?php esc_html_e('Yes', 'wp_w3all_phpbb'); ?></label></p>
 		
 		</p>
			<p>
		<label for="<?php echo $this->get_field_id( 'post_text_words' ); ?>"><?php _e( 'Number of text words to display for each listed topic on this widget (affect only if above option is active).' ); ?></label> 
			<input class="widefat" id="<?php echo $this->get_field_id( 'post_text_words' ); ?>" name="<?php echo $this->get_field_name( 'post_text_words' ); ?>" type="text" value="<?php echo esc_attr( $post_text_words ); ?>">
		</p>
		<?php	
}
public function update( $new_instance, $old_instance ) {
	
		 $instance = array();
		 $instance['title'] = ( ! empty( $new_instance['title'] ) ) ? strip_tags( $new_instance['title'] ) : '';
	   $instance['topics_number'] = ( ! empty( $new_instance['topics_number'] ) ) ? strip_tags( $new_instance['topics_number'] ) : '';
	   $instance['post_text'] = ( ! empty( $new_instance['post_text'] ) ) ? strip_tags( $new_instance['post_text'] ) : '';
     $instance['post_text_words'] = ( ! empty( $new_instance['post_text_words'] ) ) ? strip_tags( $new_instance['post_text_words'] ) : '';
 
    return $instance;
	}

public function wp_w3all_phpbb_last_topics($post_text, $topics_number, $text_words) {
	
  global $w3all_url_to_cms, $w3all_get_phpbb_avatar_yn, $w3all_last_t_avatar_yn, $w3all_last_t_avatar_dim;
 
   $wp_w3all_post_text = $post_text;
   $wp_w3all_text_words = $text_words;
   
	  $last_topics =	WP_w3all_phpbb::last_forums_topics_res($topics_number);
	  
		$file = WPW3ALL_PLUGIN_DIR . 'views/phpbb_last_topics.php';
	   include( $file );
}


} // END CLASS


function wp_w3all_register_widgets() {
	register_widget( 'WP_w3all_widget_login' );
	register_widget( 'WP_w3all_widget_last_topics' );
}	

add_action( 'widgets_init', 'wp_w3all_register_widgets' );
