class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.xml

  before_filter :login_required, :except => [:index, :show]

  def index
    @topics = Topic.ordered.all
  end

  def show
    unless (params[:id].blank?)
      @topic = Topic.find(params[:id])
    end
    unless (params[:topic_name_slug].blank?)
      @topic = Topic.find_by_name_slug(params[:topic_name_slug])
    end
     @popular_questions = @topic.sub_topics.collect{|s| s.questions.find(:all,:limit => 5,:order => 'view_count DESC')}.flatten!
     @latest_questions = @topic.sub_topics.collect{|s| s.questions.find(:all,:limit => 5,:order => 'created_at DESC')}.flatten!
     @related_subject = Topic.find(:all,:limit => 5, :conditions => ['id NOT IN(?)',@topic])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  def new
    @topic = Topic.new
    return head(404) unless @topic
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        flash[:notice] = 'Topic was successfully created.'
        format.html { redirect_to(@topic) }
        format.xml  { render :xml => @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @topic = Topic.find(params[:id])

    if params.include?("photo_name")
      @topic.photo = nil
      return render :text => "success"
    end
    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        @topic.last_updated_by = current_user.login
        @topic.save
        flash[:notice] = 'Topic was successfully updated.'
        format.html { redirect_to(@topic) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
      @topic = Topic.find(params[:id])
      @topic.destroy

      respond_to do |format|
        format.html { redirect_to(topics_url) }
        format.xml  { head :ok }
      end
  end

  def save_order
     params[:positions].each_with_index do |topic_id, index|
      topic = Topic.find(topic_id)
      topic.update_attributes(:position => index + 1)
     end

    redirect_to :back
  end

  def edit_description
    @topic = Topic.find(params[:id])
  end
end

