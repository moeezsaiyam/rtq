# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
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

end
