class UserPicture < Picture
  include UserImageUploader::Attachment(:image)
end
