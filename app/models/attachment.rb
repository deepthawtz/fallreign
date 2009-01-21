class Attachment
  include DataMapper::Resource
  
  property :id, Serial
  property :filename, String
  property :content_type, String
  property :size, Integer
  property :attachment_id, Integer
  property :attachment_type, String
  
  belongs_to :album
  
  def url
    "/uploads/#{self.id}/#{self.filename}"
  end
end
