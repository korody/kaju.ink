class Job < ActiveRecord::Base
  attr_accessible :area, :client, :client_info, :description, :effort, :material, :spot, :title, :type, :what, :duration, :attachments_attributes

  has_many :attachments, as: :attachable

  accepts_nested_attributes_for :attachments

  TYPES = %w[Human Abstract Serial Pattern Character Wall Branding Co-creation Event Layout Archplan Map]
  validates :type, presence: true, inclusion: { in: TYPES }
  
  ART = %w[Human Abstract Serial Pattern Character Wall]
  GRAPHIC = %w[Branding Cocreation Event Layout Archplan Map]

  scope :art, where(type: TYPES)
  scope :graphic, where(type: GRAPHIC)

  def self.filter(params)
    jobs = Job.where(type: params[:type].singularize.capitalize) if params[:type]
  end

  def self.artbar
    ART
  end

  def self.graphicbar
    GRAPHIC
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
