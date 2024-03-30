defmodule ProjetoApiWeb do
  @moduledoc """
  Documentation for `ProjetoApiWeb`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ProjetoApiWeb.hello()
      :world

  """
  def hello do
    :world
  end

  alias SpotifyAPI

  # Função para obter o token de acesso da API do Spotify
  def obter_token do
    client_id = "36005e971bca493880b85345cfff4276"
    client_secret = "c558d3ebc20f4624b84c059ae703232d"
    SpotifyAPI.obter_token(client_id, client_secret)
  end
end
