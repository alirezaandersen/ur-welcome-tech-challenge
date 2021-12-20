class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end


# Message Class ->
# belongs_to sender class: User
# belong to conversation room
# needs to have content


# ConversationRoom Class ->
# has_many_and_belongs_to  user
# has_many messages #dependent: destory
