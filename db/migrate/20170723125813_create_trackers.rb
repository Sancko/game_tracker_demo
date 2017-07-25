class CreateTrackers < ActiveRecord::Migration[5.0]
  def change
    #drop_table :trackers
    create_table :trackers do |t|
      t.belongs_to :game, index: true
      t.belongs_to :employee, index: true
      t.boolean :status
      t.timestamps
    end
  end
end
