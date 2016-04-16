require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host:     ENV['DATABASE_HOST'],
  database: ENV['DATABASE_NAME'],
  username: ENV['DATABASE_USER'],
  password: ENV['DATABASE_PASSWORD']
)
