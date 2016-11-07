<?php

// If this file is called directly, abort.
if (!defined('WPINC')) {
    die;
}

function tockify_scripts()
{
    wp_enqueue_script('tockify_embed.js', 'https://public.tockify.com/browser/embed.js');
}

add_action('wp_enqueue_scripts', 'tockify_scripts');

?>
