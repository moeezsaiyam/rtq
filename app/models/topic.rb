class Topic < ActiveRecord::Base

  has_many :sub_topics, :dependent => :destroy

  before_save :name_to_slug

  define_index do
    indexes name
    indexes meaning
    indexes description
  end

  def name_to_slug
    self.name_slug = self.name.to_slug
  end

end
