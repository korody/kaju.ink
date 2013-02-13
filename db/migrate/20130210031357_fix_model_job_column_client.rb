class FixModelJobColumnClient < ActiveRecord::Migration

  def change
    rename_column :jobs, :client, :client_name
  end

end