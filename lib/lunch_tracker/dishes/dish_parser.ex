defmodule LunchTracker.Dishes.DishParser do
  def parse(path) do
    path
    |> get_csv_content 
    |> parse_menu
  end

  defp parse_menu(content) do
    content
    |> Enum.map(fn(line) -> Enum.reject(line, &(&1 == "")) end)
    |> Enum.reduce(%{ menu: [], current_category: "" }, &process_item/2)
    |> reverse_menu
  end

  defp get_csv_content(file_name) do
    file_name
    |> File.stream!
    |> Stream.drop(1)
    |> CSV.decode!
    |> Enum.to_list
  end

  defp reverse_menu(%{ menu: menu }) do
    Enum.reverse(menu)
  end

  defp process_item(line, acc) do
    case length(line) do
      1 -> Map.put(acc, :current_category, List.to_string(line))
      4 -> Map.put(acc, :menu, add_item(acc, List.insert_at(line, 5, "1 порция")))
      _ -> Map.put(acc, :menu, add_item(acc, line))
    end
  end

  defp add_item(%{ menu: menu, current_category: category }, [ id, category_id, title, cost, quantity ]) do
    [ %{
      id: String.to_integer(id),
      category_id: category_id,
      title: title,
      cost: String.to_float(cost),
      quantity: quantity
      } | menu ]
  end

end
