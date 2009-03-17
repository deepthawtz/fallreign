require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a album exists" do
  Album.all.destroy!
  request(resource(:albums), :method => "POST", 
    :params => { :album => { :id => nil }})
end

describe "resource(:albums)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:albums))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of albums" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a album exists" do
    before(:each) do
      @response = request(resource(:albums))
    end
    
    it "has a list of albums" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
        
  describe "a successful POST" do
    before(:each) do
      Album.all.destroy!
      @response = request(resource(:albums), :method => "POST", 
        :params => { :album => { :id => nil }})
    end
    
    it "redirects to resource(:albums)" do
      # @response.should redirect_to(resource(Album.first), :message => {:notice => "album was successfully created"})
    end
    
  end
end

describe "resource(@album)" do 
  describe "a successful DELETE", :given => "a album exists" do
     before(:each) do
       @response = request(resource(Album.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       # @response.should redirect_to(resource(:albums))
     end

   end
end

describe "resource(:albums, :new)" do
  before(:each) do
    @response = request(resource(:albums, :new))
  end
  
  it "responds successfully" do
    # @response.should be_successful
  end
end

describe "resource(@album, :edit)", :given => "a album exists" do
  before(:each) do
    @response = request(resource(Album.first, :edit))
  end
  
  it "responds successfully" do
    # @response.should be_successful
  end
end

describe "resource(@album)", :given => "a album exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Album.first))
    end
  
    it "responds successfully" do
      # @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @album = Album.first
      @response = request(resource(@album), :method => "PUT", 
        :params => { :album => {:id => @album.id} })
    end
  
    it "redirect to the article show action" do
      # @response.should redirect_to(resource(@album))
    end
  end
  
end

