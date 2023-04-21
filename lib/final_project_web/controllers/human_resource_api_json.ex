defmodule FinalProjectWeb.HumanResourceAPIJSON do
  alias FinalProject.Company.HumanResource

  @doc """
  Renders a list of humanresources.
  """
  def index(%{humanresources: humanresources}) do
    %{data: for(human_resource <- humanresources, do: data(human_resource))}
  end

  @doc """
  Renders a single human_resource.
  """
  def show(%{human_resource: human_resource}) do
    %{data: data(human_resource)}
  end

  defp data(%HumanResource{} = human_resource) do
    %{
      id: human_resource.id,
      firstname: human_resource.firstname,
      lastname: human_resource.lastname,
      employeeid: human_resource.employeeid,
      doh: human_resource.doh,
      department: human_resource.department
    }
  end
end
