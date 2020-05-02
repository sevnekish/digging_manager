class TicketsController < ApplicationController
  def index
    @pagy, @tickets = pagy(Ticket.all.includes(:excavator))
  end

  def show
    @ticket = Decorators::Ticket.new(
      Ticket.includes(:excavator).find(params[:id])
    )
  end
end
