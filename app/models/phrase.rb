class Phrase < ApplicationRecord
 

  validates :phrase, :translation, uniqueness: true 
  
  validates :category,
            inclusion: {
                in: %w(Actions Time Productivity Apologies Common)
                
            }

  enum category: %w(Actions Time Productivity Apologies Common)
end
