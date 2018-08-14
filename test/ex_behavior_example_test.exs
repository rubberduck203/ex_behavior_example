defmodule ExBehaviorExampleTest do
  use ExUnit.Case
  doctest ExBehaviorExample

  test "greets the world" do
    assert ExBehaviorExample.hello() == :world
  end
end
