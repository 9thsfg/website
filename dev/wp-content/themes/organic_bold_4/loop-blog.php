<?php if (isset($_POST['featurevid'])){ $custom = get_post_custom($post->ID); $featurevid = $custom['featurevid'][0]; } ?>

<!-- BEGIN .post class -->
<div <?php post_class(); ?> id="post-<?php the_ID(); ?>">
	
	<div class="post-author">
		<p class="text-center"><i class="fa fa-clock-o"></i> &nbsp;<?php _e("Posted on", 'organicthemes'); ?> <?php the_time(__("F j, Y", 'organicthemes')); ?> <?php _e("by", 'organicthemes'); ?> <?php esc_url ( the_author_posts_link() ); ?></p>
	</div>

	<h2 class="headline"><a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php esc_attr(the_title_attribute()); ?>"><?php the_title(); ?></a></h2>
	
	<?php if ( get_post_meta($post->ID, 'featurevid', true) ) { ?>
		<div class="feature-vid"><?php echo get_post_meta($post->ID, 'featurevid', true); ?></div>
	<?php } else { ?>
		<?php if ( '' != get_the_post_thumbnail()) { ?>
			<a class="feature-img" href="<?php the_permalink(); ?>" rel="bookmark" title="<?php echo esc_attr( sprintf( __( 'Permalink to %s', 'organicthemes' ), the_title_attribute( 'echo=0' ) ) ); ?>"><?php the_post_thumbnail( 'featured-large' ); ?></a>
		<?php } ?>
	<?php } ?>
	
	<!-- BEGIN .article -->
	<div class="article">
		<?php the_content(__("Read More", 'organicthemes')); ?>
	<!-- END .article -->
	</div>
	
	<?php if(of_get_option('display_social_blog') == '1') { ?>
	<div class="social radius-full">
		<div class="like-btn">
			<div class="fb-like" href="<?php the_permalink(); ?>" data-send="false" data-layout="button_count" data-width="100" data-show-faces="false"></div>
		</div>
		<div class="tweet-btn">
			<a href="http://twitter.com/share" class="twitter-share-button"
			data-url="<?php the_permalink(); ?>"
			data-via="<?php echo of_get_option('twitter_user'); ?>"
			data-text="<?php the_title(); ?>"
			data-related=""
			data-count="horizontal"><?php _e("Tweet", 'organicthemes'); ?></a>
		</div>
		<div class="plus-btn">
			<g:plusone size="medium" annotation="bubble" href="<?php the_permalink(); ?>"></g:plusone>
		</div>
	</div>
	<?php } ?>

<!-- END .post class -->
</div>