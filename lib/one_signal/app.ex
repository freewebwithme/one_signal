defmodule OneSignal.App do
  @moduledoc """
  This module for updating or getting app's information
  """

  def app_url() do
    OneSignal.endpoint() <> "/apps"
  end

  @doc """
  Get a app info
  """
  def get_app_info(app_id) do
    url = app_url() <> "/" <> app_id
    user_auth_key = OneSignal.fetch_user_auth_key()

    case OneSignal.API.get(url, user_auth_key) do
      {:ok, response} ->
        {:ok, response}

      {:error, error_res} ->
        {:error, error_res}
    end
  end
end
