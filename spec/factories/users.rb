FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number:6, min_alpha:1, min_numeric:1)}
    password_confirmation {password}
    lastname_kanji        { person.last.kanji }
    firstname_kanji       { person.first.kanji }
    lastname_kana         { person.last.katakana }
    firstname_kana        { person.first.katakana }
    birth_date            {Faker::Date.between(from:'1930-01-01', to:'2017-12-31')}
  end
end
