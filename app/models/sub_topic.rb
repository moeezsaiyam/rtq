class SubTopic < ActiveRecord::Base

  has_many :questions, :dependent => :destroy

  belongs_to :topic

  before_save :name_to_slug

  has_attached_file :photo, :styles => { :small => "100x80>" }, :url => "/assets/subtopics/:attachment/:id/:style/:basename.:extension", :default_url => '/images/class-img.png'

  named_scope :popular, :limit => 6, :order => 'created_at DESC'

  define_index do
    indexes name
    indexes description
  end

  def name_to_slug
    self.name_slug = self.name.to_slug
  end

end
