defmodule FinalProjectWeb.HumanResourceControllerTest do
  use FinalProjectWeb.ConnCase

  import FinalProject.CompanyFixtures

  @create_attrs %{department: "some department", doh: ~D[2023-04-20], employeeid: 42, firstname: "some firstname", lastname: "some lastname"}
  @update_attrs %{department: "some updated department", doh: ~D[2023-04-21], employeeid: 43, firstname: "some updated firstname", lastname: "some updated lastname"}
  @invalid_attrs %{department: nil, doh: nil, employeeid: nil, firstname: nil, lastname: nil}

  describe "index" do
    test "lists all humanresources", %{conn: conn} do
      conn = get(conn, ~p"/humanresources")
      assert html_response(conn, 200) =~ "Listing Humanresources"
    end
  end

  describe "new human_resource" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/humanresources/new")
      assert html_response(conn, 200) =~ "New Human resource"
    end
  end

  describe "create human_resource" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/humanresources", human_resource: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/humanresources/#{id}"

      conn = get(conn, ~p"/humanresources/#{id}")
      assert html_response(conn, 200) =~ "Human resource #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/humanresources", human_resource: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Human resource"
    end
  end

  describe "edit human_resource" do
    setup [:create_human_resource]

    test "renders form for editing chosen human_resource", %{conn: conn, human_resource: human_resource} do
      conn = get(conn, ~p"/humanresources/#{human_resource}/edit")
      assert html_response(conn, 200) =~ "Edit Human resource"
    end
  end

  describe "update human_resource" do
    setup [:create_human_resource]

    test "redirects when data is valid", %{conn: conn, human_resource: human_resource} do
      conn = put(conn, ~p"/humanresources/#{human_resource}", human_resource: @update_attrs)
      assert redirected_to(conn) == ~p"/humanresources/#{human_resource}"

      conn = get(conn, ~p"/humanresources/#{human_resource}")
      assert html_response(conn, 200) =~ "some updated department"
    end

    test "renders errors when data is invalid", %{conn: conn, human_resource: human_resource} do
      conn = put(conn, ~p"/humanresources/#{human_resource}", human_resource: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Human resource"
    end
  end

  describe "delete human_resource" do
    setup [:create_human_resource]

    test "deletes chosen human_resource", %{conn: conn, human_resource: human_resource} do
      conn = delete(conn, ~p"/humanresources/#{human_resource}")
      assert redirected_to(conn) == ~p"/humanresources"

      assert_error_sent 404, fn ->
        get(conn, ~p"/humanresources/#{human_resource}")
      end
    end
  end

  defp create_human_resource(_) do
    human_resource = human_resource_fixture()
    %{human_resource: human_resource}
  end
end
