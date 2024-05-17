-- Get the item, price and there respective profit of command items in both tables
-- Inner Join

select Tb01.Item_name, price, Tb02.profit 
from Tb01
inner join Tb02 
on 
Tb01.Item_id=Tb02.Item_id

-- Get all the items irrespective of their matching items
-- Full Outer Join

select * from Tb01
full outer join Tb02 
on 
Tb01.Item_id = Tb02.Item_id
--where Tb01.Item_id is not null and Tb02.Item_id is not null

-- Get all Tb01 Values and their respective values in Tb02
-- Left Join

select * from Tb01
left join Tb02 on
Tb01.Item_id = Tb02.Item_id

-- Get all Tb02 Values and their respective values in Tb01
-- Right Join

select * from Tb01
right join Tb02 on
Tb01.Item_id = Tb02.Item_id

-- get the profit item Hoodie

select Tb01.Item_name,Tb02.Profit from Tb01
join Tb02 
on 
Tb01.Item_id = Tb02.Item_id
where Tb01.Item_name = 'Hoodie'

-- Get the total profit of items where profit is more than 2500

select Tb01.Item_name, ( Tb02.profit*Tb02.Sold_Items) Total_profit  from Tb01
join Tb02 
on 
Tb01.Item_id = Tb02.Item_id
where (Tb02.profit*Tb02.Sold_Items) > '2500'

-- Order the item's according to there profit of respective items in both tables

select Tb01.Item_name,Tb02.profit from Tb01
join Tb02 
on
Tb01.Item_id = Tb02.Item_id
order by Tb02.profit desc

-- Get the sum of available items and sold items

select Tb01.Item_name,(cast(left(Tb01.availability,2) as int) +Tb02.Sold_Items) 
as Total_items 
from Tb01
join Tb02 
on
Tb01.Item_id = Tb02.Item_id

-- Get the total profit of female items

select top 1 Tb01.gender,
(select sum(Tb02.Profit*Tb02.Sold_items)  from Tb02)Sum_Of_profit 
from Tb01
join Tb02 
on 
Tb01.Item_id = Tb02.Item_id
where Tb01.gender='Female' 

-- Get the profit percentage of respective items in both tables

select Tb01.Item_name,concat(round(((cast(Tb02.Profit as float)/cast(Tb01.price as float))*100 ),2) ,'%') as Profit_percent 
from Tb01
 join Tb02 on
Tb01.Item_id = Tb02.Item_id

