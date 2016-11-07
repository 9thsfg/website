<?php
require 'PasswordHash.php';

# Try to use stronger but system-specific hashes, with a possible fallback to
# the weaker portable hashes.
$t_hasher = new PasswordHash(8, FALSE);

$hash = $t_hasher->HashPassword($w3password);

//print 'Hash: ' . $hash . "\n";
?>