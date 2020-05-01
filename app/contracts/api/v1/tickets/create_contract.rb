module Api::V1::Tickets
  class CreateContract < Dry::Validation::Contract
    params do
      required(:request_number).filled(:str?)
      required(:request_type).filled(:str?)

      required(:sequence_number).filled(:int?)

      required(:response_due_date_time_at).filled(:date_time?)

      required(:primary_sa_code).filled(:str?)
      required(:additional_sa_codes).filled(:array?)

      required(:digsite_info).filled(:str?)

      required(:excavator).hash do
        required(:company_name).filled(:str?)

        required(:address).hash do
          required(:street).filled(:str?)
          required(:city).filled(:str?)
          required(:state).filled(:str?)
          required(:zip).filled(:str?)
        end

        required(:crew_on_site).filled(:bool?)
      end
    end

    rule(:digsite_info) do
      RGeo::WKRep::WKTParser.new.parse(value)
    rescue RGeo::Error::ParseError, RGeo::Error::InvalidGeometry
      key.failure(I18n.t('dry_schema.errors.digsite_info.wrong_format'))
    end
  end
end
