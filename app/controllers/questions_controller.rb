class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.xml

  before_filter :login_required, :except => [:index, :show,:popular]

  def index
    if (!params[:topic_id].blank?) && (!params[:sub_topic_id].blank?)
      @sub_topic = SubTopic.find params[:sub_topic_id]
      @questions = @sub_topic.questions unless @sub_topic.blank?
    elsif params[:sub_topic_name_slug]
       @sub_topic = SubTopic.find_by_name_slug(params[:sub_topic_name_slug])
       @questions = @sub_topic.questions
    else
        @questions = Question.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
    unless params[:id].blank?
      @question = Question.find(params[:id])
    end
    if (!params[:topic_name_slug].blank? && !params[:sub_topic_name_slug].blank? && !params[:question_slug].blank?)
      id = params[:question_slug].split("-").last
      @question = Question.find(id)
    end
    # return head(404) unless @question
    #unless @question.verse_ids.blank?
      #verse_ids = @question.verse_ids.split(",")
      @verses = Hash.new
      @question.references.each do |reference|
       @verses[reference.id.to_s] = Verse.find_by_aya_and_sura(reference.from.split(":").last, reference.from.split(":").first)
      end
    #end
     @related_subject = SubTopic.find(:all,:limit => 5, :conditions => ['id NOT IN(?) AND topic_id = ?',@question.sub_topic,@question.sub_topic.topic_id])
     @related_questions = Question.find(:all,:limit => 5, :conditions => ['id NOT IN(?) AND sub_topic_id = ?',@question,@question.sub_topic_id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end


  def new
    @question = Question.new
    @question.alternate_phrases.build
    @question.references.build
    @question.sub_topic_id = params[:sub_topic_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def popular
    @questions = Question.popular.paginate :per_page => 10, :page => params[:page]
  end
  
  def create
    @question = Question.new(params[:question])
    set_author_and_last_updated_by(@question)

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to(topic_sub_topic_question_path(@question.sub_topic.topic,@question.sub_topic,@question)) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        @question.references.build
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:question])
        @question.last_updated_by = current_user.login
        @question.save
        flash[:notice] = 'Question was successfully updated.'
        format.html { redirect_to(topic_sub_topic_question_path(@question.sub_topic.topic,@question.sub_topic,@question)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(topic_sub_topic_questions_path(@question.sub_topic.topic,@question.sub_topic)) }
      format.xml  { head :ok }
    end
  end

  def remove_issue
    reference = Reference.find(params[:reference_id])
    reference.destroy
    redirect_to :back
  end

end
