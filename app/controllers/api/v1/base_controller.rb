class Api::V1::BaseController < ActionController::API
  def respond_with_serialized_resource_for(resource = nil, options = {})
    render_args = {
      json: resource,
      serializer: lookup_serializer_for(resource, options),
      adapter: :json,
      status: :ok
    }

    render render_args.deep_merge(options)
  end

  def lookup_serializer_for(resource, options, lookup_namespace: 'V1')
    options[:namespace] = lookup_namespace unless options[:namespace].present?
    ActiveModel::Serializer.serializer_for(resource, options)
  end

  def render_error(message, status)
    render json: { error: message }, meta: { success: false }, status: status
  end
end
