defmodule Weightlifting.PlansFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Weightlifting.Plans` context.
  """

  @doc """
  Generate a unique exercise name.
  """
  def unique_exercise_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a exercise.
  """
  def exercise_fixture(attrs \\ %{}) do
    {:ok, exercise} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: unique_exercise_name()
      })
      |> Weightlifting.Plans.create_exercise()

    exercise
  end
end
