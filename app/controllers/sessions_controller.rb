class SessionsController < ApplicationController
     
    def create
         user = User.find_by(username: params[:session][:username].downcase)
         if user && user.authenticate(params[:session][:password])
              session[:user_id] = user.id
              flash[:success] = "Logged in successfully."
              redirect_to root_path
         else
            flash.now[:warning] = "There was something wrong with your login details."
            render 'new'
         end
    end
 
    def destroy
         session[:user_id] = nil
        flash[:info] = "You have been logged out."
         redirect_to root_path
    end
end