class Exhibit < ApplicationRecord
  belongs_to :zone

  has_one_attached: image
end
