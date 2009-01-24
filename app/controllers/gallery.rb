class Gallery < Application

  def index
    @arts = Art.paginate :page => params[:page], :per_page => 10
    render
  end
  
end
