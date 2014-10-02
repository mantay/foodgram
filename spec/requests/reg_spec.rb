require 'spec_helper'

describe "Authentication" do 

  subject { page }

  describe "Signup page" do
    before { visit new_user_registration_path }

    let(:submit) { 'Create my account' }

    describe "with invalid information" do
      it "should not create a user" do
        expect{ click_button submit }.not_to change(User, :count)
      end
    end

    describe "after submition" do
      before { click_button submit }

      it { should have_content("Sign up") }
      it { should have_content('error') }
    end

    describe "with valid information" do 
      before do 
        fill_in "Username",        with: "Example"
        fill_in "Email",           with: "exm@mail.com"
        fill_in "Password",        with: "foobar"
        fill_in "confirmation",    with: "foobar"
      end

      it "should create a user" do 
        expect{ click_button submit }.to change(User, :count).by(1)
      end
    end 

    describe "after saving the user" do
      before { click_button submit }
      let(:user) { User.find_by(email: "exm@mail.com") }

      it { should have_title(user) }
    end

    it { should have_title("Sign up") }
  end

  describe "Signin page" do 
    let(:user) { User.find_by(email: "exm@mail.com") }
    before do 
      visit new_user_session_path
      fill_in "Email",       with: "exm@mail.com"
      fill_in "Password",       with: "foobar"
    end

    it {should have_title(user) }
  end

end