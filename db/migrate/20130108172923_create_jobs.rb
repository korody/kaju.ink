class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :client
      t.string :client_info
      t.string :spot
      t.string :title
      t.string :what
      t.string :area
      t.string :duration
      t.string :material
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
