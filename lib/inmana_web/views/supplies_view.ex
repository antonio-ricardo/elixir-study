defmodule InmanaWeb.SuppliesView do
  use InmanaWeb, :view

  def render("create.json", %{supply: supply}) do
    %{
      message: "Suprimento criado com sucesso",
      supply: supply
    }
  end

  def render("show.json", %{supply: supply}) do
    %{
      supply: supply
    }
  end

  def render("showByExpiration.json", %{supplies: supplies}) do
    %{
      suppliesToExpirate: supplies
    }
  end
end
