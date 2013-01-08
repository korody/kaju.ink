class Client < ActiveRecord::Base
  attr_accessible :area, :client_info, :description, :effort, :material, :spot, :title, :type, :what
end
