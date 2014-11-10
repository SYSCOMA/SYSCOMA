FactoryGirl.define do
  factory :user do
    email "joao@joaodasilva.com.br"
    name "João da Silva"
    password "12345asd"
    password_confirmation "12345asd"
    admin false
  end

  factory :admin, class: User do
    email "admin@admin.com.br"
    name "administrator of the system"
    password "12345asd"
    password_confirmation "12345asd"
    admin true
  end
end
