class House < ActiveRecord::Base
  validates :address, :presence => true

  belongs_to :people, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
  }

end
