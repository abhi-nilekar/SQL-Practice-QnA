--approach 1
SELECT i1.item_count AS mode
FROM items_per_order AS i1
INNER JOIN (
  SELECT MAX(order_occurrences) AS max_occurrences
  FROM items_per_order
) i2 ON i1.order_occurrences = i2.max_occurrences
ORDER BY i1.item_count
