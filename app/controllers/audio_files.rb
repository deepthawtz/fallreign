class AudioFiles < Application
  # provides :xml, :yaml, :js

  def index
    @audio_file = AudioFile.all
    display @audio_file
  end

  def show(id)
    @audio_file = AudioFile.get(id)
    raise NotFound unless @audio_file
    display @audio_file
  end

  def new
    only_provides :html
    @audio_file = AudioFile.new
    display @audio_file
  end    

  def edit(id)
    only_provides :html
    @audio_file = AudioFile.get(id)
    raise NotFound unless @audio_file
    display @audio_file
  end

  def create(audio_file)
    @audio_file = AudioFile.new(audio_file)
    if @audio_file.save       
      redirect '/admin#ui-tabs-19'
    else
      message[:error] = "AudioFile failed to be created"
      render :new
    end
  end

  def update(id, audio_file)
    @audio_file = AudioFile.get(id)
    raise NotFound unless @audio_file
    if @audio_file.update_attributes(audio_file)
       redirect '/admin#ui-tabs-19'
    else
      display @audio_file, :edit
    end
  end

  def destroy(id)
    @audio_file = AudioFile.get(id)
    raise NotFound unless @audio_file
    if @audio_file.destroy
      redirect '/admin#ui-tabs-19'
    else
      raise InternalServerError
    end
  end                      
  
end # AudioFiles
