use Mix.Config

config :ex_behavior_example,
    ExBehaviorExample,
    writer: ConsoleWriter

import_config "#{Mix.env()}.exs"
