class Phrase < ApplicationRecord
  include SharedMethods
  extend FriendlyId
  friendly_id :phrase, use: :slugged

  belongs_to :user
  has_many :examples
  accepts_nested_attributes_for :examples, allow_destroy: true

  validates :phrase, :translation, uniqueness: true 
  
  validates :category,  
  inclusion: {
      in: %w(Actions Time Productivity Apologies Common)
  }

enum category: %w(Actions Time Productivity Apologies Common)


  def author?(user)
    self.user == user
  end

end
