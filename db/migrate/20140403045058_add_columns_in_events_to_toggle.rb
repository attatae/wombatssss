class AddColumnsInEventsToToggle < ActiveRecord::Migration
  def change
    add_column :events, :show_address, :boolean
    add_column :events, :show_location, :boolean
    add_column :events, :show_time, :boolean
  end
end
