class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :client_info
      t.string :spot
      t.string :title
      t.string :what
      t.string :area
      t.string :duration
      t.string :material
      t.string :video
      t.string :website
      t.text :description
      t.string :type
      t.integer :client_id

      t.timestamps
    end
  end
end
