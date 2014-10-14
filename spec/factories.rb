FactoryGirl.define do 
  factory :user do
    username                   "Example"
    email                      "exm@mail.com"
    password                   "foobar"
    password_confirmation      "foobar"
  end
end
