class Article
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String, :nullable => false
  property :body, Text, :nullable => false
  property :created_at, DateTime
  
  validates_present :title, :body
end
