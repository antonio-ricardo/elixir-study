defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurante criado com sucesso",
      restaurant: restaurant
    }
  end
end
