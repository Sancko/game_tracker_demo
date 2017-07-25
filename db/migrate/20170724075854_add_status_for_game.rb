class AddStatusForGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :status, :boolean, default: false
  end
end
