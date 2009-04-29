# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :haml
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper    
  c[:session_secret_key]  = '9d02fc5bba73a396aee1ff7e9ab9ea6c44d87073'  # required for cookie session store
  c[:session_id_key] = '_fallreign_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do  
end
 
Merb::BootLoader.after_app_loads do  
end                                 

Merb.add_mime_type :xspf, :to_xml, %w[application/xspf+xml]
