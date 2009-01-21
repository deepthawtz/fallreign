class Article
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
  
  validates_present :title, :body
end
