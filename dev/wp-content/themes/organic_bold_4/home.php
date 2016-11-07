<?php
/**
* This template is used to display the home page.
*
* @package Bold
* @since Bold 4.0
*
*/
get_header(); ?>

<!-- BEGIN .row -->
<div class="row">

	<!-- BEGIN .sixteen columns -->
	<div class="sixteen columns">
		
		<!-- BEGIN .home-slider -->
		<div class="home-slider">
		
			<?php get_template_part( 'content/featured', 'slider' ); ?>
			
		<!-- END .home-slider -->
		</div>

	<!-- END .sixteen columns -->
	</div>

<!-- END .row -->
</div>

<!-- BEGIN .row -->
<div class="row">
	
	<!-- BEGIN .homepage -->
	<div class="homepage">
	
	<?php if (of_get_option('display_home_mid') == '1') { ?>
	<?php if ( '-1' != of_get_option( 'category_features' ) ) { ?>
		
		<!-- BEGIN .sixteen columns -->
		<div class="sixteen columns">
		
			<!-- BEGIN .featured-posts -->
			<div class="featured-posts thin">
				
					<?php get_template_part( 'content/home', 'post-small' ); ?>
		
			<!-- END .featured-posts -->
			</div>
			
		<!-- END .sixteen columns -->
		</div>

	<?php } ?>
	<?php } ?>
	
	<?php if (of_get_option('display_home_bottom') == '1') { ?>
	<?php if ( '-1' != of_get_option( 'category_news' ) ) { ?>
		
		<!-- BEGIN .sixteen columns -->
		<div class="sixteen columns">
		
			<!-- BEGIN .featured-posts -->
			<div class="featured-posts wide">
				
					<?php get_template_part( 'content/home', 'post-wide' ); ?>
		
			<!-- END .featured-posts -->
			</div>
			
		<!-- END .sixteen columns -->
		</div>

	<?php } ?>
	<?php } ?>

	<!-- END .homepage -->
	</div>

<!-- END .row -->
</div>

<?php get_footer(); ?>