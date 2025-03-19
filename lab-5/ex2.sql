use cinemadb;
select c.name as cinema_name, h.hall_number, s.screening_time from Screenings s
join Halls h on s.hall_id = h.hall_id
join Cinemas c on h.cinema_id = c.cinema_id
join Movies m on s.movie_id = m.movie_id
where m.title = 'Final Destination 7' and h.status in ('VIP', 'Deluxe')
order by c.name asc, h.hall_number asc;