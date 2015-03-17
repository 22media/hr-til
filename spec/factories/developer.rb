FactoryGirl.define do
  factory :developer do
    sequence :email do |n|
      "developer#{n}@hashrocket.com"
    end

    sequence :username do |n|
      "johndoe#{n}"
    end

    password "ha$hrocket"
    password_confirmation "ha$hrocket"
  end
end
