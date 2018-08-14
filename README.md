# ExBehaviorExample

Example of using Elixir Behaviors as described by Darian Moody.
https://www.djm.org.uk/posts/writing-extensible-elixir-with-behaviours-adapters-pluggable-backends/


```bash
iex -S mix
iex()> ExBehaviorExample.hello("Hello") #default behavior
iex()> ExBehaviorExample.hello("Hello", writer: FileWriter) #specify impl as arg

# config/dev.exs
iex()> ExBehaviorExample.config_hello("Yolo!")

# config/prod.exs
MIX_ENV=prod iex -S mix
ExBehaviorExample.config_hello("Yolo!")
```