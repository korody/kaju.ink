class CreateClippings < ActiveRecord::Migration
  def change
    create_table :clippings do |t|
      t.string :title
      t.string :link
      t.string :type
      t.string :video
      t.text :description
      t.string :website
      t.string :date
      t.string :country

      t.timestamps
    end
  end
end