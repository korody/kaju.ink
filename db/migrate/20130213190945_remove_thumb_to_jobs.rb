class RemoveThumbToJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :thumb
    remove_column :jobs, :client_name
  end
end
