FactoryBot.define do
  factory :user do
    username { "User1" }
    address {"Porto-Novo"}
    telephone {"22967222311"}
    email { "abc@gmail.com" }
    password { "azerty" }
  end

  factory :admin, class: User do
    username { "UserAdmin" }
    address {"Porto-Novo"}
    telephone {"22967222311"}
    email { "admin@gmail.com" }
    password { "azerty" }
    admin {true}
  end
end
