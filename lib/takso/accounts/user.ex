defmodule Takso.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string
    field :age, :integer
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :password, :age])
    |> validate_required([:name, :username, :password, :age])
    |> age_validation()
  end

  defp age_validation(changeset) do
    age = get_field(changeset, :age)
    if age >0 do
      changeset
    else
      add_error(changeset, :age, "Age must be a positive number")
    end

  end
end
