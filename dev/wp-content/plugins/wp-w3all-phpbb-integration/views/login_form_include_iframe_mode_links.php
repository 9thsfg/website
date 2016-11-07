<?php
	$wp_w3all_forum_folder_wp = "index.php/" . $wp_w3all_forum_folder_wp;
	$w3urlscheme = parse_url($w3all_url_to_cms);
  $w3urlscheme = $w3urlscheme['scheme'];
?>
<div class="wrap">
		<?php if ( ! is_user_logged_in() ){ ?>
<form method="post" action="<?php echo $w3all_url_to_cms; ?>/ucp.php?mode=login" class="headerspace">
	<h3><a href="<?php echo $wp_w3all_forum_folder_wp; ?>/?mode=login">Login</a>&nbsp; - &nbsp;<a href="<?php echo $wp_w3all_forum_folder_wp; ?>/?mode=register">Register</a></h3>
<label for="username"><span>Username:</span> <input type="text" tabindex="1" name="username" id="username" size="10" class="" title="Username"></label>
			<label for="password"><br /><span>Password:&nbsp;</span> <input type="password" tabindex="2" name="password" id="password" size="10" class="" title="Password" autocomplete="off"></label>
							<br /><br /><a href="<?php echo $wp_w3all_forum_folder_wp; ?>/?mode=sendpassword">I forgot my password</a>
										&nbsp; <label for="autologin">Remember me <input type="checkbox" tabindex="4" name="autologin" id="autologin"></label>
						<input type="submit" tabindex="5" name="login" value="Login" class="">
			<input type="hidden" name="redirect" value="<?php echo $w3urlscheme . "://" . $_SERVER['SERVER_NAME'].$_SERVER['PHP_SELF']; ?>">
	</form>
	<?php } ?>
	
	<?php if ( is_user_logged_in() ){ 
		
		if ( preg_match('/[^0-9A-Za-z]/',$_COOKIE[$sid]) ){
			
			  unset( $_COOKIE[$sid] );
			  die("Clean up cookie on your browser please!");
		} else { ?>
			
	<a href="<?php echo $wp_w3all_forum_folder_wp; ?>/?mode=logout&amp;sid=<?php echo $_COOKIE["$sid"]; ?>&amp;redirect=<?php echo get_home_url() . "/wp-login.php?action=logout"; ?>">Logout</a>
<?php } 
     } ?>
</div>