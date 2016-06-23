class Country < ActiveRecord::Base
  has_many :regions
  has_many :environmental_laws
  has_many :birds, through: :regions
end
