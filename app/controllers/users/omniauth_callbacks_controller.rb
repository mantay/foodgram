class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def self.providers_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.from_omniauth(request.env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect @user, :event => :authentication
          set_flash_message(:notice, :success, :kind => "#{provider}") if is_navigational_format?
        else
          session["devise.#{provider}_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end      
    }
  end

  [:facebook, :vkontakte, :twitter, :instagram].each do |provider|
    providers_callback_for provider
  end



  def after_sign_in_path_for(resources)
    if resources.email_verified?
      super resources
    else
      finish_signup_path(resources)
    end
  end

end
