# Creation of our database

Our database, named country_db, has 3 tables:
* Countries
* Cities
* Currencies

## Relationships between tables

* Countries and Cities

A county can have 1 city (min) or many cities (max).
A city can be associated with 1 country (min) and only 1 country (max).

Thus, between countries and cities table, we have a one-to-many relationship.
