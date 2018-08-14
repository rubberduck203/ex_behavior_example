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

  def config_hello_better_error_message(message) do
    config = Application.get_all_env(:ex_behavior_example)
              |> Keyword.fetch(:writer)

    writer = case config do
      {:ok, writer} -> writer
      :error -> raise "No writer defined. config must define a :writer behavior."
    end

    writer.write(message)
  end

end
