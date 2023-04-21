defmodule FinalProject.Repo.Migrations.CreateHumanresources do
  use Ecto.Migration

  def change do
    create table(:humanresources) do
      add :firstname, :string
      add :lastname, :string
      add :employeeid, :integer
      add :doh, :date
      add :department, :string

      timestamps()
    end
  end
end
