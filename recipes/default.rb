#
# Cookbook Name:: magento2vm
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe "magento2vm::apache"
include_recipe 'composer'

mysql_service 'db' do              
  port '3306'                       
  version '5.6'
  socket '/var/run/mysqld/mysqld.sock'
  initial_root_password '' 
  action [:create, :start]          
end


