create view revenue0 (supplier_no, total_revenue) as
	select
		l_suppkey,
		sum(l_extendedprice * (1 - l_discount))
	from
		lineitem
	where
	 to_date(l_shipdate,'yyyy-mm-dd') >= date '1996-01-01'
		and to_date(l_shipdate,'yyyy-mm-dd') < date '1996-01-01' + interval '3' month
	group by
		l_suppkey