class Answer < Struct.new(:value)
  def to_s
    value.to_s
  end

  def correct_with?(input)
    p1 = patterns_for(to_s)
    p2 = patterns_for(input.to_s)
    !(p1 & p2).empty?
  end

  private

  def patterns_for(str)
    list = [
      to_integer_or_float(str),
      str
    ].compact

    list.map! do |item|
      case item
      when Integer
        item.humanize
      when Float
        %i(digits number).map { |d| item.humanize(decimals_as: d) }
      when String
        item
      end
    end

    list.flatten
  end

  def to_integer_or_float(str)
    Integer(str)
  rescue ArgumentError
    begin
      Float(str)
    rescue ArgumentError
      nil
    end
  end
end
