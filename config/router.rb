Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  resources :albums
  resources :artists
  resources :articles
  resources :audio_files
  resources :arts
  resources :links
  
  # Adds the required routes for merb-auth using the password slice
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
  
  # Change this for your home page to be available at /
  match('/').to(:controller => 'home')
  match('/music').to(:controller => 'music', :action => 'playlist')
  match('/catalog').to(:controller => 'catalog')
  match('/gallery').to(:controller => 'gallery')
  match('/contact').to(:controller => 'contact')
  match('/admin').to(:controller => 'admin')
  match('/songs').to(:controller => 'songs')      

  default_routes
end
