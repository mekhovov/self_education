=begin
  * Autocomplete Code
=end

$KCODE = "u"

class Object
  def method_missing(meth)
    methods = self.methods.find_all{|element| element =~ /^#{meth}/i}.sort
    print "> Methods for \"#{self}.#{meth}\"\n" + (methods.empty? ? ">> No methods found !\n" : " - "  + methods.join("\n - ") + "\n")
  end
end

# Tests
3.To
3.ggg