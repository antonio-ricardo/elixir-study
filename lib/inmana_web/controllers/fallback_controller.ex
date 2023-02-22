defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  alias InmanaWeb.ErrorView

  def call(con, {:error, %{result: result, status: status}}) do
    con |> put_status(status) |> put_view(ErrorView) |> render("error.json", result: result)
  end
end
