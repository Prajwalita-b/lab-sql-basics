use bank;
select client_id from client where district_id = 1 limit 5; -- Q1
select client_id from client where district_id = 72 order by client_id desc limit 1; -- Q2
select amount from loan order by amount asc limit 3; -- Q3
select distinct status from loan order by status asc; -- Q4
select loan_id, payments from loan order by payments asc limit 1; -- Q5
select account_id, amount from loan order by account_id asc limit 5; -- Q6
select account_id from loan where duration = 60 order by amount asc limit 5; -- Q7
select distinct k_symbol from `order` order by k_symbol asc; -- Q8
select order_id from `order` where account_id = 34; -- Q9
select distinct account_id from `order`where order_id between 29540 and 29560; -- Q10
select amount from `order` where account_to = 30067122; -- Q11
select trans_id, date, type, amount from trans where account_id = 793 order by date desc limit 10; -- Q12
select district_id, count(client_id) from client where district_id < 10 group by district_id order by district_id asc; -- Q13
select type, count(card_id) from card group by type order by count(card_id) desc; -- Q14
select account_id, sum(amount) from loan group by account_id order by sum(amount) desc limit 10; -- Q15
select date, count(loan_id) from loan where date<930907 group by date order by date desc; -- Q16
select date, duration, count(loan_id) from loan where date_format(convert(date, date), '%Y-%M') = '1997-December' group by date, duration order by date asc; -- Q17
select account_id, type, sum(amount) as total_amount from trans where account_id = 396 group by type; -- Q18
select account_id, 
case
when type = 'PRIJEM' then 'INCOMING'
when type = 'VYDAJ' then 'OUTGOING'
end as 'transaction_type'
, floor(sum(amount))
from trans
where account_id = 396 group by type; -- Q19

select account_id, 
sum(case
when type = 'PRIJEM' then floor(amount)
end) as "INCOMING", 
sum(case
when type = 'VYDAJ' then floor(amount)
end) as "OUTGOING",
sum(case
when type = 'PRIJEM' then floor(amount) end) - 
sum(case
when type = 'VYDAJ' then floor(amount) end) as DIFFERENCE
from trans
where account_id = 396 group by account_id; -- Q20

select account_id, 
sum(case
when type = 'PRIJEM' then floor(amount) end) - 
sum(case
when type = 'VYDAJ' then floor(amount) end) as DIFFERENCE
from trans
group by account_id order by DIFFERENCE desc limit 10; -- Q21


