class ScoreSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attributes :id, :position, :car_number, :car_colour, :driver_name, :last_lap

  def last_lap
    number_with_precision(@object.last_lap, precision: 3)
  end
end
