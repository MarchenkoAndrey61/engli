class Phrase < ApplicationRecord
  include SharedMethods
  include PublicActivity::Model
  extend FriendlyId
  tracked owner: ->(controller, model) { controller && controller.current_user }
  friendly_id :phrase, use: :slugged
  acts_as_votable
  acts_as_voter
  belongs_to :user
  has_many :examples
  accepts_nested_attributes_for :examples, allow_destroy: true
  validates :phrase, :translation, uniqueness: true ,
                                   length: {maximum: 30}
  
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
