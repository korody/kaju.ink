class Job < ActiveRecord::Base
  attr_accessible :area, :client_name, :client_info, :description, :effort, :material, :spot, :title, :type, :what, :duration, :website, :video, :attachments_attributes, :thumbnails_attributes, :products_attributes, :client_attributes
  before_save :youtube_video

  belongs_to :client

  has_many :attachments, as: :attachable, dependent: :destroy

  has_many :thumbnails, as: :thumbable, dependent: :destroy
  
  has_many :products, as: :marketable

  # validates :client_id, presence: true

  accepts_nested_attributes_for :attachments, :thumbnails, :products, :client

  TYPES = %w[Human Abstract Serial Character Wall Expo Pattern Branding Institutional Co-creation Event Layout]
  validates :type, presence: true, inclusion: { in: TYPES }
  
  ART = %w[Human Abstract Serial Character Wall Expo]
  GRAPHIC = %w[Pattern Branding Institutional Cocreation Event Layout]

  scope :art, where(type: ART)
  scope :graphic, where(type: GRAPHIC)

  before_save :assign_client
  attr_accessor :client_name

  def self.filter(params)
    jobs = Job.where(type: params[:type].singularize.capitalize) if params[:type]
  end

  def self.types
    TYPES
  end

  def self.artbar
    ART
  end

  def self.graphicbar
    GRAPHIC
  end

  def youtube_video
    if video
      self.video = video.gsub("watch?v=", "embed/").gsub("http://www", "https://www")
    end  
  end

  private

  def assign_client
    if client_name
      # some_client = Client.find_or_create_by_name(client_name)
      some_client = Client.where(name: client_name).first_or_create!
      self.client_id = some_client ? some_client.id : 0
      # self.client_id = some_client.id
    end
  end

end

class Human < Job
end

class Abstract < Job
end

class Serial < Job
end

class Character < Job
end

class Wall < Job
end

class Expo < Job
end

class Pattern < Job
end

class Branding < Job
end

class Cocreation < Job
end

class Event < Job
end

class Layout < Job
end

class Institutional < Job
end
