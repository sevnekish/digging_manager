RSpec.shared_examples 'field with presence validation' do |field|
  context "when the #{field} is empty" do
    before do
      dig_set(params, field, nil)
    end

    it 'returns unsuccessful result' do
      expect(subject).to be_failure
    end

    it 'contains appropriate error message' do
      expect(subject.errors.to_h.dig(*field)).to include('must be filled')
    end
  end
end
