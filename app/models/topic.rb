class Topic < ActiveRecord::Base
  before_create :set_topic_position
  has_many :sub_topics, :dependent => :destroy

  before_save :name_to_slug

  named_scope :ordered, :order => 'position ASC'

  has_attached_file :photo,:styles => { :small => "100x80#", :normal => "400x320>" }, :url => "/assets/topics/:attachment/:id/:style/:basename.:extension", :default_url => '/images/class-img.png'
  
  validates_presence_of :name,:description,:meaning
  
  define_index do
    indexes name
    indexes meaning
    indexes description
    has :id, :as => :search_topic

  end

  def self.perform_search(search_term, search_terms)
    self.search(search_term, :with => search_terms)
  end

  def name_to_slug
    self.name_slug = self.name.to_slug.downcase
  end

  def set_topic_position
    self.position = Topic.maximum(:position).to_i + 1
  end
end

