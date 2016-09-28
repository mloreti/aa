class Person < ActiveRecord::Base
  validates :name, :presence => true
  validates :house_id, :presence => true

  has_many :houses, {
    primary_key: :house_id,
    foreign_key: :id,
    class_name: 'House'
  }
end
