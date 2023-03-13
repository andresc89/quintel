class ConverterController < ApplicationController
  def index
    input = params[:input]&.strip
    @output, @to_unit = if input.present?
      from, to = input.downcase.split(' in ')
      if from.present? && to.present?
        from_value, from_unit = from.split(/(?<=\d)(?=[a-z])/i)
        to_unit = to.strip.downcase
        case [from_unit, to_unit]
        when ['kg', 'lbs']
          [(from_value.to_f * 2.20462).round(2), 'lbs']
        when ['lbs', 'kg']
          [(from_value.to_f / 2.20462).round(2), 'kg']
        when ['m', 'ft']
          [(from_value.to_f * 3.28084).round(2), 'ft']
        when ['ft', 'm']
          [(from_value.to_f / 3.28084).round(2), 'm']
        else
          ['Invalid conversion units. Please type the units as following: "kg, lbs, m, ft."', nil]
        end
      else
        ['Invalid input format.', nil]
      end
    end
  end
end
