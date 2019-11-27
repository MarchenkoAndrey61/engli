class Example < ApplicationRecord
  include SharedMethods
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :user
  belongs_to :phrase
  validates :example, presence: true,
                      length: {maximum: 30}
  validates :example, uniqueness: true
  acts_as_votable 
end
