defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.{Restaurants.Create, Restaurant}
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(con, params) do
    with {:ok, %Restaurant{} = restaurant} <- Create.call(params) do
      con |> put_status(:created) |> render("create.json", restaurant: restaurant)
    end
  end
end
