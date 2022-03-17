/*All copies of the owner with id=1*/
SELECT *
FROM copies
WHERE owner_id=1

/*All copies that have already been loaned more than once*/
SELECT copies.id, count(*) AS total_loans
FROM copies
JOIN loans
ON copies.id = loans.copy_id
GROUP BY copies.id
HAVING count(*) > 1

/*All copies that have been loaned for more than a week*/
SELECT DISTINCT copies.id
FROM copies
JOIN loans
ON copies.id = loans.copy_id
WHERE (end_date - start_date) > 7

/* All albums that do not have a copy that has already been loaned */
SELECT albums.id
FROM albums
WHERE id NOT IN (
	SELECT Al.id
	FROM albums AS Al
	JOIN copies AS Co
	ON Al.id = Co.album_id
	JOIN loans AS L
	ON Co.id = L.copy_id
);