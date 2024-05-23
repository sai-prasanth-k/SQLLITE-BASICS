SELECT
  *
FROM
  product
WHERE
  category = "Clothing"
  AND price < 700;

SELECT
  *
FROM
  product
WHERE
  brand = "Denim"
  AND rating > 4;

SELECT
  *
FROM
  product
WHERE
  price <= 1000
  AND rating > 4.0;

SELECT
  *
FROM
  product
WHERE
  price < 1000
  AND rating > 3.6
  AND brand = "Puma";


SELECT
  *
FROM
  product
WHERE
  brand = "Puma"
  OR brand = "Denim"
  OR brand = "Nike";

SELECT
  *
FROM
  product
WHERE
  brand = "Redmi"
  AND rating > 4
  OR brand = "OnePlus";


SELECT
  *
FROM
  product
WHERE
  name LIKE "%Cake%"
  AND (
    brand = "Cadbury"
    OR brand = "Britannia"
  )
  AND rating > 4.0;

SELECT
  *
FROM
  product
WHERE
  (
    brand = "Puma"
    AND rating > 3.5
  )
  OR (
    brand = "Denim"
    AND rating > 4.0
  );

SELECT * FROM product WHERE (brand = "Nike" OR brand = "Levi's" OR brand = "Puma") AND (name LIKE "%Shirt" AND name NOT LIKE "%Black%");

SELECT
  *
FROM
  product
WHERE
  brand NOT LIKE "Denim"
  AND (
    name LIKE "%Shirt"
    AND (name NOT LIKE "Black%")
  );
  