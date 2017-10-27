# PhoneList

## API

**`add_entry(name, phone_number)`**

Adds an entry to the phone book

**`remove_entry(%{phone_number: phone_number})`**

Removes an entry from the phone book, by phone number

**`remove_entry(%{name: name})`**

Removes an entry from the phone book, by name

**`search(term)`**

Searches the phone book by the provided search term. Term may match in name or phone number.