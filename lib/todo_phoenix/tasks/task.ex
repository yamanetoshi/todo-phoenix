defmodule TodoPhoenix.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :state, Ecto.Enum, values: [new: 0, doing: 1, done: 2], default: :new
    field :content, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:content, :state])
    |> validate_required([:content, :state])
  end
end
