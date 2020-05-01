RSpec.describe Api::V1::Tickets::CreateContract do
  subject(:result) { Api::V1::Tickets::CreateContract.new.call(params) }

  let(:params) do
    {
      request_number: '00121048-05415',
      sequence_number: 2649,
      request_type: 'Normal',
      response_due_date_time_at: 5.days.from_now.to_datetime,
      primary_sa_code: 'ZZGL103',
      additional_sa_codes: %w[ZZL01 ZZL02 ZZL03],
      digsite_info: 'POLYGON ((-81.1 32.1, -81.1 32.0, -81.0 32.0, -80.0 31.9, -81.1 32.1))',
      excavator: {
        company_name: 'Some Construction',
        address: {
          street: 'Some Street 43',
          city: 'Some City',
          state: 'Some State',
          zip: 'ZZ0334'
        },
        crew_on_site: true
      }
    }
  end

  context 'when params are valid' do
    it 'returns successful result' do
      expect(result.success?).to be_truthy
    end

    it 'contains no errors' do
      expect(result.errors).to be_empty
    end
  end

  context 'when params are invalid' do
    context 'when digsite_info is invalid' do
      it_behaves_like 'field with presence validation', :request_number
      it_behaves_like 'field with type validation', :request_number, :str

      context 'with wrong polygon format' do
        before do
          params[:digsite_info] = 'POLYGON WRONG FORMAT'
        end

        it 'returns unsuccessful result' do
          expect(subject.failure?).to be_truthy
        end

        it 'contains appropriate error message' do
          expect(subject.errors[:digsite_info]).to include('Polygon field has invalid format')
        end
      end
    end

    context 'when request_number is invalid' do
      it_behaves_like 'field with presence validation', :request_number
      it_behaves_like 'field with type validation', :request_number, :str
    end

    context 'when sequence_number is invalid' do
      it_behaves_like 'field with presence validation', :sequence_number
      it_behaves_like 'field with type validation', :sequence_number, :int
    end

    context 'when request_type is invalid' do
      it_behaves_like 'field with presence validation', :request_type
      it_behaves_like 'field with type validation', :request_type, :str
    end

    context 'when response_due_date_time_at is invalid' do
      it_behaves_like 'field with presence validation', :response_due_date_time_at
      it_behaves_like 'field with type validation', :response_due_date_time_at, :date_time
    end

    context 'when response_due_date_time_at is invalid' do
      it_behaves_like 'field with presence validation', :response_due_date_time_at
      it_behaves_like 'field with type validation', :response_due_date_time_at, :date_time
    end

    context 'when primary_sa_code is invalid' do
      it_behaves_like 'field with presence validation', :primary_sa_code
      it_behaves_like 'field with type validation', :primary_sa_code, :str
    end

    context 'when additional_sa_codes is invalid' do
      it_behaves_like 'field with presence validation', :additional_sa_codes
      it_behaves_like 'field with type validation', :additional_sa_codes, :array
    end

    context 'when excavator is invalid' do
      it_behaves_like 'field with type validation', :excavator, :hash
    end

    context 'when excavator fields are invalid' do
      context 'when company_name is invalid' do
        it_behaves_like 'field with presence validation', [:excavator, :company_name]
        it_behaves_like 'field with type validation', [:excavator, :company_name], :str
      end

      context 'when crew_on_site is invalid' do
        it_behaves_like 'field with presence validation', [:excavator, :crew_on_site]
        it_behaves_like 'field with type validation', [:excavator, :crew_on_site], :bool
      end

      context 'when address is invalid' do
        it_behaves_like 'field with type validation', [:excavator, :address], :hash
      end

      context 'when street is invalid' do
        it_behaves_like 'field with presence validation', [:excavator, :address, :street]
        it_behaves_like 'field with type validation', [:excavator, :address, :street], :str
      end

      context 'when city is invalid' do
        it_behaves_like 'field with presence validation', [:excavator, :address, :city]
        it_behaves_like 'field with type validation', [:excavator, :address, :city], :str
      end

      context 'when state is invalid' do
        it_behaves_like 'field with presence validation', [:excavator, :address, :state]
        it_behaves_like 'field with type validation', [:excavator, :address, :state], :str
      end

      context 'when zip is invalid' do
        it_behaves_like 'field with presence validation', [:excavator, :address, :zip]
        it_behaves_like 'field with type validation', [:excavator, :address, :zip], :str
      end
    end
  end
end
