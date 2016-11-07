<?php if (of_get_option('display_news_cat') == '1') { ?>

<h4 class="headline category-title text-center"><?php echo esc_html( bold_cat_id_to_name(of_get_option('category_news') ) ); ?></h4>

<?php } ?>

<?php if ( get_query_var('paged') ) { $paged = get_query_var('paged'); } elseif ( get_query_var('page') ) { $paged = get_query_var('page'); } else { $paged = 1; } ?>
<?php $news = new WP_Query(array('cat'=>of_get_option('category_news'), 'posts_per_page'=>of_get_option('postnumber_news'), 'paged'=>$paged, 'suppress_filters'=>0)); ?>
<?php if ($news->have_posts()) : while($news->have_posts()) : $news->the_post(); ?>
<?php $thumb = ( '' != get_the_post_thumbnail() ) ? wp_get_attachment_image_src( get_post_thumbnail_id(), 'bold-featured-medium' ) : false; ?>
<?php if (isset($_POST['featurevid'])){ $custom = get_post_custom($post->ID); $featurevid = $custom['featurevid'][0]; } ?>

<!-- BEGIN .information -->
<div class="information">
	
<?php if ( '' != get_the_post_thumbnail() || get_post_meta($post->ID, 'featurevid', true) ) { ?>
	
	<!-- BEGIN .six columns -->
	<div class="six columns">
		
		<?php if ( get_post_meta($post->ID, 'featurevid', true) ) { ?>
			<div class="feature-vid"><?php echo get_post_meta($post->ID, 'featurevid', true); ?></div>
		<?php } else { ?>
			<a class="feature-img" <?php if ( ! empty( $thumb ) ) { ?> style="background-image: url(<?php echo $thumb[0]; ?>);" <?php } ?> href="<?php the_permalink(); ?>" rel="bookmark" title="<?php echo esc_attr( sprintf( __( 'Permalink to %s', 'organicthemes' ), the_title_attribute( 'echo=0' ) ) ); ?>"><?php the_post_thumbnail( 'bold-featured-medium' ); ?></a>
		<?php } ?>

	<!-- END .six columns -->
	</div>

	<!-- BEGIN .ten columns -->
	<div class="ten columns">
		
		<!-- BEGIN .holder -->
		<div class="holder">
		
			<!-- BEGIN .padding -->
			<div class="padding">
			
				<div class="post-author">
					<p><i class="fa fa-clock-o"></i> &nbsp;<?php _e("Posted on", 'organicthemes'); ?> <?php the_time(__("F j, Y", 'organicthemes')); ?></p>
				</div>
				
				<h2 class="title"><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h2>
				
				<div class="excerpt">
					<?php the_excerpt(); ?>
				</div>
			
			<!-- END .padding -->
			</div>
		
		<!-- END .holder -->
		</div>
	
	<!-- END .ten columns -->
	</div>

<?php } else { ?>

	<!-- BEGIN .sixteen columns -->
	<div class="sixteen columns">
	
		<div class="post-author">
			<p><i class="fa fa-clock-o"></i> &nbsp;<?php _e("Posted on", 'organicthemes'); ?> <?php the_time(__("F j, Y", 'organicthemes')); ?></p>
		</div>
		
		<h2 class="title"><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h2>
		
		<div class="excerpt">
			<?php the_excerpt(); ?>
		</div>
	
	<!-- END .sixteen columns -->
	</div>

<?php } ?>

<!-- END .information -->
</div>

<?php endwhile; ?>

<?php if ($news->max_num_pages > 1) { ?>
	<!-- BEGIN .pagination -->
	<div class="pagination">
		<?php
		$big = 999999999; // need an unlikely integer
		echo paginate_links( array(
			'base' => str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),
			'format' => '?paged=%#%',
			'current' => max( 1, get_query_var('paged') ),
			'prev_text' => __('&laquo;', 'organicthemes'),
			'next_text' => __('&raquo;', 'organicthemes'),
			'total' => $news->max_num_pages
		) );
		?>
	<!-- END .pagination -->
	</div>
<?php } ?>

<?php else : ?>

<!-- BEGIN .information -->
<div class="information">

	<h2 class="title"><?php _e("No Posts Found", 'organicthemes'); ?></h2>
	<p><?php _e("We're sorry, but no posts have been found. Create a post to be added to this section, and configure your theme options.", 'organicthemes'); ?></p>

<!-- END .information -->
</div>

<?php endif; ?>
<?php wp_reset_postdata(); ?>