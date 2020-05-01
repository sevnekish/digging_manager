RSpec.shared_examples 'field with type validation' do |field, type|
  context "when the #{field} is set to the wrong type" do
    wrong_value_map = {
        str: 111,
        default: 'string',
    }

    before do
      wrong_value = wrong_value_map.fetch(type, wrong_value_map[:default])
      dig_set(params, field, wrong_value)
    end

    it 'returns unsuccessful result' do
      expect(subject.failure?).to be_truthy
    end

    it 'contains appropriate error message' do
      expect(subject.errors.to_h.dig(*field)).to include(I18n.t("dry_schema.errors.#{type}?"))
    end
  end
end
