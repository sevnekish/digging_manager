# == Schema Information
#
# Table name: tickets
#
#  id                        :bigint           not null, primary key
#  additional_sa_codes       :string           default([]), is an Array
#  digsite_info              :geometry         not null, polygon, 0
#  primary_sa_code           :string
#  request_number            :string           not null
#  request_type              :string           not null
#  response_due_date_time_at :datetime         not null
#  sequence_number           :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
FactoryBot.define do
  factory :ticket do
    request_number { "#{Faker::Number.decimal_part(digits: 8)}-#{Faker::Number.decimal_part(digits: 5)}" }
    request_type { 'Normal' }

    sequence_number { Faker::Number.number(digits: 4) }

    response_due_date_time_at { 5.days.from_now }

    primary_sa_code { 'ZZGL103' }
    additional_sa_codes { %w[ZZL01 ZZL02 ZZL03] }

    digsite_info do
      random_coordinates_str = -> () { [Faker::Address.latitude, Faker::Address.longitude].join(' ') }

      first_last_point = random_coordinates_str.call

      intermediate_points =  rand(2..5).times.map { random_coordinates_str.call }

      "POLYGON((#{[first_last_point, *intermediate_points, first_last_point].join(',')}))"
    end
  end
end
