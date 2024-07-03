<?php

# Website's base configuration details
define( 'DB_NAME', getenv('MARIADB_DATABASE') );
define( 'DB_USER', getenv('MARIADB_USER') );
define( 'DB_PASSWORD', getenv('MARIADB_PASSWORD') );
define( 'DB_HOST', 'mariadb:3306' ); 

define('WP_HOME', 'https://mnegro.42.fr');
define('WP_SITEURL', 'https://mnegro.42.fr');
