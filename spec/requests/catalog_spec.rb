require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/catalog" do
  before(:each) do
    @response = request("/catalog")
  end
end