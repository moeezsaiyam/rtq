class StaticContent < ActiveRecord::Base
  def self.get_static_content
    @static_content = StaticContent.first || StaticContent.new
  end
end
