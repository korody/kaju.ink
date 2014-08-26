# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}"
  end

  def default_url
    "default/" + [version_name, "kaju.jpg"].compact.join('_')
  end

  process   :resize_to_fit => [1200, 3000]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end