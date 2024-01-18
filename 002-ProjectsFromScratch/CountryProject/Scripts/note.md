# Creation of our database

Our database, named country_db, has 3 tables:
* Countries
* Cities
* Currencies

## Relationships between tables

* Countries and Cities

A county can have 1 city (min) or many cities (max).
A city can be associated with 1 country (min) and only 1 country (max).

Thus, between countries and cities table, we have a one-to-many relationship (or cardinality).
In this context, cities is the child table (because it will contain a FK that link it to countries).

How to set this one-to-many cardinality? See below:
- Countries get info about individual countries without any duplicate.
- Cities refers to country_id in order to be able to link many cities has possible to a given country

CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    field_1 ...,
    ...,
    field_n ...
);

CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    **country_id** INT,
    field_1 ...,
    ...,
    field_n ...,
    **FOREIGN KEY country_id REFERENCES countries(country_id)**
);

