defmodule FinalProject.Company do
  @moduledoc """
  The Company context.
  """

  import Ecto.Query, warn: false
  alias FinalProject.Repo

  alias FinalProject.Company.HumanResource

  @doc """
  Returns the list of humanresources.

  ## Examples

      iex> list_humanresources()
      [%HumanResource{}, ...]

  """
  def list_humanresources do
    Repo.all(HumanResource)
  end

  @doc """
  Gets a single human_resource.

  Raises `Ecto.NoResultsError` if the Human resource does not exist.

  ## Examples

      iex> get_human_resource!(123)
      %HumanResource{}

      iex> get_human_resource!(456)
      ** (Ecto.NoResultsError)

  """
  def get_human_resource!(id), do: Repo.get!(HumanResource, id)

  @doc """
  Creates a human_resource.

  ## Examples

      iex> create_human_resource(%{field: value})
      {:ok, %HumanResource{}}

      iex> create_human_resource(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_human_resource(attrs \\ %{}) do
    %HumanResource{}
    |> HumanResource.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a human_resource.

  ## Examples

      iex> update_human_resource(human_resource, %{field: new_value})
      {:ok, %HumanResource{}}

      iex> update_human_resource(human_resource, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_human_resource(%HumanResource{} = human_resource, attrs) do
    human_resource
    |> HumanResource.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a human_resource.

  ## Examples

      iex> delete_human_resource(human_resource)
      {:ok, %HumanResource{}}

      iex> delete_human_resource(human_resource)
      {:error, %Ecto.Changeset{}}

  """
  def delete_human_resource(%HumanResource{} = human_resource) do
    Repo.delete(human_resource)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking human_resource changes.

  ## Examples

      iex> change_human_resource(human_resource)
      %Ecto.Changeset{data: %HumanResource{}}

  """
  def change_human_resource(%HumanResource{} = human_resource, attrs \\ %{}) do
    HumanResource.changeset(human_resource, attrs)
  end
end
