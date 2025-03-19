select SUM(s.tickets_sold) as total_viewers from Screenings s
join Halls h on s.hall_id = h.hall_id
join Cinemas c on h.cinema_id = c.cinema_id
join Movies m on s.movie_id = m.movie_id
where m.title = 'Final Destination 7' and h.status = 'VIP' and c.name = 'Arena Mladost';