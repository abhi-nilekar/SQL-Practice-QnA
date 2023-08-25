select 
    m.name 
from employee as e 
inner join employee as m on e.managerId = m.id 
group by e.managerId 
having count(e.id) >=5