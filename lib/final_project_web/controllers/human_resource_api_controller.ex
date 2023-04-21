defmodule FinalProjectWeb.HumanResourceAPIController do
  use FinalProjectWeb, :controller

  alias FinalProject.Company
  alias FinalProject.Company.HumanResource

  action_fallback FinalProjectWeb.FallbackController

  def index(conn, _params) do
    humanresources = Company.list_humanresources()
    render(conn, :index, humanresources: humanresources)
  end

  def show(conn, %{"id" => id}) do
    human_resource = Company.get_human_resource!(id)
    render(conn, :show, human_resource: human_resource)
  end
end
