class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.text :todo_text
      t.date :due_date
      t.boolean :completed

      t.timestamps
    end
  end
end
