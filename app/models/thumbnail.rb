class Thumbnail < ActiveRecord::Base
  belongs_to :thumbable, polymorphic: true

  mount_uploader :thumb, ThumbUploader
end