use Mix.Config

config :ex_behavior_example,
    ExBehaviorExample, #the module that uses the writer. Must be specified for every module that uses the writer.
    writer: ConsoleWriter

import_config "#{Mix.env()}.exs"
