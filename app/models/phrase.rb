class Phrase < ApplicationRecord
 
 

  belongs_to :user
  
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
