defmodule FinalProjectWeb.HumanResourceController do
  use FinalProjectWeb, :controller

  alias FinalProject.Company
  alias FinalProject.Company.HumanResource

  def index(conn, _params) do
    humanresources = Company.list_humanresources()
    render(conn, :index, humanresources: humanresources)
  end

  def new(conn, _params) do
    changeset = Company.change_human_resource(%HumanResource{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"human_resource" => human_resource_params}) do
    case Company.create_human_resource(human_resource_params) do
      {:ok, human_resource} ->
        conn
        |> put_flash(:info, "Human resource created successfully.")
        |> redirect(to: ~p"/humanresources/#{human_resource}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    human_resource = Company.get_human_resource!(id)
    render(conn, :show, human_resource: human_resource)
  end

  def edit(conn, %{"id" => id}) do
    human_resource = Company.get_human_resource!(id)
    changeset = Company.change_human_resource(human_resource)
    render(conn, :edit, human_resource: human_resource, changeset: changeset)
  end

  def update(conn, %{"id" => id, "human_resource" => human_resource_params}) do
    human_resource = Company.get_human_resource!(id)

    case Company.update_human_resource(human_resource, human_resource_params) do
      {:ok, human_resource} ->
        conn
        |> put_flash(:info, "Human resource updated successfully.")
        |> redirect(to: ~p"/humanresources/#{human_resource}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, human_resource: human_resource, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    human_resource = Company.get_human_resource!(id)
    {:ok, _human_resource} = Company.delete_human_resource(human_resource)

    conn
    |> put_flash(:info, "Human resource deleted successfully.")
    |> redirect(to: ~p"/humanresources")
  end
end
