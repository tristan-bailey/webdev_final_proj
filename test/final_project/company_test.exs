defmodule FinalProject.CompanyTest do
  use FinalProject.DataCase

  alias FinalProject.Company

  describe "humanresources" do
    alias FinalProject.Company.HumanResource

    import FinalProject.CompanyFixtures

    @invalid_attrs %{department: nil, doh: nil, employeeid: nil, firstname: nil, lastname: nil}

    test "list_humanresources/0 returns all humanresources" do
      human_resource = human_resource_fixture()
      assert Company.list_humanresources() == [human_resource]
    end

    test "get_human_resource!/1 returns the human_resource with given id" do
      human_resource = human_resource_fixture()
      assert Company.get_human_resource!(human_resource.id) == human_resource
    end

    test "create_human_resource/1 with valid data creates a human_resource" do
      valid_attrs = %{department: "some department", doh: ~D[2023-04-20], employeeid: 42, firstname: "some firstname", lastname: "some lastname"}

      assert {:ok, %HumanResource{} = human_resource} = Company.create_human_resource(valid_attrs)
      assert human_resource.department == "some department"
      assert human_resource.doh == ~D[2023-04-20]
      assert human_resource.employeeid == 42
      assert human_resource.firstname == "some firstname"
      assert human_resource.lastname == "some lastname"
    end

    test "create_human_resource/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_human_resource(@invalid_attrs)
    end

    test "update_human_resource/2 with valid data updates the human_resource" do
      human_resource = human_resource_fixture()
      update_attrs = %{department: "some updated department", doh: ~D[2023-04-21], employeeid: 43, firstname: "some updated firstname", lastname: "some updated lastname"}

      assert {:ok, %HumanResource{} = human_resource} = Company.update_human_resource(human_resource, update_attrs)
      assert human_resource.department == "some updated department"
      assert human_resource.doh == ~D[2023-04-21]
      assert human_resource.employeeid == 43
      assert human_resource.firstname == "some updated firstname"
      assert human_resource.lastname == "some updated lastname"
    end

    test "update_human_resource/2 with invalid data returns error changeset" do
      human_resource = human_resource_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_human_resource(human_resource, @invalid_attrs)
      assert human_resource == Company.get_human_resource!(human_resource.id)
    end

    test "delete_human_resource/1 deletes the human_resource" do
      human_resource = human_resource_fixture()
      assert {:ok, %HumanResource{}} = Company.delete_human_resource(human_resource)
      assert_raise Ecto.NoResultsError, fn -> Company.get_human_resource!(human_resource.id) end
    end

    test "change_human_resource/1 returns a human_resource changeset" do
      human_resource = human_resource_fixture()
      assert %Ecto.Changeset{} = Company.change_human_resource(human_resource)
    end
  end
end
