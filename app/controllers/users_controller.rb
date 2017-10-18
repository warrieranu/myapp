class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            @user = User.new
            flash.now[:notice] = "Please try again."
        end
    end
    
    def create_user_from_omniauth(auth)
        create(
            provider: auth['provider'],
            uid: auth['uid'],
            name: auth['info']['name'],
            email: auth['info']['email'],
            password: SecureRandom.hex
            )
        if user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to root_url
        end
            
    end
    
    def self.sign_in_from_omniauth(auth)
        find_by(provider: auth['provider'], uid: auth['uid'] || create_user_from_omniauth)
    end
    
    
    def show
        @user = User.find(params[:id])
    end
    
    private
    
    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
