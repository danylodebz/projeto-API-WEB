defmodule ApiWeb do
  def main(args) do
    IO.inspect args
    HTTPoison.get("https://jsonplaceholder.typicode.com/posts")
    |> processa_resposta
    |> mostra_resultado
  end

  defp processa_resposta({:ok, %HTTPoison.Response{status_code: 200, body: b}}) do
    {:ok, b}
  end

  defp processa_resposta({:error, r}) do
    {:error, r}
  end

  defp processa_resposta({:ok, %HTTPoison.Response{status_code: _, body: b}}) do
    {:error, b}
  end

  defp mostra_resultado({:error, _}) do
    IO.puts("Ocorreu um erro")
  end

  defp mostra_resultado({:ok, json}) do
    {:ok, posts} = Poison.decode(json)
    mostra_posts(posts)
  end

  defp mostra_posts([]), do: nil

  defp mostra_posts([i | resto]) do
    title = i["title"]
    body = i["body"]
    id = i["id"]
    IO.puts("#{title} | #{body} | #{id}")
    mostra_posts(resto)
  end
end
