class SessionsController < ApplicationController
    def new
        
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
        # Log the user in and redirect to the user's show page.
        log_in user
        redirect_to user
        
        else
        # Create an error message.
        flash[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
        end
    end
    
    def create_omni_session
        auth = request.env["omniauth.auth"]
        session[:omniauth] = auth.except("extra")
        user = User.sign_in_from_omniauth(auth)
        session[:user_id] = user.id
        redirect_to user, notice: "SIGNED IN"
    end
    
    def destroy
        session[:user_id] = nil
        session[:omniauth] = nil
        redirect_to root_url, notice: "SIGNED OUT"
    end
    
end
