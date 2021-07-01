class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notify] = "Something went wrong. Try again!"
            redirect_to signin_path
        end
    end
    
    def omniauth
        binding.pry
    end

    def destroy
        if current_user
            session.destroy
            redirect_to root_path
        end
    end
end