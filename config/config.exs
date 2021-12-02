use Mix.Config

config :advent_of_code, AdventOfCode.Input,
  allow_network?: true,
  session_cookie:
    "53616c7465645f5fd5118228751f75aaee169adce3885488458ae9f3a4d8b7f442aa24c385e8595d7dd6dfa51d44e6d6"

# If you don't like environment variables, put your cookie in
# a `config/secrets.exs` file like this:
#
# use Mix.Config
# config :advent_of_code, AdventOfCode.Input,
#   session_cookie: "..."

try do
  import_config "secrets.exs"
rescue
  _ -> :ok
end
