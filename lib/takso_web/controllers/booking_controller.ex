defmodule TaksoWeb.BookingController do
  use TaksoWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
    changeset = Takso.Bookings.Booking.changeset(%Takso.Bookings.Booking{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"booking" => booking_params}) do
    # booking creation
    conn
    |> put_flash(:info, "Your taxi will arrive in 5 minutes!")
    |> redirect(to: ~p"/bookings/new")
  end

end
