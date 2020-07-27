defmodule FantaxTest do
  use ExUnit.Case
  doctest Fantax

  test "greets the world" do
    assert Fantax.hello() == :world
  end
end
