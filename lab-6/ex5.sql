select table_name from referential_constraints
where constraint_schema = "school_sport_clubs" and referenced_table_name = "coaches" and update_rule = "CASCADE"