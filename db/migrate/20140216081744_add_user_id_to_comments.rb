class AddUserIdToComments < ActiveRecord::Migration
  def change
  	#add_column :comments, :user_id, :integer
  	#after fixing profile_name (manually from schema and loading from there) started getting this error.
  	#add_index :comments, :user_id
  	#says it already exists
  	#remove_column :comments, :commenter
  end
end
