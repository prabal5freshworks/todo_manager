class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
    
    def new
      render "users/new"
    end
  
    

    def create
      user=User.create!(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],

      )
      if user.save
        session[:current_user_id] = user.id
        redirect_to todos_path
        #redirect_to "/"
      else
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
    end
      
    
  
end