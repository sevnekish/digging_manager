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
RSpec.describe Excavator do
  describe 'relations' do
    it { is_expected.to belong_to :ticket }
  end
end
