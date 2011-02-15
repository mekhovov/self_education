=begin
  * Игра в города и страны
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
class String
    @@UPPER_RU = ('А'..'Я').to_a
    @@LOWER_RU = ('а'..'п').to_a + ('р'..'я').to_a
    def	downcase_ru!
      self.downcase!
      self.gsub!(/[А-Я]/) { |match| match = @@LOWER_RU[@@UPPER_RU.index(match)]}
      self
    end
    def	downcase_ru
	self.dup.downcase_ru!
    end
    def	upcase_ru!
	self.upcase!
	self.gsub!(/[а-я]/) { |match| match = @@UPPER_RU[@@LOWER_RU.index(match)]}
	self
    end
    def	upcase_ru
	self.dup.upcase_ru!
    end
    def	capitalize_ru!
	self.downcase_ru!
	self.gsub!(/^[а-яa-z]?/) { |match| match = (@@UPPER_RU+('A'..'Z').to_a)[(@@LOWER_RU+('a'..'z').to_a).index(match)]}
	self
    end
    def	capitalize_ru
	self.dup.capitalize_ru!
    end
    def	swapcase_ru!
	self.gsub!(/[а-яa-zА-ЯA-Z]/) { |match| i = (@@LOWER_RU+('a'..'z').to_a).index(match); i == nil ? match = (@@LOWER_RU+('a'..'z').to_a)[(@@UPPER_RU+('A'..'Z').to_a).index(match)] : (@@UPPER_RU+('A'..'Z').to_a)[i]}
	self
    end
    def	swapcase_ru
	self.dup.swapcase_ru!
    end
    def	first_ru
	first_letter = ""
	self.gsub!(/^[а-яa-zА-ЯA-Z]/) { |match| first_letter << match}
	first_letter
    end
    def	last_ru(exclude_chars = false)
	symbols = exclude_chars ? "а-щэ-яa-zА-ЩЭ-ЯA-Z" : "а-яa-zА-ЯA-Z"
	last_letter = ""
	self.gsub!(/[#{symbols}]/) { |match| last_letter = match }
	last_letter
    end
end


class CityGame
  def initialize
    begin
        @@CityGame_db = initialize_db({'города' => ['Днепропетровск', 'Киев', 'Воронеж'], 'страны' => ['Украина', 'Африка', 'Америка', 'Россия', 'Афганистан'], 'имена' => ['Александр', 'Роман', 'Нина']}, 'city_game_db.yaml')
        @@score = [0, 0]	# my your
    end
  end
   def get_themes
       @@CityGame_db.keys
   end
	def start_game(game_subject)
	    bloser = false
	    my_answer, your_answer = "", ""
	    answers, letters = [], []

	    unless (@@CityGame_db.has_key? game_subject)
        puts '> Давай ты начинай.'

	bloser = true
	your_answer = gets.chop!.capitalize_ru!
	if your_answer == 'Сдаюсь'
	    @@score[0] += 1
	    game_subject = nil
	else
	    @@CityGame_db [game_subject] = [your_answer]
	    @@score[1] += 1
	end


	    else

        @@CityGame_db[game_subject] = @@CityGame_db[game_subject].sort_by { rand }

        if rand(2) == 0	    # randomizing who start game
          puts '> Давай ты начинай.'
		    else
          puts '> Чур я первый!'
          my_answer = @@CityGame_db[game_subject].shift
          answers << my_answer
          puts ">> #{my_answer}"
        end

        @@CityGame_db[game_subject].each { |item| letters << item.first_ru }

        while !bloser

          begin	# check your answer
            brepeat = false
		        your_answer = gets.chop!.capitalize_ru!

            if your_answer == 'Сдаюсь'

		bloser = true
		@@score[0] += 1
		break
		else if answers.include?(your_answer)
		    brepeat = true
		    puts '> Уже было!'
		    else if (!answers.empty?) && (answers.last.last_ru(true) != your_answer.first_ru.downcase_ru)
			answers.unshift your_answer
			brepeat = true
			puts "> Не верно! Слово должно начинться на \"#{answers.last.last_ru(true)}\""
		    end
		end
	    end

	end while brepeat

	unless bloser

          answers << your_answer
          i = @@CityGame_db[game_subject].index(your_answer)
          unless i == nil
            @@CityGame_db[game_subject].delete_at(i)
            letters.delete_at(i)
          end

          i = letters.index(answers.last.last_ru(true).upcase_ru)

          if i == nil
            bloser = true
	    @@score[1] += 1
          else
            my_answer = @@CityGame_db[game_subject][i]
            answers << my_answer
            @@CityGame_db[game_subject].delete_at(i)
            letters.delete_at(i)

            puts ">> #{my_answer}"

          end

		    end

      end



    end

	 if your_answer == 'Сдаюсь'
	    puts '> Урррааа, ты проиграл! Да, да, да, я мозГ :)'
	 else if bloser
          puts '> От чорт, я проиграл :('
	      end
	 end

      puts "Счет: #{@@score[0]} : #{@@score[1]}  #{['ничья','я выигрываю :)','ты выигрываешь :('][@@score[0] <=> @@score[1]] }."
      unless game_subject
	@@CityGame_db.merge!(game_subject => answers) { |key, v1, v2| v1 + v2}
	save_db @@CityGame_db, 'city_game_db.yaml'
      end
    end
end



## Tests
game = CityGame.new
puts "Давай поиграем в города и страны. Напиши слово \"Сдаюсь\" если проиграл."
puts "Я когда-то играл в: #{game.get_themes.join(", ")}"

begin
    puts '> На какую тему будем играть?'
    game.start_game gets.chop.downcase_ru!
    puts '> Повторим?'
end while (yes? gets.chop)

puts 'Пока, приятно было поиграть :)'


