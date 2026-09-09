Project customer_service {
  database_type: 'PostgreSQL'
  Note: 'Owns customer identity, contact info, and delivery addresses.'
}

Table customers {
  id uuid [pk, default: `gen_random_uuid()`]
  full_name varchar(150) [not null]
  email varchar(255) [unique, not null]
  phone varchar(20) [unique]
  password_hash varchar(255)
  loyalty_points int [default: 0]
  created_at timestamp [default: `now()`]
  updated_at timestamp [default: `now()`]
}

Table addresses {
  id uuid [pk, default: `gen_random_uuid()`]
  customer_id uuid [ref: > customers.id, not null]
  label varchar(50) [note: '"Home", "Work"']
  line1 varchar(255) [not null]
  line2 varchar(255)
  city varchar(100) [not null]
  state varchar(100)
  postal_code varchar(20)
  country varchar(2) [default: 'US']
  latitude decimal(9,6)
  longitude decimal(9,6)
  is_default boolean [default: false]
  created_at timestamp [default: `now()`]

  indexes {
    customer_id
  }
}