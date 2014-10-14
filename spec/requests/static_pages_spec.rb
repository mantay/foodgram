require 'spec_helper'
require 'support/utilities.rb'

describe "Static pages" do 
  subject { page } 

  describe "Home page" do 
    before { visit root_path }

    it { should have_selector('h1','Foodgram') }
    it { should have_title(full_title('')) }
  end

  it "should have th right links on the layout" do
    visit root_path

    click_link "Зарегистрироваться сейчас!"
    expect(page).to have_title("Регистрация")
  end
end