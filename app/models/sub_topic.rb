class SubTopic < ActiveRecord::Base

  has_many :questions, :dependent => :destroy

  belongs_to :topic

  before_save :name_to_slug

  define_index do
    indexes name
    indexes description
  end

  def name_to_slug
    self.name_slug = self.name.to_slug
  end

end
