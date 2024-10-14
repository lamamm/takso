defmodule Takso.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Takso.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        password: "some password",
        username: "some username"
      })
      |> Takso.Accounts.create_user()

    user
  end
end
