class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

 
  def index
    @users = User.paginate(page: params[:page])
  end

  def finish_signup
    flash.now[:notice] = "Укажите свой email (он будет использоваться для входа в систему)"
 
    if request.patch?
      if current_user.update_attributes(email: params['user']['email'])
        redirect_to current_user
        flash[:notice] = "Ваш почтовый адрес '#{params['user']['email']}'' успешно обновлен"
      end
    end
  end

  def combine_profiles
    unless params['user']['email'].empty?
      @user = User.find_by(email: params['user']['email'])
      if @user.valid_password?(params['user']['password'])
        ident = Identity.find_by(user_id: params[:id])
        
        if params['user']['migrate'] == '1'
          @user.update_attributes(username: current_user.username)       
        end

        ident.update_attributes(user_id: @user.id)
        social_profile_destroy
        redirect_to current_user
      end
    end
  end

  def merge_profiles
    @all_social_profiles = ["vkontakte", "twitter", "instagram", "facebook"]
    @social_profiles = current_user.identity
  end

  private

    def social_profile_destroy
      user_delete_id = current_user.id
      current_user.destroy
      sign_in @user
    end
end
