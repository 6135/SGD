select
	o_orderpriority,
	count(*) as order_count
from
	orders
where
	to_date(o_orderdate,'yyyy-mm-dd') >= to_date('1993-07-01','yyyy-mm-dd')
	and to_date(o_orderdate,'yyyy-mm-dd') < to_date('1993-07-01','yyyy-mm-dd') + interval '3' month
	and exists (
		select
			*
		from
			lineitem
		where
			l_orderkey = o_orderkey
			and l_commitdate < l_receiptdate
	)
group by
	o_orderpriority
order by
	o_orderpriority