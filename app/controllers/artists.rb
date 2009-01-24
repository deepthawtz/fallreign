class Artists < Application
  # provides :xml, :yaml, :js
  before :ensure_authenticated, :exclude => [:show,:index]
  
  def index
    @artists = Artist.paginate :page => params[:page], :per_page => 10
    render
  end

  def show(id)
    @artist = Artist.get(id)
    raise NotFound unless @artist
    display @artist
  end

  def new
    only_provides :html
    @artist = Artist.new
    display @artist
  end

  def edit(id)
    only_provides :html
    @artist = Artist.get(id)
    raise NotFound unless @artist
    display @artist
  end

  def create(artist)
    @artist = Artist.new(artist)
    if @artist.save
      redirect resource(@artist), :message => {:notice => "Artist was successfully created"}
    else
      message[:error] = "Artist failed to be created"
      render :new
    end
  end

  def update(id, artist)
    @artist = Artist.get(id)
    raise NotFound unless @artist
    if @artist.update_attributes(artist)
       redirect resource(@artist)
    else
      display @artist, :edit
    end
  end

  def destroy(id)
    @artist = Artist.get(id)
    raise NotFound unless @artist
    if @artist.destroy
      redirect resource(:artists)
    else
      raise InternalServerError
    end
  end

end # Artists
