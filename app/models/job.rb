class Job < ActiveRecord::Base
  attr_accessible :area, :client_name, :client_info, :description, :effort, :material, :spot, :title, :type, :what, :duration, :attachments_attributes, :thumbnails_attributes, :products_attributes, :client_attributes

  belongs_to :client, dependent: :destroy

  has_many :attachments, as: :attachable

  has_many :thumbnails, as: :thumbable, dependent: :destroy
  
  has_many :products, as: :marketable

  # validates :client_id, presence: true

  accepts_nested_attributes_for :attachments, :thumbnails, :products, :client

  TYPES = %w[Human Abstract Serial Pattern Character Wall Branding Co-creation Event Layout Archplan Map]
  validates :type, presence: true, inclusion: { in: TYPES }
  
  ART = %w[Human Abstract Serial Pattern Character Wall]
  GRAPHIC = %w[Branding Cocreation Event Layout Archplan Map]

  scope :art, where(type: ART)
  scope :graphic, where(type: GRAPHIC)

  before_save :assign_client
  # attr_accessor :client_name

  def self.filter(params)
    jobs = Job.where(type: params[:type].singularize.capitalize) if params[:type]
  end

  def self.artbar
    ART
  end

  def self.graphicbar
    GRAPHIC
  end

  private

  def assign_client
    if client_name
      # some_client = Client.find_or_create_by_name(client_name)
      some_client = Client.where(name: client_name).first_or_create!
      self.client_id = some_client.id
    end
  end

end

class Human < Job
end

class Abstract < Job
end

class Serial < Job
end

class Pattern < Job
end

class Character < Job
end

class Wall < Job
end