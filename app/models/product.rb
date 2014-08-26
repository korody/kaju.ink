class Product < ActiveRecord::Base
  belongs_to :marketable, polymorphic: true

  has_many :thumbnails, as: :thumbable, dependent: :destroy

  accepts_nested_attributes_for :thumbnails

  TYPES = %w[Society Urban]
  validates :type, presence: true, inclusion: { in: TYPES }

  scope :society, -> { where(type: 'Society') }
  scope :urban, -> { where(type: 'Urban') }

  def self.filter(params)
    products = Product.where(type: params[:type].singularize.capitalize) if params[:type]
  end

  private

    include PgSearch
    pg_search_scope :search, against: :title,
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

class Society < Product
end

class Urban < Product
end