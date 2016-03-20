require_relative 'database.rb'

class Account < ActiveRecord::Base
  validates :password, presence: true

  self.table_name = 'Accounts'
  self.primary_key = 'username'
end