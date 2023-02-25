defmodule InmanaWeb.SuppliesController do
  use InmanaWeb, :controller

  alias Inmana.Supply
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(con, params) do
    with {:ok, %Supply{} = supply} <- Inmana.create_supply(params) do
      con |> put_status(:created) |> render("create.json", supply: supply)
    end
  end

  def show(con, %{"id" => id}) do
    with {:ok, %Supply{} = supply} <- Inmana.get_supply(id) do
      con |> put_status(:ok) |> render("show.json", supply: supply)
    end
  end
end
