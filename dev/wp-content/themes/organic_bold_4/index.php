<?php
/**
* This template displays single post content.
*
* @package Bold
* @since Bold 4.0
*
*/
get_header(); ?>

<?php $thumb = ( '' != get_the_post_thumbnail() ) ? wp_get_attachment_image_src( get_post_thumbnail_id(), 'bold-featured-large' ) : false; ?>

<!-- BEGIN .post class -->
<div <?php post_class(); ?> id="post-<?php the_ID(); ?>">

	<?php if (has_post_format('gallery')) { ?>
	
		<?php get_template_part( 'content/gallery', 'slider' ); ?>
		
	<?php } else { ?>
	
		<?php if(of_get_option('display_feature_post') == '1') { ?>
			<?php if ( get_post_meta($post->ID, 'featurevid', true) ) { ?>
				<div class="feature-vid banner"><?php echo get_post_meta($post->ID, 'featurevid', true); ?></div>
			<?php } else { ?>
				<?php if ( '' != get_the_post_thumbnail()) { ?>
					<div class="feature-img page-banner" <?php if ( ! empty( $thumb ) ) { ?> style="background-image: url(<?php echo $thumb[0]; ?>);" <?php } ?>>
						<?php the_post_thumbnail( 'bold-featured-large' ); ?>
					</div>
				<?php } ?>
			<?php } ?>
		<?php } ?>
	
	<?php } ?>

	<!-- BEGIN .row -->
	<div class="row">
	
		<!-- BEGIN .content -->
		<div class="content">
	
		<?php if ( is_active_sidebar( 'post-sidebar' ) ) : ?>
			
			<!-- BEGIN .eleven columns -->
			<div class="eleven columns">
	
				<!-- BEGIN .postarea -->
				<div class="postarea">
		
					<?php get_template_part( 'loop', 'post' ); ?>
				
				<!-- END .postarea -->
				</div>
			
			<!-- END .eleven columns -->
			</div>
			
			<!-- BEGIN .five columns -->
			<div class="five columns">
			
				<?php get_sidebar('post'); ?>
				
			<!-- END .five columns -->
			</div>
	
		<?php else : ?>
	
			<!-- BEGIN .sixteen columns -->
			<div class="sixteen columns">
	
				<!-- BEGIN .postarea full -->
				<div class="postarea full">
		
					<?php get_template_part( 'loop', 'post' ); ?>
				
				<!-- END .postarea full -->
				</div>
			
			<!-- END .sixteen columns -->
			</div>
	
		<?php endif; ?>
		
		<!-- END .content -->
		</div>

	<!-- END .row -->
	</div>

<!-- END .post class -->
</div>

<?php get_footer(); ?>