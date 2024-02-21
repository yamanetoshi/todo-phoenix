defmodule TodoPhoenix.TasksTest do
  use TodoPhoenix.DataCase

  alias TodoPhoenix.Tasks

  describe "tasks" do
    alias TodoPhoenix.Tasks.Task

    import TodoPhoenix.TasksFixtures

    @invalid_attrs %{state: nil, content: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{state: 0, content: "some content"}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.state == :new
      assert task.content == "some content"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{state: :doing, content: "some updated content"}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.state == :doing
      assert task.content == "some updated content"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
