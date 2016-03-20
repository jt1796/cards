require_relative 'database.rb'

class Card < ActiveRecord::Base
  validates :stack, presence: true
  validates :body, presence: true
  validates :acceptance, presence: true
  validates :title, presence: true

  self.table_name = 'Cards'
  self.primary_key = 'username'
end
