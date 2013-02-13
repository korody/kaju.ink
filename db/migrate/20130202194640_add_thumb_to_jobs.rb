class AddThumbToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :thumb, :string
  end
end
