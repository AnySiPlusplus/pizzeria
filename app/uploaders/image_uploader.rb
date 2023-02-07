require 'image_processing/mini_magick'

class ImageUploader < Shrine
  SIZE = 1..5 * 1024 * 1024
  TYPE = %w[image/jpeg image/png image/gif image/jpg].freeze
  EXTENSION = %w[jpeg png gif jpg].freeze
  IMAGE_DIMENTIONS = {
    large: [1000, 1000],
    medium: [600, 600],
    small: [300, 300],
    thumbnail: [100, 100],
    tiny: [50, 50]
  }.freeze

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      large: magick.resize_to_limit!(*IMAGE_DIMENTIONS[:large]),
      medium: magick.resize_to_limit!(*IMAGE_DIMENTIONS[:medium]),
      small: magick.resize_to_limit!(*IMAGE_DIMENTIONS[:small]),
      thumbnail: magick.resize_to_limit!(*IMAGE_DIMENTIONS[:thumbnail]),
      tiny: magick.resize_to_limit!(*IMAGE_DIMENTIONS[:tiny])
    }
  end

  Attacher.validate do
    validate_size SIZE
    validate_mime_type TYPE
    validate_extension EXTENSION
  end

  Attacher.default_url do |derivative: nil, **|
    "#{derivative}.png" if derivative
  end
end
