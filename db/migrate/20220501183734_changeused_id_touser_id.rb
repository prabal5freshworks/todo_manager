class ChangeusedIdTouserId < ActiveRecord::Migration[7.0]
  def change 
    rename_column :todos, :used_id , :user_id
    
  end
end
