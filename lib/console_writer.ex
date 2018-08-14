defmodule ConsoleWriter do
    @behaviour Writer

    def write(message) do
        {IO.puts(message), message}
    end
end