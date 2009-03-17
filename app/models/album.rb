class Album
  include DataMapper::Resource
  include Paperclip::Resource
  
  property :id, Serial
  property :title, String, :nullable => false
  property :artist_id, Integer 
  property :description, Text, :default => "To be provided"
  property :release_year, Integer
  property :songs, Text

  belongs_to :artist    
  
  has_attached_file :image,
    :default_url => "/uploads/albums/:attachment/missing_:style.png",
    :url    => "/uploads/albums/:id/:style/:basename.:extension",
    :path   => ":merb_root/public/uploads/albums/:id/:style/:basename.:extension",
    :styles => {:small => "55x55#", :medium => "100x100#", :large => "300x300#"}      

  # validates_with_method :release_year, :proper_year?
  # validates_with_method :image_path, :get_proper_path
                                                     
  def proper_year?
    if self.release_year !~ /^\d{4}$/
      [false, "Enter 4-digit year (e.g., 1994)"]
    else
      true
    end
  end                                                      
                                                     
  def get_proper_path
    self.image_path = File.join('public', 'uploads', "#{self.attachment.id}", "#{self.attachment.filename}")
  end  
end 