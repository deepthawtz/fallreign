require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/gallery" do
  before(:each) do
    @response = request("/gallery")
  end
  
  it "should be successful" do
    @response.should be_successful
  end                             
  
  it "should return 10 images per page" do
    pending
    @response.should have_selector ""
  end
  
end
