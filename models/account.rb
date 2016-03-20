require_relative 'database.rb'

class Account < ActiveRecord::Base
  validates :password, presence: true

  validates :username, presence: true
  validates :stack, presence: true
  validates :body, presence: true
  validates :acceptance, presence: true
  title

  self.table_name = 'Cards'
  #self.primary_key = 'id'
end
