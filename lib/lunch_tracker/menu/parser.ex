defmodule LunchTracker.Menu.Parser do
	alias LunchTracker.Menu.{Dish,MenuOption}
	alias LunchTracker.Menu	

	def load_day_menu(csv) do
		
	end

	def parse(path) do
		path |> print_menu
	end

	defp print_menu(path) do 
    path
    |> get_csv_content 
    |> parse_menu
  end

  defp parse_menu(content) do
    parse_menu(content, [])
  end

  defp parse_menu([line | tail], acc) do
    parse_menu(tail, [ Enum.drop_every(line, 2) | acc ])
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
end
