require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a article exists" do
  Article.all.destroy!
  request(resource(:article), :method => "POST", 
    :params => { :article => { :id => nil }})
end

describe "resource(:article)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:article))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of article" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a article exists" do
    before(:each) do
      @response = request(resource(:article))
    end
    
    it "has a list of article" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Article.all.destroy!
      @response = request(resource(:article), :method => "POST", 
        :params => { :article => { :id => nil }})
    end
    
    it "redirects to resource(:article)" do
      @response.should redirect_to(resource(Article.first), :message => {:notice => "article was successfully created"})
    end
    
  end
end

describe "resource(@article)" do 
  describe "a successful DELETE", :given => "a article exists" do
     before(:each) do
       @response = request(resource(Article.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:article))
     end

   end
end

describe "resource(:article, :new)" do
  before(:each) do
    @response = request(resource(:article, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@article, :edit)", :given => "a article exists" do
  before(:each) do
    @response = request(resource(Article.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@article)", :given => "a article exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Article.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @article = Article.first
      @response = request(resource(@article), :method => "PUT", 
        :params => { :article => {:id => @article.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@article))
    end
  end
  
end

