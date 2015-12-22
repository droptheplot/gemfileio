class Api::V1::ApplicationController < ActionController::Base
  include ActionController::Serialization

  before_filter :set_headers, :set_current_user

  serialization_scope :view_context

  def not_found
    render json: { 'error' => 'Not found' }, :status => 404
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

  def authenticate!
    head :unauthorized unless current_user
  end

  def authenticate_admin!
    head :unauthorized unless current_user && current_user.admin?
  end

  def has_permissions user
    head :unauthorized unless user == current_user
  end

  def current_user
    @current_user
  end

  def set_current_user
    token = request.headers['Authorization'].to_s.split(' ').last

    return unless token

    payload = JWT.decode(token, Rails.application.secrets.jwt_secret, 'HS512').first rescue nil

    return unless payload

    if payload && Time.now < Time.at(payload['exp'].to_i)
      @current_user = User.find(payload['user']['id'])
    end
  end
end
