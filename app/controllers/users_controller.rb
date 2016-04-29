class UsersController < ApplicationController
  def oauth
    auth = send(params[:provider], params[:code])

    user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize

    user.name = auth.name if user.new_record?
    user.save
    session[:user_id] = user.id

    redirect_to root_path
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def github(code)
      token = Octokit.exchange_code_for_token(
        code,
        Rails.application.secrets.github_client_id,
        Rails.application.secrets.github_client_secret,
        {
          accept: 'application/json'
        }
      )

      client = Octokit::Client.new(:access_token => token[:access_token])

      OpenStruct.new(
        uid: client.user.id,
        name: client.user.login,
        provider: 'github'
      )
    end
end
