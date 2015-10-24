name             'magento2vm'
maintainer       'Matei'
maintainer_email 'matei@doize.ro'
license          'All rights reserved'
description      'Installs/Configures magento2vm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'apt'
depends 'apache2'
depends 'php'
depends 'composer'
depends 'mysql', '~> 6.0'
