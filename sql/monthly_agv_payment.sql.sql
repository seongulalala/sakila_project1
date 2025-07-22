SELECT 
    p.customer_id,
    ROUND(SUM(p.amount) / COUNT(DISTINCT DATE_FORMAT(p.payment_date, '%Y-%m')), 2) AS avg_monthly_payment
FROM payment p
GROUP BY p.customer_id;
#> ttt.csv 파일로 저장됨