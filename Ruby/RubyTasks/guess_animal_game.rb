=begin
  * Угадай ЖиВоТнОе
=end

$KCODE = "u"
require 'yaml'

def yes? (input)
    %w[да ага угу дамс ес yes дааа точно угумс верно Да Ага Угу Дамс Ес Даа Точно Угумс Верно lf].include?(input.downcase)
end

def no? (input)
    %w[не нет неа неее no нед ne Не Нет Неа Нее Нед ytn yt].include?(input.downcase)
end

def initialize_db default_data, file_name = 'default_db.yaml'
  begin
    return_data = YAML::load( File.open( "#{File.dirname(__FILE__)}\\#{file_name}") )
  rescue
    return_data = default_data
    save_db default_data, file_name
  end
  return_data
end

def save_db data, file_name = 'default_db.yaml'
    File.open("#{File.dirname(__FILE__)}\\#{file_name}", 'w') do |f|
	f.print data.to_yaml
    end
end

class Animals
	def initialize
	    @@animals_db = initialize_db({'котик' => ['Есть пушыстые ушки', 'Есть пушыстый хвостик', 'Мяукает'], 'муха' => ['Летает', 'Жужжыт'], 'собака' => ['Гавкает', 'Лает'], 'страус' => ['Прячет голову в песок'], 'кролик' => ['Есть пушыстые ушки', 'Есть два длинных передних зуба']}, 'animals_db.yaml')
	end

	def guess_animals
		new_animal, animal_kind = {'угадал' => false, 'ответы' => []}, ""
		@@animals_db.keys.sort_by { rand }.each do |animal|
			next if new_animal['ответы'].include?(animal)
				@@animals_db[animal].sort_by { rand }.each do |kind|
					next if  (new_animal['ответы'].include?(kind) || new_animal['ответы'].include?(animal))
						puts "> #{kind}? "
						gets().chop!
						if yes? $_ or no? $_
							(new_animal.merge!(animal => kind); animal_kind = kind) if yes? $_
							new_animal['ответы'] << kind
							break
						else
							puts "Ничо, не понял шо ты ответил, продолжим... "
						end
				end

			if ((new_animal.any?) && new_animal.has_key?(animal))
        @@animals_db.keys.each do |maybe_animal|
            next if (!@@animals_db[maybe_animal].include?(animal_kind) || new_animal['ответы'].include?(maybe_animal))
            puts ">> Это #{maybe_animal}? "
            break if (new_animal['угадал'] = yes? gets.chop!)
            new_animal['ответы'] << maybe_animal
        end
				break if new_animal['угадал']
			end

	end
		if new_animal['угадал']
			puts " Ура! Я угадал :)  "
		else
			puts " Чорт :( я сдаюсь!  Какое животное ты загадал? "
			new_user_animal = gets.chop!
			new_animal.delete('ответы')
			new_animal.delete('угадал')
			puts " Какими еще особенностями #{ "кроме \"#{new_animal.values_at(*new_animal.keys).join(", ")}\"" unless new_animal.empty? } это животное обладает? (перечисли через запятую):  "
			@@animals_db.merge!(new_user_animal => (gets.chop.split(",") + new_animal.values_at(*new_animal.keys))) { |key, v1, v2| v1 + v2}
			save_db @@animals_db, 'animals_db.yaml'
		end
	end
end

# Tests
animal = Animals.new
puts 'Загадай жЫвотное, а я попробую отгадать его.'

begin
	animal.guess_animals
	puts ' Повторим?'
end while (yes? gets.chop)

puts 'Пока, приятно было поиграть :)'

