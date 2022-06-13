class TodosController < ApplicationController

    def index
        @todos=Todo.where(user_id: current_user.id)
       # render plain: "I AM PRABAL GHOSH #{DateTime.now.to_s}"
        render "index"
       # render plain: Todo.all
       #render plain: Todo.all.to_a

    end

    def show
        id= params[:id]
        todo=Todo.where(user_id: current_user.id).find(id)
        #debugger
        render "todo"
        #render plain: todo.to_pleasant_string
    end
    
    def create
        todo_text=params[:todo_text]
        # due_date= DateTime.parse(params[:due_date])
        due_date= params[:due_date]
        @todo= Todo.new(
            todo_text: todo_text,
            due_date: due_date,
            completed: false,
            user_id: current_user.id,
        )
        if @todo.save
            redirect_to todos_path
        else
            flash[:error]= new_todo.errors.full_messages.join(", ")
            redirect_to todos_path
        end
        #response_text="hey your new todo is created with id #{new_todo.id}"
        #render palin: response_text
        
    end

    def update
        id = params[:id]
        completed = params[:completed]
        todo = Todo.where(user_id: current_user.id).find(id)
        # if completed
        #     #todo.completed = completed
        #     todo.completed = true
        #     todo.save!
        # else
        #     todo.completed = false
        #     todo.save!
        # end
        todo.completed = params[:completed] ? true : false
        todo.save!

        redirect_to todos_path
      end
    def destroy
        Todo.find(params[:id]).destroy
        # flash[:success] = "Restaurant deleted"
        redirect_to todos_path

    end
    end