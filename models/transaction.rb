require_relative 'database.rb'

class Account < ActiveRecord::Base
  validates :password, presence: true

  self.table_name = 'Transactions'
  self.primary_key = 'id'
end
