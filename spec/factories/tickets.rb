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
      'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))'
    end

    trait :with_excavator do
      excavator
    end
  end
end
