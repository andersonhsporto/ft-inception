<?php
/**
* The base configuration for WordPress
*
* The wp-config.php creation script uses this file during the
* installation. You don't have to use the web site, you can
* copy this file to "wp-config.php" and fill in the values.
*
* This file contains the following configurations:
*
* * MySQL settings
* * Secret keys
* * Database table prefix
* * ABSPATH
*
* @link https://wordpress.org/support/article/editing-wp-config-php/
*
* @package WordPress
*/

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv("MARIADB_DATABASE") );
/** MySQL database username */
define( 'DB_USER', getenv("MARIADB_USER") );

/** MySQL database password */
define( 'DB_PASSWORD', getenv("MARIADB_PASSWORD") );

/** MySQL hostname */
define( 'DB_HOST', getenv("MARIADB_HOST") );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
* Authentication Unique Keys and Salts.
*
* Change these to different unique phrases!
* You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
*
* You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
*
* @since 2.6.0
*/
define( 'AUTH_KEY',         'Three rings for the Elven - kings under the sky' );
define( 'SECURE_AUTH_KEY',  'Seven for the Dwarf - lords in their halls of stone' );
define( 'LOGGED_IN_KEY',    'Nine for the Mortal Men doomed to die' );
define( 'NONCE_KEY',        'One for the Dark Lord on his dark throne' );
define( 'AUTH_SALT',        'In the Land of Mordor where the Shadows lie' );
define( 'SECURE_AUTH_SALT', 'One Ring to rule them all, One Ring to find them' );
define( 'LOGGED_IN_SALT',   'One Ring to bring them all and in the darkness bind them' );
define( 'NONCE_SALT',       'In the Land of Mordor where the Shadows lie' );
/**#@-*/
/**
* WordPress database table prefix.
*
* You can have multiple installations in one database if you give each
* a unique prefix. Only numbers, letters, and underscores please!
*/
$table_prefix = 'wp_';
/**
* For developers: WordPress debugging mode.
*
* Change this to true to enable the display of notices during development.
* It is strongly recommended that plugin and theme developers use WP_DEBUG
* in their development environments.
*
* For information on other constants that can be used for debugging,
* visit the documentation.
*
* @link https://wordpress.org/support/article/debugging-in-wordpress/
*/
define( 'WP_DEBUG', false );
/* Add any custom values between this line and the "stop editing" line. */
/* That's all, stop editing! Happy publishing. */
/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
   define( 'ABSPATH', __DIR__ . '/' );
}
/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
