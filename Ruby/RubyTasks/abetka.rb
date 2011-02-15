=begin
  * Букварик
  * Из гласных и согласных букв, составить слог.
  * Правила формирования слога:
  *   согласная + гласная
  *   гласная + согласная
  *   согласная + гласная + согласная
  *   гласная + согласная + гласная
  * Вывести тест из 20-ти солучайных слогов
=end

$KCODE = "u"

def abetka
  glasnie = %w[а е и о у ы э ю я]
  letters = [glasnie, ('а'..'п').to_a + ('р'..'я').to_a - glasnie]
  slog = [[0, 1], [1, 0], [1, 0, 1], [0, 1, 0]]   # "1" means soglasnaya

  proc = Proc.new{|a| a[rand(a.size)]}
  proc.call(slog).each {|item| print proc.call(letters[item])}
end

# Tests
puts "\n--- Абетка -------"
20.times {abetka; print " "}
puts "\n------------------"

