require 'spec_helper'

describe "Authentication" do 

  subject { page }

  describe "Signup page" do
    before { visit new_user_registration_path }

    let(:submit) { 'Создать аккаунт' }

    describe "with invalid information" do
      it "should not create a user" do
        expect{ click_button submit }.not_to change(User, :count)
      end
    end

    describe "after submition" do
      before { click_button submit }

      it { should have_content("Регистрация") }
      it { should have_content('error') }
    end

   describe "with valid information" do 
    let(:user) { FactoryGirl.create(:user) }
      before do 
        fill_in "user_username",               with: "Example"
        fill_in "Email",                       with: "exm.mail.com"
        fill_in "user_password",               with: "foobar"
        fill_in "user_password_confirmation",  with: "foobar"

        click_button submit
      end

      it "should create a user" do 
        expect { user }.to change(User, :count).by(1)
      end
     
   end

    describe "after saving the user" do
      before { click_button submit }
      let(:user) { User.find_by(email: "exm@mail.com") }

      it { should have_title(user) }
    end

    it { should have_title("Регистрация") }
  end


  describe "Signin page" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Войти" }

      it { should have_content("Войти") }
      it { should have_selector("div.alert-alert", text: "Invalid email or password.") }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) } 
      # let(:user) { User.find_by(email: "exm@mail.com") }
      before do
        fill_in "Email",      with: user.email
        fill_in "Password",   with: user.password

        click_button "Войти"
      end

      it { should have_title(user.username) }
      it { should have_selector("div.alert-notice", text: "Signed in successfully.") }
      it { should have_selector("a", text: "Профиль") }
      it { should have_selector("a", text: "Настройки") }
      it { should have_selector("a", text: "Пользователи") }

    end

    it { should have_content("Войти")}

  end

end
