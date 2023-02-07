class Picture < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user

  validates :image_data, presence: true
end
