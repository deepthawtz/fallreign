require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a art exists" do
  Art.all.destroy!
  request(resource(:arts), :method => "POST", 
    :params => { :art => { :id => nil }})
end

describe "resource(:arts)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:arts))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of arts" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end  
  describe "GET", :given => "a art exists" do
    before(:each) do
      @response = request(resource(:arts))
    end
    
    it "has a list of arts" do
      pending
      # @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Art.all.destroy!
      @response = request(resource(:arts), :method => "POST", 
        :params => { :art => { :id => nil }})
    end
    
    it "redirects to resource(:arts)" do
      # @response.should redirect_to(resource(Art.first), :message => {:notice => "art was successfully created"})
    end
    
  end
end

describe "resource(@art)" do 
  describe "a successful DELETE", :given => "a art exists" do
     before(:each) do
       @response = request(resource(Art.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       # @response.should redirect_to(resource(:arts))
     end

   end
end

describe "resource(:arts, :new)" do
  before(:each) do
    @response = request(resource(:arts, :new))
  end
  
  it "responds successfully" do
    # @response.should be_successful
  end
end

describe "resource(@art, :edit)", :given => "a art exists" do
  before(:each) do
    @response = request(resource(Art.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@art)", :given => "a art exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Art.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @art = Art.first
      @response = request(resource(@art), :method => "PUT", 
        :params => { :art => {:id => @art.id} })
    end
  
    it "redirect to the article show action" do
      # @response.should redirect_to(resource(@art))
    end
  end
  
end

