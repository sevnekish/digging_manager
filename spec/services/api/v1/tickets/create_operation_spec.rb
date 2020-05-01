RSpec.describe Api::V1::Tickets::CreateOperation do
  subject(:result) { described_class.new(params).call }

  let(:params) do
    JSON.parse(Rails.root.join('spec', 'fixtures', 'api', 'v1', 'tickets', 'create_request.json').read)
  end

  context 'when params are valid' do
    it 'returns successful result' do
      expect(result).to be_success
    end

    it 'returns result with persisted ticket' do
      expect(result.value!).to be_persisted
    end

    it 'returns result with persisted ticket excavator' do
      expect(result.value!.excavator).to be_persisted
    end

    it 'creates new ticket' do
      expect { result }.to change { Ticket.count }.by(1)
    end

    it 'creates new excavator' do
      expect { result }.to change { Excavator.count }.by(1)
    end
  end

  context 'when params are invalid' do
    let(:params) { {} }

    it 'returns unsuccessful result' do
      expect(result).to be_failure
    end

    it 'returns result with errors' do
      expect(result.failure.errors.to_h).to be_any
    end
  end
end
