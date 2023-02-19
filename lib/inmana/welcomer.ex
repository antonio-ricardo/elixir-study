defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name |> String.trim() |> String.downcase() |> evaluate(age)
  end

  defp evaluate(_name, age) when age < 18 do
    {:error, "VOU CHAMAR PORRA NENHUMA N VAGABUNDO"}
  end

  defp evaluate("bananinha", _age) do
    {:ok, "CHAMA NA BANANINHA"}
  end

  defp evaluate(name, _age) do
    {:ok, "CHAMA NA BOTA DO #{name}"}
  end
end
