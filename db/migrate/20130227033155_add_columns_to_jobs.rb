class AddColumnsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :video, :string
    add_column :jobs, :website, :string
  end
end
