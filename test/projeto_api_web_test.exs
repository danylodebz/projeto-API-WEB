defmodule ProjetoApiWebTest do
  use ExUnit.Case
  doctest ProjetoApiWeb

  test "greets the world" do
    assert ProjetoApiWeb.hello() == :world
  end
end
