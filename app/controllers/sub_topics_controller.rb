class SubTopicsController < ApplicationController
  # GET /sub_topics
  # GET /sub_topics.xml

  before_filter :login_required, :except => [:index, :show]

  def index
    unless params[:topic_id].blank?
      @topic = Topic.find params[:topic_id]
      @sub_topics = @topic.sub_topics.ordered unless @topic.blank?
    else
      @sub_topics = SubTopic.ordered.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_topics }
    end
  end


  def show
    unless (params[:id].blank?)
      @sub_topic = SubTopic.find(params[:id])
    end
    if (!params[:topic_name_slug].blank? && !params[:sub_topic_name_slug].blank?)
      topic = Topic.find_by_name_slug(params[:topic_name_slug])
      return head(404) unless topic
      @sub_topic = SubTopic.find_by_name_slug_and_topic_id(params[:sub_topic_name_slug],topic.id)
    end
      @popular_questions = @sub_topic.questions.find(:all,:limit => 5,:order => 'view_count DESC')
      @latest_questions = @sub_topic.questions.find(:all,:limit => 5,:order => 'created_at DESC')
      @related_subject = SubTopic.find(:all,:limit => 5, :conditions => ['id NOT IN(?) AND topic_id = ?',@sub_topic,@sub_topic.topic_id])
      @sub_topic_questions = @sub_topic.questions.all
    respond_to do |format|
      format.html #show.html.erb
      format.xml  { render :xml => @sub_topic }
    end
  end
  

  def new
    @sub_topic = SubTopic.new
    @sub_topic.topic_id = params[:topic_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_topic }
    end
  end


  def edit
    @sub_topic = SubTopic.find(params[:id])
  end


  def create
    @sub_topic = SubTopic.new(params[:sub_topic])
    set_author_and_last_updated_by(@sub_topic)
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


  def update
    @sub_topic = SubTopic.find(params[:id])
    @sub_topic.last_updated_by = current_user.login

    if params.include?("photo_name")
      @sub_topic.photo.destroy
      @sub_topic.save
      return render :text => "success"
    end

    respond_to do |format|
      if @sub_topic.update_attributes(params[:sub_topic])
        @sub_topic.last_updated_by = current_user.login
        @sub_topic.save
        flash[:notice] = 'SubTopic was successfully updated.'
        format.html { redirect_to(topic_sub_topic_path(@sub_topic.topic,@sub_topic)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_topic.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @sub_topic = SubTopic.find(params[:id])
    @sub_topic.destroy

    respond_to do |format|
      format.html { redirect_to(topic_sub_topics_path(@sub_topic.topic)) }
      format.xml  { head :ok }
    end
  end

   def save_order
     params[:subpositions].each_with_index do |sub_topic_id, index|
      sub_topic = SubTopic.find(sub_topic_id)
      sub_topic.update_attributes(:position => index + 1)
    end

    redirect_to :back
  end

end

