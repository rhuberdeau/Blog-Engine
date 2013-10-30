FactoryGirl.define do
  factory :user do 
    email "bob@mail.com"
    password "password"
    password_confirmation "password"
  end
  factory :article, class: BlogEngine::Article do
    sequence(:title)  { |n| "really awesome blog post number #{n}"}
    content "I'm a little light on content"
    published "true"
  end
end
