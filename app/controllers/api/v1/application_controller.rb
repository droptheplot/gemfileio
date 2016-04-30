class Api::V1::ApplicationController < ActionController::Base
  include ActionController::Serialization

  before_filter :set_headers

  def not_found
    render json: { error: 'Not found' }, status: 404
  end

  def default_serializer_options
    { root: false }
  end

  def cors_preflight
    head :ok if request.request_method == 'OPTIONS'
  end

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization'
    headers['Access-Control-Max-Age'] = '1728000'
    headers['Access-Control-Request-Method'] = '*'
  end
end
