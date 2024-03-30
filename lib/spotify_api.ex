defmodule SpotifyAPI do
  alias HTTPoison, as: HTTP

  def obter_token(client_id, client_secret) do
    body = %{grant_type: "client_credentials"}

    headers = [
      {"Authorization", "Basic #{Base.encode64("#{client_id}:#{client_secret}")}"},
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]

    case HTTPoison.post("https://accounts.spotify.com/api/token", {:form, body}, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        token = Jason.decode!(body)["access_token"]
        IO.puts("Token de acesso obtido com sucesso: #{token}")
        token

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Erro na obtenção do token de acesso: #{reason}")
        nil
    end
  end
end
