require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/contact" do
  before(:each) do
    @response = request("/contact")
  end
end