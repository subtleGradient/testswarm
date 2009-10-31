<?php
	$browser = "";
	$version = "";
	$os = "";
	$ip = getRealIpAddr();
	$useragent = $_SERVER['HTTP_USER_AGENT'];
	$useragent_id = 0;

	$lowerUA = strtolower($useragent);

	if ( preg_match("/.+(rv|applewebkit|presto|msie|konqueror)[\/: ]([0-9a-z.]+)/", $lowerUA, $match) ) {
		$version = $match[2];
	}

	if ( preg_match("/ms-rtc lm 8/", $lowerUA) ) {
		$version = "8.0as7.0";
	}

	if ( strpos($lowerUA, "msie") > -1 ) {
  	$browser = "msie";
	} else if ( strpos($lowerUA, "konqueror") > -1 ) {
		$browser = "konqueror";
	} else if ( strpos($lowerUA, "webkit") > -1 ) {
		$browser = "webkit";
	} else if ( strpos($lowerUA, "presto") > -1 ) {
		$browser = "presto";
	} else if ( strpos($lowerUA, "gecko") > -1 ) {
		$browser = "gecko";
	} else if ( strpos($lowerUA, "chrome") > -1 ) {
		$browser = "chrome";
	}

	if ( strpos($lowerUA, "windows nt 6.1") > -1 ) {
		$os = "win7";
	} else if ( strpos($lowerUA, "windows nt 6.0") > -1 ) {
		$os = "vista";
	} else if ( strpos($lowerUA, "windows nt 5.2") > -1 ) {
		$os = "2003";
	} else if ( strpos($lowerUA, "windows nt 5.1") > -1 ) {
		$os = "xp";
	} else if ( strpos($lowerUA, "windows nt 5.0") > -1 ) {
		$os = "2000";
	} else if ( strpos($lowerUA, "os x 10.4") > -1 || strpos($lowerUA, "os x 10_4") > -1 ) {
		$os = "osx10.4";
	} else if ( strpos($lowerUA, "os x 10.5") > -1 || strpos($lowerUA, "os x 10_5") > -1 ) {
		$os = "osx10.5";
	} else if ( strpos($lowerUA, "os x 10.6") > -1 || strpos($lowerUA, "os x 10_6") > -1 ) {
		$os = "osx10.6";
	} else if ( strpos($lowerUA, "os x") > -1 ) {
		$os = "osx";
	} else if ( strpos($lowerUA, "linux") > -1 ) {
		$os = "linux";
	}

	// From: http://roshanbh.com.np/2007/12/getting-real-ip-address-in-php.html
	function getRealIpAddr() {
    		if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
      			$ip=$_SERVER['HTTP_CLIENT_IP'];
    		} elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
      			$ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
    		} else {
      			$ip=$_SERVER['REMOTE_ADDR'];
    		}
    		return $ip;
	}
?>
