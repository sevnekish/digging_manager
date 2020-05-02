module Api::V1::Tickets
  class CreateOperation < Api::Operation
    def call
      validation_result = yield validate_params(mapped_attributes)

      Ticket.transaction do
        ticket = yield create_ticket(validation_result.values.except(:excavator))

        ticket.excavator = yield create_excavator(validation_result.values[:excavator].merge(ticket: ticket))

        Success(ticket)
      end
    end

    private

    def mapped_attributes
      AttributesMapper.new(params).call
    end

    def validate_params(mapped_attributes)
      CreateContract.new.call(mapped_attributes).to_monad
    end

    def create_ticket(ticket_attributes)
      ticket = Ticket.create(ticket_attributes)
      Success(ticket)
    end

    def create_excavator(excavator_attributes)
      excavator = Excavator.create(excavator_attributes)
      Success(excavator)
    end
  end
end
