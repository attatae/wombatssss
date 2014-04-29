class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_name
      t.text :about

      t.timestamps
    end
  end
end
