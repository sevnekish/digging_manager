# == Schema Information
#
# Table name: excavators
#
#  id           :bigint           not null, primary key
#  address      :jsonb            not null
#  company_name :string           not null
#  crew_on_site :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  ticket_id    :bigint
#
# Indexes
#
#  index_excavators_on_ticket_id  (ticket_id)
#
# Foreign Keys
#
#  fk_rails_...  (ticket_id => tickets.id)
#
FactoryBot.define do
  factory :excavator do
    ticket

    company_name { FFaker::Company.name }
    address do
      {
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip: Faker::Address.zip_code
      }
    end
    crew_on_site { true }
  end
end
