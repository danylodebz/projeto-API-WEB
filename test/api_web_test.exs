defmodule ApiWebTest do
  use ExUnit.Case
  doctest ApiWeb

  test "greets the world" do
    assert ApiWeb.hello() == :world
  end
end
