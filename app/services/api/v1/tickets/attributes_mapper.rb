module Api::V1::Tickets
  class AttributesMapper
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      {
        request_number: params['RequestNumber'],
        request_type: params['RequestType'],
        sequence_number: params['SequenceNumber'].to_i,
        response_due_date_time_at: response_due_date_time_at,
        primary_sa_code: params.dig('ServiceArea', 'PrimaryServiceAreaCode', 'SACode'),
        additional_sa_codes: params.dig('ServiceArea', 'AdditionalServiceAreaCodes', 'SACode'),
        digsite_info: params.dig('ExcavationInfo', 'DigsiteInfo', 'WellKnownText'),
        excavator: excavator_attributes
      }
    end

    private

    def response_due_date_time_at
      date_time_str = params.dig('DateTimes', 'ResponseDueDateTime')

      date_time_str.present? ? DateTime.parse(date_time_str) : nil
    end

    def excavator_attributes
      {
        company_name: excavator_params['CompanyName'],
        address: excavator_address,
        crew_on_site: ActiveModel::Type::Boolean.new.cast(excavator_params['CrewOnsite'])
      }
    end

    def excavator_address
      {
        street: excavator_params['Address'],
        city: excavator_params['City'],
        state: excavator_params['State'],
        zip: excavator_params['Zip']
      }
    end

    def excavator_params
      @excavator_params ||= params.fetch('Excavator', {})
    end
  end
end
