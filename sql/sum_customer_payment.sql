--고객별 결제 총액 > customer.csv로 저장됨
WITH payment_summary AS (
    SELECT customer_id, SUM(amount) AS total_payment
    FROM payment
    GROUP BY customer_id
)
SELECT 
    c.customer_id,
    MAX(r.rental_date) AS last_rental_date,
    COUNT(DISTINCT r.rental_id) AS total_rentals,
    ps.total_payment
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
LEFT JOIN payment_summary ps ON c.customer_id = ps.customer_id
GROUP BY c.customer_id
ORDER BY total_rentals DESC
LIMIT 10000;