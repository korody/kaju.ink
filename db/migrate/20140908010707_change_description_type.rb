class ChangeDescriptionType < ActiveRecord::Migration
  def change
    change_column :clippings, :description, :text
  end
end
