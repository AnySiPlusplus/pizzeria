class UserImageUploader < ApplicationUploader
  SIZE = 1..5 * 1024 * 1024
  TYPE = %w[image/jpeg image/png image/gif image/jpg].freeze
  EXTENSION = %w[jpeg png gif jpg].freeze
  IMAGE_DIMENTIONS = {
    thumbnail: [100, 100],
    tiny: [50, 50]
  }.freeze

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      thumbnail: magick.resize_to_limit!(*IMAGE_DIMENTIONS[:thumbnail]),
      tiny: magick.resize_to_limit!(*IMAGE_DIMENTIONS[:tiny])
    }
  end

  Attacher.validate do
    validate_size SIZE
    validate_mime_type TYPE
    validate_extension EXTENSION
  end
end
