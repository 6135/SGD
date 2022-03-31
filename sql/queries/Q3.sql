select
	l_orderkey,
	sum(l_extendedprice * (1 - l_discount)) as revenue,
	o_orderdate,
	o_shippriority
from
	customer,
	orders,
	lineitem
where
	c_mktsegment = 'AUTOMOBILE'
	and c_custkey = o_custkey
	and l_orderkey = o_orderkey
	and to_date(o_orderdate,'yyyy-mm-dd') < date '1995-03-13'
	and to_date(l_shipdate,'yyyy-mm-dd') > date '1995-03-13'
group by
	l_orderkey,
	o_orderdate,
	o_shippriority
order by
	revenue desc,
	o_orderdate
FETCH NEXT 10 ROWS ONLY