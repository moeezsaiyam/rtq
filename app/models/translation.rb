class Translation < ActiveRecord::Base
 validates_presence_of :name,:table_nam

  def self.get_translation(cookies, params)
    return Translation.find_by_table_nam(params[:translation_name]) unless params[:translation_name].blank?
    return Translation.find_by_table_nam(cookies[:translation_name]) unless cookies[:translation_name].blank?
    Translation.find_by_default(2)
  end

end

