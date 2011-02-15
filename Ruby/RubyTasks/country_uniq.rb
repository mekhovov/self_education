=begin
  * Задание 6.
  * Реализовать uniq! для массивов стран.
=end

class Array
  def uniq!
    a=[]
    self.each_with_index {|item, index| a.include?((item[0..0] +  item[-1..-1]).downcase) ? self[index] = nil : a << ((item[0..0] +  item[-1..-1]).downcase)}.compact!
  end
end

# Tests
a = %w[Amerika angliya China korea africa]
puts "Original a   : #{a.inspect}"
puts "a.uniq!       : #{a.uniq!.inspect}"
puts "a after uniq! : #{a.inspect}"

