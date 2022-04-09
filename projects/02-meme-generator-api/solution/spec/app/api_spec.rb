require './app/api'

describe 'GET /healthcheck' do
  def app
    Sinatra::Application
  end

  it 'returns success' do
    get "/healthcheck"

    expect(last_response.status).to eq 200
  end
end