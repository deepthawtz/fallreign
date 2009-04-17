class Album
  include DataMapper::Resource
  include Paperclip::Resource
  
  property :id, Serial
  property :title, String, :nullable => false
  property :catalog_index, String
  property :artist_id, Integer 
  property :description, Text
  property :release_year, Integer
  property :songs, Text

  belongs_to :artist                               
  has n, :songs
  
  has_attached_file :image,
    :default_url => "/uploads/albums/:attachment/missing_:style.png",
    :url    => "/uploads/albums/:id/:style/:basename.:extension",
    :path   => ":merb_root/public/uploads/albums/:id/:style/:basename.:extension",
    :styles => {:small => "55x55#", :medium => "100x100#", :large => "300x300#"}      

  validates_with_method :release_year, :proper_year?
                                                     
  def proper_year?                   
    if self.release_year.nil?
      [false, "Enter 4-digit year (e.g., 1994)"]
    elsif self.release_year !~ /^\d{4}$/
      true
    else
      true
    end
  end                                                                                                           
end 