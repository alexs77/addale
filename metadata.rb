name              'addale'
maintainer        'Alexander Skwar'
maintainer_email  'a@skwar.me'
license           'Apache 2.0'
description       'addale Systeme konfigurieren'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.7.0'
recipe            'default', 'Ruft das Recipe für das jeweilige System auf.'

supports          'ubuntu'

source_url 'https://gitlab.unixsrv.everyware.zone/customer/allianz/addale'
issues_url 'https://gitlab.unixsrv.everyware.zone/customer/allianz/addale/issues'
chef_version '>= 12.1' if respond_to?(:chef_version)

