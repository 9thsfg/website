<?php

/*
 * Bluethrust Clan Scripts v4
 * Copyright 2014
 *
 * Author: Bluethrust Web Development
 * E-mail: support@bluethrust.com
 * Website: http://www.bluethrust.com
 *
 * License: http://www.bluethrust.com/license.php
 *
 */

include_once("../../../../../_setup.php");
include_once("../../../../../classes/member.php");
include_once("../../../../../classes/rank.php");



$member = new Member($mysqli);
$member->select($_SESSION['btUsername']);

$consoleObj = new ConsoleOption($mysqli);

$cID = $consoleObj->findConsoleIDByName("Add Profile Option");
$consoleObj->select($cID);
$checkAccess1 = $member->hasAccess($consoleObj);

$cID = $consoleObj->findConsoleIDByName("Manage Profile Options");
$consoleObj->select($cID);
$checkAccess2 = $member->hasAccess($consoleObj);

$checkAccess = $checkAccess1 || $checkAccess2;

if($member->authorizeLogin($_SESSION['btPassword'])) {

	
	$memberInfo = $member->get_info_filtered();
	
	if($checkAccess) {
		
		if(trim($_POST['selectValue']) != "") {
			$_SESSION['btProfileCache'][] = $_POST['selectValue'];
		}
		
		$_SESSION['btProfileCacheRefresh'] = true;
	
		include("view.php");
	
	}
	
	
}


?>