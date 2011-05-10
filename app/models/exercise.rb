class Exercise
  include Mongoid::Document

  field :rkid
  field :type
  field :date, :type => DateTime
  field :route
  field :distance
  field :duration
  field :avg_pace
  field :avg_speed
  field :burned
  field :climb
  field :avg_heart_rate
  field :notes

end
