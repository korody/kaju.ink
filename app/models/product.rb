class Product < ActiveRecord::Base
  attr_accessible :link, :title, :type, :thumbnails_attributes, :products_attributes

  belongs_to :marketable, polymorphic: true

  has_many :thumbnails, as: :thumbable, dependent: :destroy

  accepts_nested_attributes_for :thumbnails

  TYPES = %w[Society Urban]
  validates :type, presence: true, inclusion: { in: TYPES }

  scope :society, where(type: 'Society')
  scope :urban, where(type: 'Urban')

  def self.filter(params)
    products = Product.where(type: params[:type].singularize.capitalize) if params[:type]
  end

  def self.shop
    TYPES
  end

end

class Society < Product
end

class Urban < Product
end