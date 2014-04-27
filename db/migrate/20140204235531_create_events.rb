class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :time_begin
      t.string :location
      t.date :event_start
      t.text :text

      t.timestamps
    end
  end
end