class Phrase < ApplicationRecord
  include SharedMethods
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  extend FriendlyId
  friendly_id :phrase, use: :slugged
  acts_as_votable
  belongs_to :user
  has_many :examples
  accepts_nested_attributes_for :examples, allow_destroy: true

  validates :phrase, :translation, uniqueness: true 
  
  validates :category,  
  inclusion: {
      in: %w(Actions Time Productivity Apologies Common)
  }

enum category: %w(Actions Time Productivity Apologies Common)

default_scope { order(vote_weight: :desc) }
  def author?(user)
    self.user == user
  end

end
