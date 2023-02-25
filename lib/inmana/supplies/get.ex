defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  def call(id) do
    Repo.get(Supply, id) |> handle_insert
  end

  defp handle_insert(%Supply{} = supply), do: {:ok, supply}

  defp handle_insert(nil), do: {:error, %{result: "Supply not found", status: :not_found}}
end
