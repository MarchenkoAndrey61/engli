class User < ApplicationRecord
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :phrases  
  has_many :examples
  extend FriendlyId
  friendly_id :username, use: :slugged
  
  def has_new_notifications?
    PublicActivity::Activity.where(recipient_id: self.id, readed: [nil, false]).any?
  end

end
