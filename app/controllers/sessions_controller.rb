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
    
    def google_auth
        @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
            u.email = auth[:info][:email]
            u.author_name = auth[:info][:name]   
        end

        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        if current_user
            session.destroy
            redirect_to root_path
        end
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
end