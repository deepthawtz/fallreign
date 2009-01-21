require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/music" do
  before(:each) do
    @response = request("/music")
  end
end