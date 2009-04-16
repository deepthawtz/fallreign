class Song
  include DataMapper::Resource
  include Paperclip::Resource          
  
  property :id, Serial
  property :title, String 
  property :creator, String
  property :album_id, String

  belongs_to :album   
  
  has_attached_file :audio,
    :default_url => "/audio/:attachment",
    :url         => "/audio/:basename.:extension",
    :path        => ":merb_root/public/audio/:basename.:extension"
      
end
      