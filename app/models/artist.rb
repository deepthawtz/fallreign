class Artist
  include DataMapper::Resource
  include Paperclip::Resource
  include ArtistNameHelper
    
  property :id, Serial
  property :name, String, :nullable => false
  property :bio, Text, :default => "To be provided"
  property :external_links, URI

  has n, :albums 
          
  has_attached_file :image,
    :default_url => "/uploads/artists/:attachment/missing_:style.png",
    :url    => "/uploads/artists/:id/:style/:basename.:extension",
    :path   => ":merb_root/public/uploads/artists/:id/:style/:basename.:extension",
    :styles => {:small => "55x55#", :medium => "100x100#", :large => "300x300#"}      
  
  validates_with_method :name, :sensible_name?
  # validates_with_method :name, :name_unique?, :if => :new_record?
  # validates_with_method :external_links, :actual_url?
  
  def sensible_name?
    stripped_name = self.name.strip
    name_not_empty?(stripped_name)
  end                                                            
  
  def name_unique?
    if (self.class.all :name => self.name) != []
      [false, "The artist #{name} already exists."]
    else
      true
    end                                            
  end                                
    
end
