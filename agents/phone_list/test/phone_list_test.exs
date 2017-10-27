defmodule PhoneListTest do
  use ExUnit.Case, async: true

  doctest PhoneList

  setup do
    {:ok, phone_book} = start_supervised(PhoneList)
    %{phone_book: phone_book}
  end

  test "add_entry adds to the phone book", %{phone_book: phone_book} do
    # assert phone list dot add entry, passing phone book
    assert(
      {:ok, %{name: "Zach", phone: "555-123-4567"}}
      ==
      PhoneList.add_entry(phone_book, "Zach", "555-123-4567")
    )
    # a name and a phone number, returns tuple {:ok, name, phone}
  end

  test "search looks up an entry in the phone book", %{phone_book: phone_book} do
    # add entry to phone book
    # assert that a search for entry returns the name and number
    PhoneList.add_entry(phone_book, "Pat", "555-765-4321")

    assert(
      {:ok, %{name: "Pat", phone: "555-765-4321"}}
      ==
      PhoneList.search(phone_book, "Pat")
    )
  end
end

# {:ok, name, phone}
# {:ok, %{name: name, phone: phone}}
# {:error, "this is bad"}

# mix in agent module to phone list
# make an agent
# pass pid to test cases