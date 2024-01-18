# Creation of our database

Our database, named country_db, has 3 tables:
* Countries
* Cities
* Currencies

## Relationships between tables


**NOTE**: If a table A contains a FK (PK of B), that means that we want a one-to-one relationship **FROM** A to B: a record in A is associated to one and only one record in B.

* Countries and Cities

A county can have 1 city (min) or many cities (max).
A city can be associated with 1 country (min) and only 1 country (max).

Thus, between countries and cities tables, we have a one-to-many relationship (or cardinality) and city depends on country: cities table contains a FK referencing the countries table's id.

How to set this one-to-many cardinality? See below:

```
CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    field_1 ...,
    ...,
    field_n ...
);


CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    field_1 ...,
    ...,
    field_n ...,
    country_id INT,
    FOREIGN KEY country_id REFERENCES countries(country_id) -- one or many countries
);
```


* Countries and Currencies

A country can be associated with 1 currency (min) and only 1 currency (max).
A currency can be associated with 1 country (min) or many countries (max).

Thus, between countries and currencies tables, we have a one-to-many relationship (or cardinality), country depends on currency: country take the FK referencing the currencies table's id.

```
CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    field_1 ...,
    ...,
    field_n ...,
    currency_id INT,
    FOREIGN KEY currency_id REFERENCES currencies(currency_id) -- one or many currencies
);


CREATE TABLE currencies (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    field_1 ...,
    ...,
    field_n ...,
);
```