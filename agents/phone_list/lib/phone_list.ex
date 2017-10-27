defmodule PhoneList do
  use Agent
  @moduledoc """
  Documentation for PhoneList.
  """

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  def add_entry(phone_book, name, phone) do
    case Agent.update(phone_book, &Map.put(&1, name, phone)) do
      :ok -> {:ok, %{name: name, phone: phone}}
      _ -> {:error, "Error updating"}
    end
  end

  def search(phone_book, search_term) do
    case Agent.get(phone_book, &Map.get(&1, search_term)) do
      nil -> {:error, "Search term invalid: #{search_term}"}
      phone -> {:ok, %{name: search_term, phone: phone}}
    end
  end
end
