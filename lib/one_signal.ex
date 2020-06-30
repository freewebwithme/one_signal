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
    %{"Authorization" => "Basic " <> api_key, "Content-type" => "application/json"}
  end

  defp config do
    Application.get_env(:one_signal, OneSignal)
  end

  def fetch_user_auth_key do
    config()[:user_auth_key] || System.get_env("ONE_SIGNAL_USER_AUTH_KEY")
  end

  #  defp fetch_api_key do
  #    config()[:api_key] || System.get_env("ONE_SIGNAL_API_KEY")
  #  end
  #
  #  def fetch_app_id do
  #    config()[:app_id] || System.get_env("ONE_SIGNAL_APP_ID")
  #  end
end
