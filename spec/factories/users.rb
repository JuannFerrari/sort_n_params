require 'ostruct'

FactoryBot.define do
  factory :user, class: OpenStruct do
    first_name { 'Abigail' }
    last_name { 'Bronn' }
    date_of_birth { 18 }
  end
end
