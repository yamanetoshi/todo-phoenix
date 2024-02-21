# TodoPhoenix

- clone this repository
- `docker compose build`
- `docker compose up`
- (in another terminal) `docker exec -it phx_docker_sample-app-1 bash`
- `mix phx.new . --app todo_phoenix --database mysql`
- fix config/dev.exs (unnecessary)
- `mix ecto.create`
- `mix ecto.migrate`
- `mix phx.server`
