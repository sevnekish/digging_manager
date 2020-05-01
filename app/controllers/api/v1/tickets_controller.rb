class Api::V1::TicketsController < Api::V1::BaseController
  def create
    operation_result = Api::V1::Tickets::CreateOperation.call(params.to_unsafe_hash)

    if operation_result.success?
      respond_with_serialized_resource_for(operation_result.value!, status: :created)
    else
      render_error(operation_result.failure.errors.to_h, :unprocessable_entity)
    end
  end
end
