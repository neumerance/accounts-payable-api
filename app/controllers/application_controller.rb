class ApplicationController < ActionController::API
  before_action :authenticate_user_by_user_token

  private

  def authenticate_user_by_user_token
    raise UnAuthorizedAccess unless current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(token: token)
  end

  def token
    token = request.headers['HTTP_AP_AUTH_TOKEN']

    raise UnAuthorizedAccess unless token.present?

    @token ||= token
  end

  class UnAuthorizedAccess < StandardError
    def message
      return I18n.t('exceptions.unauthorized_access')
    end
  end
end
