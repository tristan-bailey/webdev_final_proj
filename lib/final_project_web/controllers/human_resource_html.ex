defmodule FinalProjectWeb.HumanResourceHTML do
  use FinalProjectWeb, :html

  embed_templates "human_resource_html/*"

  @doc """
  Renders a human_resource form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def human_resource_form(assigns)
end
