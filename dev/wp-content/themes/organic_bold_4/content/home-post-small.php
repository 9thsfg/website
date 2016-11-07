<?php $features = new WP_Query(array('cat'=>of_get_option('category_features'), 'posts_per_page'=>of_get_option('postnumber_features'), 'suppress_filters'=>0)); ?>
<?php if ($features->have_posts()) : while($features->have_posts()) : $features->the_post(); ?>
<?php if (isset($_POST['featurevid'])){ $custom = get_post_custom($post->ID); $featurevid = $custom['featurevid'][0]; } ?>

<!-- BEGIN .third -->
<div class="third">

	<!-- BEGIN .information -->
	<div class="information">
		
		<?php if ( get_post_meta($post->ID, 'featurevid', true) ) { ?>
			<div class="feature-vid"><?php echo get_post_meta($post->ID, 'featurevid', true); ?></div>
		<?php } else { ?>
			<?php if ( '' != get_the_post_thumbnail()) { ?>
				<a class="feature-img" href="<?php the_permalink(); ?>" rel="bookmark" title="<?php echo esc_attr( sprintf( __( 'Permalink to %s', 'organicthemes' ), the_title_attribute( 'echo=0' ) ) ); ?>"><?php the_post_thumbnail( 'bold-featured-small' ); ?></a>
			<?php } ?>
		<?php } ?>
			
		<!-- BEGIN .holder -->
		<div class="holder">
		
			<!-- BEGIN .padding -->
			<div class="padding">
				
				<h2 class="title"><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h2>
				
				<div class="excerpt">
					<?php the_excerpt(); ?>
				</div>
			
			<!-- END .padding -->
			</div>
		
		<!-- END .holder -->
		</div>
	
	<!-- END .information -->
	</div>

<!-- END .third -->
</div>

<?php endwhile; else : ?>

<!-- BEGIN .information -->
<div class="information">

	<h2 class="title"><?php _e("No Posts Found", 'organicthemes'); ?></h2>
	<p><?php _e("We're sorry, but no posts have been found. Create a post to be added to this section, and configure your theme options.", 'organicthemes'); ?></p>

<!-- END .information -->
</div>

<?php endif; ?>
<?php wp_reset_postdata(); ?>