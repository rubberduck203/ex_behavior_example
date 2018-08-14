defmodule FileWriter do
    @behaviour Writer

    def write(message) do
        {IO.puts("I'm not really a file, but here's your message: #{message}"), message}
    end
end