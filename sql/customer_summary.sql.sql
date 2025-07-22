SELECT 
    c.customer_id,
    MAX(r.rental_date) AS last_rental_date,
    COUNT(r.rental_id) AS total_rentals,
    SUM(p.amount) AS total_payment
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
LEFT JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;
