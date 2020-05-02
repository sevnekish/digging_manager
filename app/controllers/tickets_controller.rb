class TicketsController < ApplicationController
  def index
    @ticket_attributes = %w[id request_number request_type sequence_number response_due_date_time_at]

    @pagy, @tickets = pagy(Ticket.all.includes(:excavator))
  end

  def show
    @attributes = {
      ticket: %w[request_number request_type sequence_number response_due_date_time_at created_at],
      excavator: %w[company_name crew_on_site full_address]
    }

    @ticket = Decorators::Ticket.new(
      Ticket.includes(:excavator).find(params[:id])
    )
  end
end
