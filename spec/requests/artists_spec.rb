require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a artist exists" do
  Artist.all.destroy!
  request(resource(:artists), :method => "POST", 
    :params => { :artist => { :id => nil }})
end
      
describe "resource(:artists)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:artists))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of artists" do
      pending
      # @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a artist exists" do
    before(:each) do
      @response = request(resource(:artists))
    end
    
    it "has a list of artists" do
      pending
      # @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Artist.all.destroy!
      @response = request(resource(:artists), :method => "POST", 
        :params => { :artist => { :id => nil }})
    end
    
    it "redirects to resource(:artists)" do
      # @response.should redirect_to(resource(Artist.first), :message => {:notice => "artist was successfully created"})
    end
    
  end
end

describe "resource(@artist)" do 
  describe "a successful DELETE", :given => "a artist exists" do
     before(:each) do
       @response = request(resource(Artist.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       # @response.should redirect_to(resource(:artists))
     end

   end
end

describe "resource(:artists, :new)" do
  before(:each) do
    @response = request(resource(:artists, :new))
  end
  
  it "responds successfully" do
    # @response.should be_successful
  end
end

describe "resource(@artist, :edit)", :given => "a artist exists" do
  before(:each) do
    @response = request(resource(Artist.first, :edit))
  end
  
  it "responds successfully" do
    # @response.should be_successful
  end
end

describe "resource(@artist)", :given => "a artist exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Artist.first))
    end
  
    it "responds successfully" do
      # @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @artist = Artist.first
      @response = request(resource(@artist), :method => "PUT", 
        :params => { :artist => {:id => @artist.id} })
    end
  
    it "redirect to the article show action" do
      # @response.should redirect_to(resource(@artist))
    end
  end
  
end

