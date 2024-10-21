defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller

  import Ecto.Query, only: [from: 2]

  alias Takso.Repo
  alias Takso.Sales.Taxi

  def new(conn, _params) do
    changeset = Takso.Bookings.Booking.changeset(%Takso.Bookings.Booking{})
    render(conn, "new.html", changeset: changeset)
  end

  # def create(conn, %{"booking" => booking_params}) do
  #   conn
  #   |> put_flash(:info, "Your taxi will arrive in 5 minutes!")
  #   |> redirect(to: ~p"/bookings/new")
  # end

  def create(conn, %{"booking" => booking_params}) do

    query = from t in Taxi, where: t.status == "available", select: t
    available_taxis = Repo.all(query)

    if length(available_taxis) > 0 do
      conn
      |> put_flash(:info, "Your taxi will arrive in 5 minutes!")
      |> redirect(to: ~p"/bookings/new")
    else
      conn
      |> put_flash(:error, "At present, there is no taxi available!")
      |> redirect(to: ~p"/bookings/new")
    end
  end

end
