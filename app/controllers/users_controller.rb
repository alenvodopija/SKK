class UsersController < ApplicationController

    def new
         @user = User.new
    end
 
    def create
        @user = User.create(user_params)
        if !@user.errors.any?
            flash[:info] = "User created."
            session[:user_id] = @user.id
            redirect_to root_path
        else
             flash[:warning] = "User data is incorrect."
             render 'new'
        end
    end
    
    private
 
    def user_params
        params.require(:user).permit(:first_name,:last_name,:email,:username,:password)
    end

    
    
end

