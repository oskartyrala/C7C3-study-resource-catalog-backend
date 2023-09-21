SELECT name FROM users WHERE id = 1;

SELECT r.*, ARRAY_AGG(t.tag) AS tags FROM resources r INNER JOIN tags t ON r.id = t.resource_id GROUP BY r.id;

SELECT r.*, ARRAY_AGG(t.tag) AS tags, u.name AS recommender_name FROM resources r INNER JOIN tags t ON r.id = t.resource_id INNER JOIN 
users u ON r.recommender_id = u.id  GROUP BY r.id, u.name ORDER BY r.date_added DESC;

select r.*, ARRAY_AGG(t.tag) as tags, u.name as recommender_name from resources r inner join tags t on r.id = t.resource_id inner join 
users u on r.recommender_id = u.id  where r.id in (81, 86, 72) group by r.id, u.name order by r.date_added desc;

select r.*, ARRAY_AGG(t.tag) as tags, u.name as recommender_name from resources r inner join tags t on r.id = t.resource_id inner join 
users u on r.recommender_id = u.id inner join  study_list s on r.id = s.resource_id  where s.user_id = 1 
group by r.id, u.name order by r.date_added desc;