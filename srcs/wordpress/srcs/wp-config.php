<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'adm' );
define( 'DB_PASSWORD', 'adm' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define( 'AUTH_KEY',         'My)_$Unique$_pHrase$__Phrase_$hmickey1' );
define( 'SECURE_AUTH_KEY',  'My)_$Unique$_pHrase$__Phrase_$hmickey2' );
define( 'LOGGED_IN_KEY',    'My)_$Unique$_pHrase$__Phrase_$hmickey3' );
define( 'NONCE_KEY',        'My)_$Unique$_pHrase$__Phrase_$hmickey4' );
define( 'AUTH_SALT',        'My)_$Unique$_pHrase$__Phrase_$hmickey5' );
define( 'SECURE_AUTH_SALT', 'My)_$Unique$_pHrase$__Phrase_$hmickey6' );
define( 'LOGGED_IN_SALT',   'My)_$Unique$_pHrase$__Phrase_$hmickey7' );
define( 'NONCE_SALT',       'My)_$Unique$_pHrase$__Phrase_$hmickey8' );
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}
require_once( ABSPATH . 'wp-settings.php' );
?>

