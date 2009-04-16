class Songs < Application
  # provides :xml, :yaml, :js

  def index
    @songs = Song.all
    display @songs
  end

  def show(id)
    @song = Song.get(id)
    raise NotFound unless @song
    display @song
  end

  def new
    only_provides :html
    @song = Song.new
    display @song
  end    

  def edit(id)
    only_provides :html
    @song = Song.get(id)
    raise NotFound unless @song
    display @song
  end

  def create(song)
    @song = Song.new(song)
    if @song.save       
      redirect '/', :message => {:notice => "Song was successfully created"}
    else
      message[:error] = "Song failed to be created"
      render :new
    end
  end

  def update(id, song)
    @song = Song.get(id)
    raise NotFound unless @song
    if @song.update_attributes(song)
       redirect resource(@song)
    else
      display @song, :edit
    end
  end

  def destroy(id)
    @song = Song.get(id)
    raise NotFound unless @song
    if @song.destroy
      redirect '/songs/index'
    else
      raise InternalServerError
    end
  end                      
  
end # Songs
