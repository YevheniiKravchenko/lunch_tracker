# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LunchTracker.Repo.insert!(%LunchTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

LunchTracker.Repo.insert!(%LunchTracker.Accounts.User{ email: "yevhenii.kravchenko@gmail.com", password_hash: "$2b$12$xNEhQrIo/M.BG9.M6DW27OsalR286Bs1u7HRqoahPwpGzPxbn/pre" })