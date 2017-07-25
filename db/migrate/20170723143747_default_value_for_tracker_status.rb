class DefaultValueForTrackerStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :trackers, :status, :boolean, :default => false
  end
end
