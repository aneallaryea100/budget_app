class Group < ApplicationRecord
    belongs_to :user
    has_many :entities
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
    validates :icon, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
end
