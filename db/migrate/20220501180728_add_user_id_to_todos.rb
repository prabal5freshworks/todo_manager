class AddUserIdToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :used_id, :bigint
  end
end
