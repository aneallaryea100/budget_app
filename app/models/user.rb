class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :timeoutable, :trackable

  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
end
