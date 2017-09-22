defmodule LunchTracker.Dishes.CategoryParser do
  def parse(path) do
    path
    |> get_csv_content 
    |> parse_categories
  end

  defp parse_categories(content) do
    content
    |> Enum.map(fn(line) -> Enum.reject(line, &(&1 == "")) end)
    |> Enum.map(&convert_item/1)
  end

  defp get_csv_content(file_name) do
    file_name
    |> File.stream!
    |> Stream.drop(1)
    |> CSV.decode!
    |> Enum.to_list
  end

  defp convert_item([ id, title ]) do
    %{
      id: id,
      title: title
    }
  end
end
