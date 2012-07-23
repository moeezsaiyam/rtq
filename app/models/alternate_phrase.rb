class AlternatePhrase < ActiveRecord::Base
  belongs_to :question

  validates_presence_of :content ,:message=> "are invalid or not provided."
end
