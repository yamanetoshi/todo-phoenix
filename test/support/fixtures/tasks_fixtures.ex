defmodule TodoPhoenix.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoPhoenix.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        content: "some content",
        state: :new
      })
      |> TodoPhoenix.Tasks.create_task()

    task
  end
end
