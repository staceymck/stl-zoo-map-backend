class Zone < ApplicationRecord
  has_many :exhibits
  has_many :attractions
end
