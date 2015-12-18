class Api::V1::UsersController < Api::V1::ApplicationController
  def oauth
    auth = send(params[:provider], params[:code])

    user = User.where(provider: auth[:provider], uid: auth[:uid]).first_or_initialize
    user.name = auth[:name]
    user.save

    render json: { token: user.token }
  end

  private

    def github(code)
      token = Octokit.exchange_code_for_token(
        code,
        Rails.application.secrets.github_client_id,
        Rails.application.secrets.github_client_secret,
        { accept: 'application/json' }
      )

      client = Octokit::Client.new(:access_token => token[:access_token])

      {
        uid: client.user.id,
        name: client.user.login,
        provider: 'github'
      }
    end
end
