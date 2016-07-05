class Bird < ActiveRecord::Base
  has_many :user_photos
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :environmental_laws

  validates :name, presence: true, uniqueness: true
  validates :latin_name, presence: true, uniqueness: true
  validates :description, presence: true
end
