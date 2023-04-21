defmodule FinalProject.CompanyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FinalProject.Company` context.
  """

  @doc """
  Generate a human_resource.
  """
  def human_resource_fixture(attrs \\ %{}) do
    {:ok, human_resource} =
      attrs
      |> Enum.into(%{
        department: "some department",
        doh: ~D[2023-04-20],
        employeeid: 42,
        firstname: "some firstname",
        lastname: "some lastname"
      })
      |> FinalProject.Company.create_human_resource()

    human_resource
  end
end
