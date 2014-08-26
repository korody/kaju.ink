class Clipping < ActiveRecord::Base
  attr_accessor :thumbnails_ids, :attachments_ids

  before_save :youtube_video

  has_many :thumbnails, as: :thumbable, dependent: :destroy
  has_many :attachments, -> { order("attachments.created_at ASC") }, as: :attachable, dependent: :destroy

  accepts_nested_attributes_for :thumbnails, :attachments

  TYPES = %w[Editorial Blog Interview]
  validates :type, presence: true, inclusion: { in: TYPES }

  scope :editorial, -> { where(type: 'Editorial') }
  scope :blog, -> { where(type: 'Blog') }
  scope :interview, -> { where(type: 'Interview') }

  def self.filter(params)
    clippings = Clipping.where(type: params[:type].singularize.capitalize) if params[:type]
  end

  def self.source
    TYPES
  end

  def youtube_video
    if video
      self.video = video.gsub("watch?v=", "embed/").gsub("http://www", "https://www")
    end  
  end

  private

  include PgSearch
  pg_search_scope :search, against: [:title, :link, :type],
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
end

class Editorial < Clipping
end

class Blog < Clipping
end

class Interview < Clipping
end