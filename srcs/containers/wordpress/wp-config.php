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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
#define( 'DB_NAME', '${WP_DB_NAME}' );
define( 'DB_NAME', 'wp_db' );

/** MySQL database username */
#define( 'DB_USER', '${WP_DB_USER}' );
define( 'DB_USER', 'wordpress_user' );

/** MySQL database password */
#define( 'DB_PASSWORD', '${WP_DB_PASSWORD}' );
define( 'DB_PASSWORD', 'wordpress' );

/** MySQL hostname */
#define( 'DB_HOST', '${WP_DB_HOST}' );
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/** Give wordpress direct access to filesystem to prevent asking for credentials*/
define('FS_METHOD', 'direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'o:q.3aeEzff4,Tjp~&W+AB1VRq-=cl %dNZF!nU`_/7g(m&G-q`FmO/ZoDtGTK7s');
define('SECURE_AUTH_KEY',  '{m5b|BVc&-_U.{:x}fb>`Ofw/2LmrZhsylQ*MImoozb/qdcp<BOfV;_~f{dr2_22');
define('LOGGED_IN_KEY',    'DnZdE&,t+6>O{y}e3=X4r8=4i!P7UOkbJ,`uudu-%K8ITLH|s=63,`9*5.ZJa`jt');
define('NONCE_KEY',        'ON9A5j09#I(l/9%c]^[f-q54HdZjZwkgauDhc+9T>%3vdt8mKNY@f(.AEp}k;UR-');
define('AUTH_SALT',        'nU.lC(z*Y|K6)WPbbsBd(|vsB.i2bVv644mS]`Jq-WP-o #+L{*v~0UxML*a}I(e');
define('SECURE_AUTH_SALT', 'R{UQ$Q^:C${6yI{m$.~E8iP$kMdx>8H}0t-sH?mBg)Wi~C m0V.>pRl0kfND|X=M');
define('LOGGED_IN_SALT',   '7Rz2.%8roLgl$=#RZVugLBlRVM)D/bI_?_+#p*sqV-h>g>>]QLN]w`CtoOLDu]^1');
define('NONCE_SALT',       '.,7|-X$CdA35hGS,2]`}p})H5X=D?rpbn%F?gD7~f(b^*ozi-O~G)F.k%IV 2m+y');
/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
