class ImagesController < ApplicationController
  # GET /images
  # GET /images.xml
  def index
    @images = Image.ordered.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images }
    end
  end

  # GET /images/1
  # GET /images/1.xml
  def show
    @images = Image.ordered.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/new
  # GET /images/new.xml
  def new
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @image }
    end
  end

  # GET /images/1/ed
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.xml
  def create
    if params[:image].blank?
      flash[:notice] = "Must Add the Picture for Slider"
      return redirect_to :back
    else
      images = params[:image]
      urls = params[:url]
      positions = params[:order]
      images.zip(urls,positions) do |img,ulr,position|
        image = Image.new
        image.photo = img
        image.url = ulr
        image.position = position
        image.save(false)
      end
    end
    respond_to do |format|
      if params[:image].present?
        flash[:notice] = 'Image was successfully created.'
        format.html { redirect_to :root }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.xml
  def update
    @image = Image.find(params[:id])
    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to images_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.xml
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_path }
      format.xml  { head :ok }
    end
  end
end
