defmodule Takso.Bookings.Booking do
  use Ecto.Schema
  schema "" do
    field :pickup_address, :string
    field :dropoff_address, :string
  end
  def changeset(struct, params \\ %{}) do
    Ecto.Changeset.cast(struct, params, [:pickup_address, :dropoff_address])
  end
end
