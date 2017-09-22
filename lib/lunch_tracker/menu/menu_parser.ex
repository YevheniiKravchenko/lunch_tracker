defmodule LunchTracker.Menu.MenuParser do
	alias LunchTracker.Menu.MenuOption
	alias LunchTracker.Menu	

  # returns list of tuples { menu_option, menu_option_number }
  def parse(path) do 
    path
    |> get_csv_content 
    |> parse_menu
    |> Enum.map(&format_menu_item/1)
    |> add_menu_option_numbers
  end

  defp parse_menu(content) do
    parse_menu(content, [])
  end

  defp parse_menu([current_item | tail], acc) do
    parse_menu(tail, [ Enum.drop_every(current_item, 2) | acc ])
  end

  defp parse_menu([], acc) do
    acc
    |> Enum.reverse
    |> List.zip
  end

  defp get_csv_content(file_name) do
    file_name
    |> File.stream!
    |> Stream.drop(4)
    |> CSV.decode!
    |> Enum.take(6)
  end

  defp parse_cost(string) do
    parse_result = string
    |> String.split([":"], trim: true) 
    |> Enum.fetch!(1) 
    |> String.trim 
    |> Float.parse

    case parse_result do
      {cost, _} -> cost
      :error -> throw("Error casting menu item cost")
    end
  end

  defp format_menu_item({ main, side1, side2, salad, cost, cost_without_main }) do 
    %{
      main: main,
      side1: side1,
      side2: side2,
      salad: salad,
      cost: parse_cost(cost),
      cost_without_main: parse_cost(cost_without_main),
      date: Date.utc_today
    }
  end

  defp add_menu_option_numbers(menu) do
    menu
    |> Enum.with_index(1)
    |> Enum.map(&add_menu_option/1)
  end

  defp add_menu_option({ option, number }) do
    Map.put(option, :option_number, number)
  end
end
