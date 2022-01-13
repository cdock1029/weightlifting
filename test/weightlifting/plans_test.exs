defmodule Weightlifting.PlansTest do
  use Weightlifting.DataCase

  alias Weightlifting.Plans

  describe "exercises" do
    alias Weightlifting.Plans.Exercise

    import Weightlifting.PlansFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_exercises/0 returns all exercises" do
      exercise = exercise_fixture()
      assert Plans.list_exercises() == [exercise]
    end

    test "get_exercise!/1 returns the exercise with given id" do
      exercise = exercise_fixture()
      assert Plans.get_exercise!(exercise.id) == exercise
    end

    test "create_exercise/1 with valid data creates a exercise" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Exercise{} = exercise} = Plans.create_exercise(valid_attrs)
      assert exercise.description == "some description"
      assert exercise.name == "some name"
    end

    test "create_exercise/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plans.create_exercise(@invalid_attrs)
    end

    test "update_exercise/2 with valid data updates the exercise" do
      exercise = exercise_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Exercise{} = exercise} = Plans.update_exercise(exercise, update_attrs)
      assert exercise.description == "some updated description"
      assert exercise.name == "some updated name"
    end

    test "update_exercise/2 with invalid data returns error changeset" do
      exercise = exercise_fixture()
      assert {:error, %Ecto.Changeset{}} = Plans.update_exercise(exercise, @invalid_attrs)
      assert exercise == Plans.get_exercise!(exercise.id)
    end

    test "delete_exercise/1 deletes the exercise" do
      exercise = exercise_fixture()
      assert {:ok, %Exercise{}} = Plans.delete_exercise(exercise)
      assert_raise Ecto.NoResultsError, fn -> Plans.get_exercise!(exercise.id) end
    end

    test "change_exercise/1 returns a exercise changeset" do
      exercise = exercise_fixture()
      assert %Ecto.Changeset{} = Plans.change_exercise(exercise)
    end
  end
end
