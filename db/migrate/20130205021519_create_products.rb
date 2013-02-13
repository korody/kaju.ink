class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :link
      t.belongs_to :marketable, polymorphic: true
      t.string :type

      t.timestamps
    end
    add_index :products, :marketable_id
  end
end
