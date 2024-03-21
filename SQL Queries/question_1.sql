-- How many staff are there in all of the UK stores?
SELECT sum(staff_numbers) FROM dim_store
WHERE country_code = 'GB'
