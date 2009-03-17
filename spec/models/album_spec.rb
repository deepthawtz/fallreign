require File.join( File.dirname(__FILE__), '..', "spec_helper" )

given 'a new album' do
  @album = Album.new
end

describe Album do
  it "should resonde to .new" do
    Album.should respond_to(:new)
  end

  describe '.new' do
    before(:each) do
      @response = Album.new
    end

    it "should return an Album" do
      @response.should be_kind_of(Album)
    end
  end

  %w[ id title release_year catalog_id artist_id description image ].each do |method|
    it "should respond_to ##{method}" do
      Album.new.should respond_to(method)
    end

    describe "#{method}", :given => 'a new album' do
      before(:each) do
        @response = @user.send(method)
      end

      it "should return nil by default" do
        @response.should be_nil
      end
    end
  end
end
