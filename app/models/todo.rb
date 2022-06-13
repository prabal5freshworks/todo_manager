class Todo < ApplicationRecord
    validates:todo_text , presence: true
    validates:todo_text , length: {minimum: 2}
    validates:due_date , presence:true 
    belongs_to :user


    # table called "users"
    # todos table will contain "user_id"    


    # i did 1 mistake during migration 


    def due_today?
        due_date == Date.today
    end

    def self.overdue
        all.where("due_date < ?",Date.today)
    end

    def self.due_today
        all.where("due_date = ?",Date.today)
    end

    def self.due_later
        all.where("due_date > ?",Date.today)
    end

    def self.completed
        all.where(completed: true)
    end
end
