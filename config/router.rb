Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  resources :arts
  resources :articles
  resources :artists
  resources :albums
  
  # Adds the required routes for merb-auth using the password slice
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
  
  # Change this for your home page to be available at /
  match('/').to(:controller => 'home')
  match('/music').to(:controller => 'music')
  match('/gallery').to(:controller => 'gallery')
  match('/contact').to(:controller => 'contact')
  match('/admin').to(:controller => 'admin')

  default_routes

end