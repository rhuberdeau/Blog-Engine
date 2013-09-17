FactoryGirl.define do
  factory :user do 
    email "bob@mail.com"
    password "password"
    password_confirmation "password"
  end
  factory :article, class: BlogEngine::Article do
    title  "my really awesome blog post"
    content "I'm a little light on content"
    published "true"
  end
  factory :comment, class: BlogEngine::Comment do
    content "foo bar and what not"
    article_id 1
  end
end
