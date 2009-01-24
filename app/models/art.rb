class Art
  include DataMapper::Resource
  include Paperclip::Resource
  
  property :id, Serial       
  property :title, String
  property :artist, String
  property :description, Text
  
  has_attached_file :image,
    :default_url => "/uploads/art/:attachment/missing_:style.png",
    :url    => "/uploads/art/:id/:style/:basename.:extension",
    :path   => ":merb_root/public/uploads/art/:id/:style/:basename.:extension",
    :styles => {:small => "55x55#", :medium => "100x100#", :large => "300x300#"}      
  
end
