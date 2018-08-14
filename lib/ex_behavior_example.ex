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
    config = Application.get_env(:ex_behavior_example, __MODULE__, [])
    writer = config[:writer] || @default_writer
    writer.write(message)
  end
end
