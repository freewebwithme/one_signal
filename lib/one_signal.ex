defmodule OneSignal do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = []

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OneSignal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def endpoint, do: "https://onesignal.com/api/v1"

  def new do
    %OneSignal.Param{}
  end

  def auth_header(api_key) do
    IO.puts("Printing auth_header")

    auth_header = %{"Authorization" => "Basic " <> api_key, "Content-type" => "application/json"}
    IO.inspect(auth_header)
    auth_header
  end

  #  defp fetch_api_key do
  #    config()[:api_key] || System.get_env("ONE_SIGNAL_API_KEY")
  #  end
  #
  #  def fetch_app_id do
  #    config()[:app_id] || System.get_env("ONE_SIGNAL_APP_ID")
  #  end
end
