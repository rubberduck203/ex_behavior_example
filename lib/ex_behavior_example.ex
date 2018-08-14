defmodule ExBehaviorExample do
  @moduledoc """
  Demonstrates different ways to inject Behavior implementations into code.
  """

  @default_writer ConsoleWriter

  @doc """
  Uses argument injection to specify the writer.

  ## Examples

      iex(1)> ExBehaviorExample.hello("Hello")
      Hello
      {:ok, "Hello"}

      iex(2)> ExBehaviorExample.hello("Hello", writer: FileWriter)
      I'm not really a file, but here's your message: Hello
      {:ok, "Hello"}
      
  """
  def hello(message, opts \\ []) do
    # case Keyword.fetch(opts, :writer) do
    #   {:ok, writer} -> writer
    #   {:error, _} -> @default_writer
    # end
    # might be more appropriate than pop
    {writer, opts} = Keyword.pop(opts, :writer, @default_writer)
    writer.write(message)
  end

  @doc """
  Uses Mix config to specify the implementation.

  ## Examples

      ExBehaviorExample.config_hello("Yolo!")

  """
  def config_hello(message) do
    writer = Application.get_all_env(:ex_behavior_example)
              |> Keyword.fetch!(:writer)

    writer.write(message)
  end
end
