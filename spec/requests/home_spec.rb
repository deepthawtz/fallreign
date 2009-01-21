require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Home controller" do
  before(:each) do
    @response = request("/home")
  end                    
  
  it "should be successful" do
    @response.should be_successful
  end                     
  
end