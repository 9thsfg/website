<?php
/**
Template Name: Archives
*
* This template is used to display site archives of posts, pages and categories.
*
* @package Bold
* @since Bold 4.0
*
*/
get_header(); ?>

<?php $thumb = ( '' != get_the_post_thumbnail() ) ? wp_get_attachment_image_src( get_post_thumbnail_id(), 'bold-featured-large' ) : false; ?>

<!-- BEGIN .post class -->
<div <?php post_class(); ?> id="page-<?php the_ID(); ?>">

	<?php if ( has_post_thumbnail()) { ?>
		<div class="feature-img page-banner" <?php if ( ! empty( $thumb ) ) { ?> style="background-image: url(<?php echo $thumb[0]; ?>);" <?php } ?>>
			<?php the_post_thumbnail( 'bold-featured-large' ); ?>
		</div>
	<?php } ?>
	
	<!-- BEGIN .row -->
	<div class="row">
	
		<!-- BEGIN .content -->
		<div class="content">
		
			<!-- BEGIN .sixteen columns -->
			<div class="sixteen columns">
				
				<!-- BEGIN .postarea full -->
				<div class="postarea full">
				
					<h1 class="headline"><?php the_title(); ?></h1>
					
					<div class="archive-column">
						<h6><?php _e("By Page:", 'organicthemes'); ?></h6>
						<ul><?php wp_list_pages('title_li='); ?></ul>
					</div>
					
					<div class="archive-column">
						<h6><?php _e("By Post:", 'organicthemes'); ?></h6>
						<ul><?php wp_get_archives('type=postbypost&limit=100'); ?></ul>
					</div>
					
					<div class="archive-column last">
						<h6><?php _e("By Month:", 'organicthemes'); ?></h6>
						<ul><?php wp_get_archives('type=monthly'); ?></ul>
						
						<h6><?php _e("By Category:", 'organicthemes'); ?></h6>
						<ul><?php wp_list_categories('sort_column=name&title_li='); ?></ul>
					</div>
				
				<!-- END .postarea full -->
				</div>
			
			<!-- END .sixteen columns -->
			</div>
		
		<!-- END .content -->
		</div>
	
	<!-- END .row -->
	</div>

<!-- END .post class -->
</div>

<?php get_footer(); ?>