class HomeController < ApplicationController

  def index
    @sub_topics = SubTopic.featured
    puts "///////////////"
    puts @sub_topics.inspect
    @questions = Question.popular.limited.all
  end

  def search
   if params[:search_terms].blank? || (params[:search_terms][:search_topic].blank? && params[:search_term][:search_sub_topic].blank?)
      @search = ThinkingSphinx.search params[:search_term], :per_page => 10, :page => params[:page]
      if @search.blank?
      @empty_search = "abc"
      end
     if params[:search_term] == 'Search'
     @blank_search = ThinkingSphinx.search :per_page => 10, :page => params[:page]
      end
      else
      search_terms = refactor_search_terms(params[:search_terms])
      @sub_topics_search = SubTopic.perform_search(params[:search_term], search_terms) unless params[:search_terms][:search_sub_topic].blank? && params[:search_term].blank?
      unless params[:search_terms][:search_sub_topic].blank? && params[:search_term].blank? && @sub_topics_search.blank?
      @empty_search = "abc"
      end 
       #@questions = @sub_topics.collect(&:questions).flatten!.paginate :per_page => 5, :page => params[:page] unless @sub_topics.blank?
        @questions_search = Question.search params[:search_term]
        @topics_search = Topic.perform_search(params[:search_term], search_terms) unless params[:search_terms][:search_topic].blank? && params[:search_term].blank?
        unless params[:search_terms][:search_topic].blank? && params[:search_term].blank? && @topics_search.blank?
         @empty_search = "abc"
        end
  end 
 end
  private

  def refactor_search_terms(search_terms)
    search_terms.delete_if{|h,i| i.blank? }
    search_terms.symbolize_keys!.merge(search_terms){|k, val| val.to_i }
  end
  
  def auto_search
    @search = ThinkingSphinx.search
    puts @search
    object = Array.new
    @search.each do |s|
    object = s.name if s.class == Topic && s.class == SubTopic
    object = s.quest if s.class == Question
    end
    
  end
  
end

