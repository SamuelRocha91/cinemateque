class Session < ApplicationRecord
  belongs_to :movie
  belongs_to :room

  enum :day_of_week, [
    :domingo, 
    :segunda, 
    :terca, 
    :quarta, 
    :quinta, 
    :sexta, 
    :sabado
  ] 
end
