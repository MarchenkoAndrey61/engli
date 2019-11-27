class User < ApplicationRecord
  include PublicActivity::Model
  extend FriendlyId
  tracked owner: ->(controller, model) { controller && controller.current_user }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_votable
  acts_as_voter
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable

  has_many :phrases  
  has_many :examples
  friendly_id :username, use: :slugged
  
  def has_new_notifications?
    PublicActivity::Activity.where(recipient_id: self.id, readed: [nil, false]).any?
  end
end
