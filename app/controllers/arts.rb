class Arts < Application
  # provides :xml, :yaml, :js
  before :ensure_authenticated, :exclude => [:show, :index]

  def index
    @arts = Art.paginate :page => params[:page], :per_page => 10
    render
  end

  def show(id)
    @art = Art.get(id)
    raise NotFound unless @art
    display @art
  end

  def new
    only_provides :html
    @art = Art.new
    display @art
  end

  def edit(id)
    only_provides :html
    @art = Art.get(id)
    raise NotFound unless @art
    display @art
  end

  def create(art)
    @art = Art.new(art)
    if @art.save
      redirect '/admin#ui-tabs-17'
    else
      message[:error] = "Art failed to be created"
      render :new
    end
  end

  def update(id, art)
    @art = Art.get(id)
    raise NotFound unless @art
    if @art.update_attributes(art)
      redirect '/admin#ui-tabs-17'
    else
      display @art, :edit
    end
  end

  def destroy(id)
    @art = Art.get(id)
    raise NotFound unless @art
    if @art.destroy
      redirect '/admin#ui-tabs-17'
    else
      raise InternalServerError
    end
  end

end # Arts
