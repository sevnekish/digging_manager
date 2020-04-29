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
RSpec.describe Ticket do
  describe 'relations' do
    it { is_expected.to have_one :excavator }
  end
end
