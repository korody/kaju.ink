class Attachment < ActiveRecord::Base
  # before_create :default_description
  
  belongs_to :attachable, polymorphic: true

  mount_uploader :image, ImageUploader

  # def default_description
  #   self.description ||= File.basename(image.filename, '.*').titleize if image
  # end

end
