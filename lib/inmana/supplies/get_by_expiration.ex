defmodule Inmana.Supplies.GetByExpiration do
  import Ecto.Query

  alias Inmana.{Repo, Supply, Restaurant}

  def call(params) do
    params
    |> make_query
    |> Repo.all()
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)
    |> handle_insert()
  end

  defp make_query(%{
         "start_date" => start_date,
         "end_date" => end_date
       }),
       do:
         from(supply in Supply,
           where: ^end_date >= supply.expiration_date and supply.expiration_date >= ^start_date,
           preload: [:restaurant]
         )

  defp make_query(%{"start_date" => start_date}),
    do:
      from(supply in Supply,
        where: supply.expiration_date >= ^start_date,
        preload: [:restaurant]
      )

  defp make_query(%{"end_date" => end_date}),
    do:
      from(supply in Supply,
        where: supply.expiration_date <= ^end_date,
        preload: [:restaurant]
      )

  defp make_query(%{}) do
    today = Date.utc_today()
    beginning_of_week = Date.beginning_of_week(today)
    end_of_week = Date.end_of_week(today)

    from(supply in Supply,
      where:
        ^end_of_week >= supply.expiration_date and supply.expiration_date >= ^beginning_of_week,
      preload: [:restaurant]
    )
  end

  defp handle_insert(%{} = result), do: {:ok, result}
end
