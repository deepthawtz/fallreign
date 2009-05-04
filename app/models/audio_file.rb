class AudioFile
  include DataMapper::Resource
  include Paperclip::Resource           
  
  property :id, Serial
  property :title, String 
  property :creator, String
  property :album_id, String
  property :artist_id, Integer 

  belongs_to :album   
  belongs_to :artist   
  
  has_attached_file :track,
    :default_url => "/audio/:attachment",
    :url         => "/audio/:basename.:extension",
    :path        => ":merb_root/public/audio/:basename.:extension"
      
end
      
