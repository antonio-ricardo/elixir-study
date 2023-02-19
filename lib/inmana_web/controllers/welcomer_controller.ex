defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller

  alias Inmana.Welcomer

  def index(con, params) do
    params |> Welcomer.welcome() |> handle_response(con)
  end

  defp handle_response({:ok, message}, con), do: render_response(con, message, :ok)

  defp handle_response({:error, message}, con), do: render_response(con, message, :bad_request)

  defp render_response(con, message, status) do
    con |> put_status(status) |> json(%{message: message})
  end
end
