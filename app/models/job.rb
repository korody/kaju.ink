class Job < ActiveRecord::Base
  attr_accessor :client_name, :thumbnails_ids, :attachments_ids

  before_save :youtube_video, :assign_client

  belongs_to :client

  has_many :attachments, -> { order("attachments.created_at ASC") }, as: :attachable, dependent: :destroy

  has_many :thumbnails, as: :thumbable, dependent: :destroy
  
  has_many :products, as: :marketable

  accepts_nested_attributes_for :attachments, :thumbnails, :products, :client

  TYPES = %w[Human Abstract Serial Character Wall Expo Canvas Animal Pattern Collage Branding Institutional Event Cocreation]
  validates :type, presence: true, inclusion: { in: TYPES }
  
  ART = %w[Human Character Animal Abstract Wall Canvas Serial Expo]
  GRAPHIC = %w[Pattern Collage Branding Institutional Event Cocreation]

  scope :art, -> { where(type: ART) }
  scope :graphic, -> { where(type: GRAPHIC) }

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

  # def client_name
  #   client.try(:name)
  # end
  
  # def client_name=(name)
  #   self.client = Client.where(name: name).first_or_create! if name.present?
  # end

  private

    include PgSearch
    pg_search_scope :search, against: [:title, :type],
    using: {tsearch: {prefix: true, any_word: true, dictionary: "english"},
            trigram: {threshold: 0.1}},
    ignoring: :accents
    
    def self.text_search(query)
      if query.present?
        search(query)
      else
        scoped
      end
    end

    def assign_client
      unless client_name.blank?
        some_client = Client.where(name: client_name).first_or_create!
        self.client_id = some_client ? some_client.id : 0
      end
    end
end

class Human < Job
end

class Animal < Job
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

class Canvas < Job
end

class Pattern < Job
end

class Collage < Job
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