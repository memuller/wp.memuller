# Repository & Nginx config
ln -s /home/wp/repos/memuller /var/www/memuller.com ;
ln -s /home/wp/data/config/memuller.conf /etc/nginx/sites-enabled/ ;

# Main WP config
ln -s /home/wp/data/config/.env /home/wp/repos/memuller/.env

# Wordpress cache config files
ln -s /home/wp/data/config/advanced-cache.php ; /home/wp/repos/memuller/wp-content/ ;
ln -s /home/wp/data/config/wp-cache-config.php /home/wp/repos/memuller/wp-content/ ;

# Wordpress cache and upload folders 
ln -s /home/wp/data/cache /home/wp/repos/memuller/wp-content/cache ;
ln -s /home/wp/data/uploads /home/wp/repos/memuller/wp-content/uploads ;

# Git push post-update hook
ln -s /home/wp/data/config/post-update /home/wp/repos/memuller/.git/hooks/ ;
chmod +x /home/wp/repos/memuller/.git/hooks/post-update ;

# Pre-configures MySQL client credentials
ln -s /home/wp/data/config/.my.cnf /home/wp/ ;