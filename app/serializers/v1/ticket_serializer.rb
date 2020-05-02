class V1::TicketSerializer < V1::BaseSerializer
  attributes :id,
             :request_number,
             :request_type,
             :sequence_number,
             :response_due_date_time_at,
             :primary_sa_code,
             :additional_sa_codes,
             :digsite_info

  has_one :excavator

  def response_due_date_time_at
    object.response_due_date_time_at.to_s
  end

  def digsite_info
    object.digsite_info&.coordinates&.[](0)
  end
end
