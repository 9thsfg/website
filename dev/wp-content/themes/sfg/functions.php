<?php
function sfg_enqueue_styles() {

	$parent_style = 'organic_bold_4-style';

	wp_enqueue_style( $parent_style, get_template_directory_uri() . '/style.css' );
	// Below ommited due to stylesheet loading in twice
/*	wp_enqueue_style( 'sfg-style',
		get_stylesheet_directory_uri() . '/style.css',
		array( $parent_style ),
		wp_get_theme()->get('Version')
		);*/
	wp_enqueue_script( 'sfg-custom-js', 
		get_stylesheet_directory_uri() . '/js/custom.js', 
		array( 'jquery' ), 
		wp_get_theme()->get('Version') );
}
add_action( 'wp_enqueue_scripts', 'sfg_enqueue_styles' );
?>