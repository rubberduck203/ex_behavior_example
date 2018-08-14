use Mix.Config

config :ex_behavior_example,
    writer: ConsoleWriter

import_config "#{Mix.env()}.exs"
