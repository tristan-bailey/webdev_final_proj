defmodule FinalProjectWeb.HumanResourceAPIControllerTest do
  use FinalProjectWeb.ConnCase

  import FinalProject.CompanyFixtures

  alias FinalProject.Company.HumanResourceAPI

  @create_attrs %{
    department: "some department",
    doh: ~D[2023-04-20],
    employeeid: 42,
    firstname: "some firstname",
    lastname: "some lastname"
  }
  @update_attrs %{
    department: "some updated department",
    doh: ~D[2023-04-21],
    employeeid: 43,
    firstname: "some updated firstname",
    lastname: "some updated lastname"
  }
  @invalid_attrs %{department: nil, doh: nil, employeeid: nil, firstname: nil, lastname: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all humanresources", %{conn: conn} do
      conn = get(conn, ~p"/api/humanresources")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create human_resource_api" do
    test "renders human_resource_api when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/humanresources", human_resource_api: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/humanresources/#{id}")

      assert %{
               "id" => ^id,
               "department" => "some department",
               "doh" => "2023-04-20",
               "employeeid" => 42,
               "firstname" => "some firstname",
               "lastname" => "some lastname"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/humanresources", human_resource_api: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update human_resource_api" do
    setup [:create_human_resource_api]

    test "renders human_resource_api when data is valid", %{conn: conn, human_resource_api: %HumanResourceAPI{id: id} = human_resource_api} do
      conn = put(conn, ~p"/api/humanresources/#{human_resource_api}", human_resource_api: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/humanresources/#{id}")

      assert %{
               "id" => ^id,
               "department" => "some updated department",
               "doh" => "2023-04-21",
               "employeeid" => 43,
               "firstname" => "some updated firstname",
               "lastname" => "some updated lastname"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, human_resource_api: human_resource_api} do
      conn = put(conn, ~p"/api/humanresources/#{human_resource_api}", human_resource_api: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete human_resource_api" do
    setup [:create_human_resource_api]

    test "deletes chosen human_resource_api", %{conn: conn, human_resource_api: human_resource_api} do
      conn = delete(conn, ~p"/api/humanresources/#{human_resource_api}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/humanresources/#{human_resource_api}")
      end
    end
  end

  defp create_human_resource_api(_) do
    human_resource_api = human_resource_api_fixture()
    %{human_resource_api: human_resource_api}
  end
end
