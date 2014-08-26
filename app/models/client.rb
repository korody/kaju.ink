class Client < ActiveRecord::Base
  has_many :jobs

  has_many :thumbnails, as: :thumbable, dependent: :destroy

  accepts_nested_attributes_for :thumbnails
  
  TYPES = %w[Person Company]
  # validates :type, presence: true, inclusion: { in: TYPES }, on: :update

  scope :person, where(type: 'Person')
  scope :company, where(type: 'Company')

  def self.filter(params)
    products = Client.where(type: params[:type].singularize.capitalize) if params[:type]
  end

  def self.clientes
    TYPES
  end

  include PgSearch
  pg_search_scope :search, against: :name,
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

  def self.tokens(term)
    clients = where("name ilike ?", "%#{term}%").map(&:name)
    clients.empty? ? [{id: "<<<#{term}>>>", name: "NENHUM CLIENTE \"#{term}\" ENCONTRADO!"}] : clients
  end
end


class Person < Client
end

class Company < Client
end