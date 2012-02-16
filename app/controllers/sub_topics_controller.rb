class SubTopicsController < ApplicationController
  # GET /sub_topics
  # GET /sub_topics.xml

  before_filter :login_required, :except => [:index, :show]

  def index
    unless params[:topic_id].blank?
      @topic = Topic.find params[:topic_id]
      @sub_topics = @topic.sub_topics unless @topic.blank?
    else
      @sub_topics = SubTopic.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_topics }
    end
  end

  # GET /sub_topics/1
  # GET /sub_topics/1.xml
  def show
    unless (params[:id].blank?)
      @sub_topic = SubTopic.find(params[:id])
    end
    if (!params[:topic_name_slug].blank? && !params[:sub_topic_name_slug].blank?)
      topic = Topic.find_by_name_slug(params[:topic_name_slug])
      return head(404) unless topic
      @sub_topic = SubTopic.find_by_name_slug_and_topic_id(params[:sub_topic_name_slug],topic.id)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_topic }
    end
  end

  # GET /sub_topics/new
  # GET /sub_topics/new.xml
  def new
    @sub_topic = SubTopic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_topic }
    end
  end

  # GET /sub_topics/1/edit
  def edit
    @sub_topic = SubTopic.find(params[:id])
  end

  # POST /sub_topics
  # POST /sub_topics.xml
  def create
    @sub_topic = SubTopic.new(params[:sub_topic])

    respond_to do |format|
      if @sub_topic.save
        flash[:notice] = 'SubTopic was successfully created.'
        format.html { redirect_to(topic_sub_topic_path(@sub_topic.topic,@sub_topic)) }
        format.xml  { render :xml => @sub_topic, :status => :created, :location => @sub_topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sub_topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_topics/1
  # PUT /sub_topics/1.xml
  def update
    @sub_topic = SubTopic.find(params[:id])

    respond_to do |format|
      if @sub_topic.update_attributes(params[:sub_topic])
        flash[:notice] = 'SubTopic was successfully updated.'
        format.html { redirect_to(topic_sub_topic_path(@sub_topic.topic,@sub_topic)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_topics/1
  # DELETE /sub_topics/1.xml
  def destroy
    @sub_topic = SubTopic.find(params[:id])
    @sub_topic.destroy

    respond_to do |format|
      format.html { redirect_to(topic_sub_topics_path(@sub_topic.topic)) }
      format.xml  { head :ok }
    end
  end
end
