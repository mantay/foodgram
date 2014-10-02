require 'spec_helper'

describe User do 
  before { @user = User.new(username: "fooname", email: "foo@mail.com", password: "doobar",
                            password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  describe "when name is too long" do
    before { @user.username = "a" * 51 }
    it { should_not be_valid}
  end

  describe "when nave is too short" do
    before { @user.username = "a" *2 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it {should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |inv_address|
        @user.email = inv_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it {should_not be_valid }
  end

   describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

end
