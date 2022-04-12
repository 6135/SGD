select
	sum(l_extendedprice * l_discount) as revenue
from
	lineitem
where
	to_date(l_shipdate,'yyyy-mm-dd') >= to_date('1994-01-01','yyyy-mm-dd')
	and to_date(l_shipdate,'yyyy-mm-dd') < to_date('1994-01-01','yyyy-mm-dd') + interval '1' year
	and l_discount between .06 - 0.01 and .06 + 0.01
	and l_quantity < 24