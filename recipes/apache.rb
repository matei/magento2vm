#include_recipe "build-essential"
include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_php5"
#include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_expires"

include_recipe "php"
include_recipe "php::module_curl"
include_recipe "php::module_mysql"
include_recipe "php::module_gd"
include_recipe "php::module_memcache"


php_pear_channel 'pear.php.net' do
  action :update
end

php_pear_channel 'pecl.php.net' do
  action :update
end

php_pear 'xdebug' do
  # Specify that xdebug.so must be loaded as a zend extension
  zend_extensions ['xdebug.so']
  action :install
end


php_pear 'apc' do
  action :install
  directives(:shm_size => 128, :enable_cli => 1)
end

php_pear 'redis' do 
    action :install
end

packages = ['php5-mcrypt', 'php-soap', 'php5-xsl', 'php5-intl']

packages.each do |p|
    package p
    execute "php5enmode #{p}"
        command "php5enmode #{p}"
    end
end

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

