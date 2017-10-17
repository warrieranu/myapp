class UserController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create_user_from_scratch
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            flash.now[:notice] = "Please try again."
        end
    end
    
    private
    
    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
