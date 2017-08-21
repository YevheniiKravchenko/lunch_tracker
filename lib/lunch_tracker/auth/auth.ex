defmodule LunchTracker.Auth do
  @moduledoc """
  The Auth context.
  """

  import Ecto.Query, warn: false
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias LunchTracker.Accounts


  def authenticate(%{email: email, password: password}) do
    user = Accounts.get_user_by_email(email)

    cond do
      user && checkpw(password, user.password_hash) -> {:ok, user}
      user -> :unauthorized
      true ->
        dummy_checkpw
        :unauthorized
    end
  end
end
