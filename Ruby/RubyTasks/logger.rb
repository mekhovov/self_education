=begin
  * Logger
=end

class NilClass
  def to_sLog
    return "NULL"
  end
end

class TrueClass
  def to_sLog
    return self.to_s.upcase
  end
end

class FalseClass
  def to_sLog
    return self.to_s.upcase
  end
end

class Numeric
  def to_sLog
    return self
  end
end

class String
  def to_sLog
    return "\"" + self + "\""
  end
end

class Symbol
  def to_sLog
    return ":#{self}"
  end
end

class Array
  def to_sLog
    return "[" + self.map { |item| item.respond_to?("to_sLog") ? item.to_sLog : item }.join(", ") +"]"
  end
end

class Hash
  def to_sLog
    return "{" + self.map { |item| "#{item[0].to_sLog}=>#{item[1].respond_to?("to_sLog") ? item[1].to_sLog : item[1]}" }.join(", ") +"}"
  end
end

class Range
  def to_sLog
    return self.map { |item| item.respond_to?("to_sLog") ? item.to_sLog : item }.join(", ")
  end
end

class Object
  def class_hierarchy
    self.class.ancestors - self.class.included_modules
  end

  def to_log(additional_info = true, desc =  nil)
    print   "\n------------------\n" +
            "#{"| Description: #{desc}\n" if desc != nil}" +
            "| value: #{self.respond_to?("to_sLog") ? self.to_sLog : self}\n" +
            "|   class hierarchy: #{self.class_hierarchy.join(" < ")}\n" +
            "|   object ID: #{self.object_id}\n" +
            "------------------\n"
  end
end

## Tests
666.to_log
"string \"test\"".to_log
true.to_log
nil.to_log
[1, 2, [10, 11, "sting one", ["one", "two"]], "string two", false, nil].to_log
{:keyStr=>"val1", :keyNum=>123, ["KeyArray", 666]=>true, :keyArr=>["str", 15, [false, [1, 2], 'string'], {:KEY1=>"one", "KEY2"=>"two"}]}.to_log
(1..5).to_log
("a"..."d").to_log
:symbol.to_log

