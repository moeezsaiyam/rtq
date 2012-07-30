# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all
  helper_method :admin_role?
  before_filter :set_translation_cookie
  before_filter :get_keywords
  before_filter :set_locale

  def set_locale 
  # if params[:locale] is nil then 
  #I18n.default_locale will be used 
  I18n.locale = params[:locale] 
  I18n.locale = :en
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def login_required
    redirect_to("/login") unless logged_in?
  end

  def admin_role?
   current_user && current_user.admin_role?
  end

  def set_translation_cookie
    if Translation.all.collect(&:table_nam).select {|t| cookies[t] == 'true'}.empty?
      default = Translation.find_by_default(1).table_nam
      cookies[default] = {:value => "true", :path => "/"}
    end
  end

  def set_author_and_last_updated_by(item)
    item.created_by = current_user.login
    item.last_updated_by = current_user.login
  end
 private

  def get_keywords
    if(Keyword.find_by_url(request.url))
      cache = Keyword.find_by_url(request.url)
      @words = cache.words
    else
      alchemyObj = AlchemyAPI.new()
      alchemyObj.loadAPIKey("#{RAILS_ROOT}/api-key.txt")
      result = alchemyObj.URLGetRankedKeywords(request.url, AlchemyAPI::OutputMode::JSON)
      results  = JSON.parse(result)
      @keywords = results['keywords'].collect{|k| k['text']}
      @words = "Quran"
      @keywords.each do |val|
        @words = [val,@words].join(',')
      end
      Keyword.create(:url => request.url , :words => @words)
    end
  end
end
