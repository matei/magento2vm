#include_recipe "build-essential"
include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_php5"
#include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_expires"

include_recipe "php"
include_recipe "php::module_apc"
include_recipe "php::module_curl"
include_recipe "php::module_mysql"
include_recipe "php::module_gd"
include_recipe "php::module_memcache"

php_pear "redis"

package 'php5-mcrypt'
package 'php-soap'


web_app node['magento2vm']['app_name'] do
  server_name node['magento2vm']['server_name']
  docroot node['magento2vm']['approot']
  template 'web_app.conf.erb'
end

#template "/etc/php.d/APC.ini" do
#  source "APC.ini.erb"
#  notifies :reload, resources(:service => "apache2"), :delayed
#end

#template "/etc/httpd/conf.d/php.conf" do
#  source "php.conf.erb"
#  notifies :reload, resources(:service => "apache2"), :delayed
#end

