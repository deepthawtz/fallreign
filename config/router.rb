Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  resources :articles
  resources :article
  resources :albums
  resources :artists
  # RESTful routes
  # resources :articles
  # resources :admin
  resources :artists
  resources :albums
  
  # Adds the required routes for merb-auth using the password slice
  # slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")

  # This is the default route for /:controller/:action/:id
  # This is fine for most cases.  If you're heavily using resource-based
  # routes, you may want to comment/remove this line to prevent
  # clients from calling your create or destroy actions with a GET
  default_routes
  
  # Change this for your home page to be available at /
  match('/').to(:controller => 'home')
  match('/music').to(:controller => 'music')
  match('/gallery').to(:controller => 'gallery')
  match('/contact').to(:controller => 'contact')
  # match('/admin').to(:controller => 'admin')

end