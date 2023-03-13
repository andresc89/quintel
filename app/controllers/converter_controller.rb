class ConverterController < ApplicationController
  def index
    input = params[:input]&.strip # assigning the value from the params to "input" and using strip to remove spaces
    @output = if input.present? # creates the @output variable if the input has a value
      from, to = input.downcase.split(' in ') #splits the array in half to identify the ammount and units used ( "2 kg lbs" should be the result)
      if from.present? && to.present? # checks if both values are present and further splits the array to get the amount and original unit
        from_value, from_unit = from.split(' ')
        to_unit = to
        case [from_unit, to_unit] # here we start the logic, we have the units ready to be used, they are checked on the when clause, and we use float to calculate
        when ['kg', 'lbs']
          from_value.to_f * 2.20462
        when ['lbs', 'kg']
          from_value.to_f / 2.20462
        when ['m', 'ft']
          from_value.to_f * 3.28084
        when ['ft', 'm']
          from_value.to_f / 3.28084
        else
          'Invalid conversion units'
        end
      else
        'Invalid input format. please type the units as following: "kg, lbs, m, ft." '
      end
    end
  end
end
