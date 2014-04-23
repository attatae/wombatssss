class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
      t.boolean :attend, default: false

      t.timestamps
    end
  end
end
