class ConverterController < ApplicationController
  def index
    value = params[:value].to_f
    unit = params[:unit]
    if value.negative?
      converter_index_path
    else
      case unit
      when "Kilograms"
        converted_value = value * 2.20462 # convert kg to lbs
        converted_unit = "lbs"
      when "Meters"
        converted_value = value * 3.28084 # convert m to ft
        converted_unit = "ft"
      when "Pounds"
        converted_value = value * 0.45359237 # convert lbs to kg
        converted_unit = "kg"
      when "Feet"
        converted_value = value * 0.3048 # convert ft to m
        converted_unit = "m"
      else
        converted_value = value
        converted_unit = ""
      end

      @result = "#{value} #{unit} is equal to #{converted_value} #{converted_unit}."
    end
  end
end
