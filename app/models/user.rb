class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
    enum clearance_level: [:free_user, :silver_user, :gold_user, :admin]
   
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    has_many :course_enrollments
    has_many :courses, through: :course_enrollments
    
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
    
    def sign_in_from_omniauth(auth)
        find_by(provider: auth['provider'], uid: auth['uid'] || create_user_from_omniauth)
    end
    
end
