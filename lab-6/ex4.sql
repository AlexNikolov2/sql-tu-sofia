select table_name
from referential_constraints
where constraint_schema = "database_name&#39" and
referenced_table_name = "parent_table" and
delete_rule = "CASCADE"