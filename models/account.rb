require_relative 'database.rb'

class Account < ActiveRecord::Base
  validates :password, presence: true
  validates :username, presence: true

  self.table_name = 'Accounts'
  #self.primary_key = 'id'
end
