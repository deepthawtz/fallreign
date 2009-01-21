class Albums < Application
  # provides :xml, :yaml, :js

  def index
    @albums = Album.all
    display @albums
  end

  def show(id)
    @album = Album.get(id)
    raise NotFound unless @album
    display @album
  end

  def new
    only_provides :html
    @album = Album.new
    display @album
  end

  def edit(id)
    only_provides :html
    @album = Album.get(id)
    raise NotFound unless @album
    display @album
  end

  def create(album)
    @album = Album.new(album)
    if @album.save
      redirect resource(@album), :message => {:notice => "Album was successfully created"}
    else
      message[:error] = "Album failed to be created"
      render :new
    end
  end

  def update(id, album)
    @album = Album.get(id)
    raise NotFound unless @album
    if @album.update_attributes(album)
       redirect resource(@album)
    else
      display @album, :edit
    end
  end

  def destroy(id)
    @album = Album.get(id)
    raise NotFound unless @album
    if @album.destroy
      redirect resource(:albums)
    else
      raise InternalServerError
    end
  end

end # Albums
