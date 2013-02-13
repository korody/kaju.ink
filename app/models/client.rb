class Client < ActiveRecord::Base
  attr_accessible :name, :type, :job_id, :thumbnails_attributes

  has_many :jobs

  has_many :thumbnails, as: :thumbable, dependent: :destroy

  accepts_nested_attributes_for :thumbnails
  
  TYPES = %w[Person Company]
  validates :type, presence: true, inclusion: { in: TYPES }, on: :update

  scope :person, where(type: 'Person')
  scope :company, where(type: 'Company')

  def self.filter(params)
    products = Client.where(type: params[:type].singularize.capitalize) if params[:type]
  end

  def self.clientes
    TYPES
  end

end


class Person < Client
end

class Company < Client
end