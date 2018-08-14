defmodule Writer do
    @callback write(String.t) :: {:ok, term} | {:error, term}
end