class SubTopic < ActiveRecord::Base

  has_many :questions, :dependent => :destroy

  belongs_to :topic

  before_save :name_to_slug

  has_attached_file :photo, :styles => { :small => "100x80#", :normal => "400x320>" }, :url => "/assets/subtopics/:attachment/:id/:style/:basename.:extension", :default_url => '/images/class-img.png'

  named_scope :popular, :limit => 6, :order => 'created_at DESC'
  validates_presence_of :name,:description

  define_index do
    indexes name
    indexes description
    has :topic_id, :as => :search_topic
    has :id, :as => :search_sub_topic
  end

  def name_to_slug
    self.name_slug = self.name.to_slug
  end

  def self.perform_search(search_term, search_terms)
    self.search(search_term, :with => search_terms)
  end

end
