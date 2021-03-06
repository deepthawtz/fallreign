class Links < Application
  # provides :xml, :yaml, :js
  # before :ensure_authenticated

  def index
    @links = Link.all
    display @links
  end

  def show(id)
    @link = Link.get(id)
    raise NotFound unless @link
    display @link
  end

  def new
    only_provides :html
    @link = Link.new
    display @link
  end

  def edit(id)
    only_provides :html
    @link = Link.get(id)
    raise NotFound unless @link
    display @link
  end

  def create(link)
    @link = Link.new(link)
    if @link.save
      redirect '/admin#ui-tabs-15'
    else
      message[:error] = "Link failed to be created"
      render :new
    end
  end

  def update(id, link)
    @link = Link.get(id)
    raise NotFound unless @link
    if @link.update_attributes(link)
      redirect '/admin#ui-tabs-15'
    else
      display @link, :edit
    end
  end

  def destroy(id)
    @link = Link.get(id)
    raise NotFound unless @link
    if @link.destroy
      redirect '/admin#ui-tabs-15'
    else
      raise InternalServerError
    end
  end

end # Links
