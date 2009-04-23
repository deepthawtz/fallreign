class Settings
  include DataMapper::Resource
  include Paperclip::Resource
  
  property :id, Serial
  property :site_title, String
  property :ga_account, String
  property :adsense_account, String  
        
  has_attached_file :site_banner,
    :default_url => "/uploads/avatars/default_header.png",
    :url    => "/uploads/avatars/:id/:style/:basename.:extension",
    :path   => ":merb_root/public/uploads/albums/:id/:style/:basename.:extension",  
    :styles => {:safe => "950x120"},
    :default_style => :safe

end