class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :type
      t.integer :job_id

      t.timestamps
    end
  end
end
