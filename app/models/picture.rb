class Picture < ApplicationRecord
  belongs_to :picturable, polymorphic: true

  validates :image_data, presence: true
end
