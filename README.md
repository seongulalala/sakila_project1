# 🎬 Sakila Project - DVD Rental → Subscription OTT 전략

---

## ✅ 1. 프로젝트 개요
**목표:**  
기존 DVD 대여 모델을 **구독형 OTT 모델**로 전환하여,  
안정적 매출 확보 및 레트로 트렌드를 활용한 신규 고객 확보 전략을 제시합니다.

**배경:**  
- 2025년 다시 돌아온 **뉴트로 열풍**  
- Sakila는 약 **600명의 기존 고객**과 **독점 레트로 영화 1,000편**을 보유  
- OTT 시장에서 차별화된 **레트로 특화 서비스** 제공 가능  

---

## ✅ 2. 가정 (Assumptions)
1. Sakila 고객 데이터는 실제 서비스 전환 시 반영 가능한 고객군을 대표한다고 가정.
2. 신규 고객 타겟은 **레트로 콘텐츠에 관심 있는 Z세대**로 설정.
3. VIP 등급 고객은 구독 모델 전환 가능성이 높고, 높은 LTV를 기대할 수 있다고 가정.

---

## ✅ 3. 분석 목표
- **기존 고객 세분화**: VIP 예상 고객, 이탈 가능 고객 분류  
- **구독 가격 전략**: 고객 지불 의향 분석 기반 구독 요금제 설계  
- **취향 기반 추천 가능성 검토**: 카테고리·배우·키워드 분석  

---

## ✅ 4. 분석 대상
- **기존 고객:** Sakila DB 기반 약 **600명**
- **신규 고객:** 레트로 콘텐츠 선호 Z세대  

---

## ✅ 5. 분석 기법
- **RFM 분석** → 고객 충성도 측정 (Recency, Frequency, Monetary)  
- **K-Means 군집분석** → 고객 세그먼트 분류 (VIP vs 이탈 예상)  
- **키워드 분석** → 영화 설명(description) 기반 콘텐츠 특성 파악  
- **Python 라이브러리:** Pandas, Matplotlib, scikit-learn  
- **MySQL:** 데이터 추출, 집계, 전처리  

---

## ✅ 6. 프로젝트 구조
sakila_project/
├── README.md
├── requirements.txt
├── presentation/
│ ├── Sakila Never Die_1팀.pdf
│ └── sakila_presentation.pptx
├── sql/
│ ├── customer_summary.sql
│ ├── monthly_agv_payment.sql
│ └── sum_customer_payment.sql
├── src/
│ └── sakila_project.ipynb
├── video/
│ └── Sakila.mp4

---

## ✅ 7. 데이터 (Sakila DB)
- 다운로드: [Sakila Sample DB](https://dev.mysql.com/doc/index-other.html)
- 설치:
```sql
SOURCE /path/to/sakila-schema.sql;
SOURCE /path/to/sakila-data.sql;
```

## ✅ 8. SQL 실행 예시  
고객별 대여 횟수 & 총 결제액:  
```
WITH payment_summary AS (
    SELECT customer_id, SUM(amount) AS total_payment
    FROM payment
    GROUP BY customer_id
)
SELECT 
    c.customer_id,
    COUNT(r.rental_id) AS total_rentals,
    ps.total_payment,
    MAX(r.rental_date) AS last_rental_date
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
LEFT JOIN payment_summary ps ON c.customer_id = ps.customer_id
GROUP BY c.customer_id;
```

## ✅ 9. Python 분석 실행  
```가상환경 준비:  
pip install -r requirements.txt
```
## ✅ 10. 주요 분석 결과  
VIP 예상 고객군 → 평균 대여 횟수 31회, 결제액 134달러 → 프리미엄 요금제 대상

이탈 예상 고객군 → 평균 대여 횟수 23회, 결제액 96달러 → 저가 요금제 유도

구독 요금제 제안

레트로 요금제 (VIP): $12.99

뉴트로 요금제 (일반): $4.99

## ✅ 11. KPI  
구독 유지율 (3개월 이상)

VIP 전환율

무료 체험 전환율

MRR (월 반복 매출)

## ✅ 12. 작성자
Name: 이성우 , 김경현 , 김민석 , 권나라 , 송연준

GitHub: (https://github.com/seongulalala/)