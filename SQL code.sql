--select * from vendors.jk_dev_temp
select DATENAME(MONTH, DATEADD(MONTH, month, -1 ) ) Month, Desktop, [Mobile Phone], Tablet, [Grand Total]	
from	
(	
  select month(day) month, [Sales $], [Device type], sum([Sales $]) over (partition by month(day)) [Grand Total]
  from vendors.jk_dev_temp	
) d	
pivot	
(	
  sum([Sales $])	
  for [Device type] in (Desktop, [Mobile Phone], Tablet)	
) piv
where Month <> 3;
