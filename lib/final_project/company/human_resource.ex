defmodule FinalProject.Company.HumanResource do
  use Ecto.Schema
  import Ecto.Changeset

  schema "humanresources" do
    field :department, :string
    field :doh, :date
    field :employeeid, :integer
    field :firstname, :string
    field :lastname, :string

    timestamps()
  end

  @doc false
  def changeset(human_resource, attrs) do
    human_resource
    |> cast(attrs, [:firstname, :lastname, :employeeid, :doh, :department])
    |> validate_required([:firstname, :lastname, :employeeid, :doh, :department])
  end
end
