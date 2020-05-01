RSpec.describe Api::V1::Tickets::AttributesMapper do
  subject(:result) { described_class.new(raw_params).call }

  let(:raw_params) do
    JSON.parse(Rails.root.join('spec', 'fixtures', 'api', 'v1', 'tickets', 'create_request.json').read)
  end

  let(:expected_attributes) do
    {
      request_number: '09252012-00001',
      request_type: 'Normal',
      sequence_number: 2421,
      response_due_date_time_at: DateTime.parse('2011/07/13 23:59:59'),
      primary_sa_code: 'ZZGL103',
      additional_sa_codes: %w[ZZL01 ZZL02 ZZL03],
      digsite_info: 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))', # rubocop:disable Layout/LineLength
      excavator: {
        company_name: 'John Doe CONSTRUCTION',
        address: {
          street: '555 Some RD',
          city: 'SOME PARK',
          state: 'ZZ',
          zip: '55555'
        },
        crew_on_site: true
      }
    }
  end

  context 'when all attributes are valid' do
    it 'returns hash of mapped attributes' do
      expect(result).to eq(expected_attributes)
    end
  end
end
