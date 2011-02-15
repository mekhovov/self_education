package Java;

/** Task 2 (15 р)
 * To write a function
 *     char* superSort (char*)
 * which takes a line of words divided with word spaces. Each word can consist of Roman letters of lower case and figures. 
 * The returned result must be a line of got words sorted in alphabetical order and divided with word spaces. 
 * During sorting when comparing words, figures must be ignored as if there were no figures at all. 
 * For example, for input line 
 *     ma79ma 9n8e7 mila r1a2m3u
 * the result of function work has to be 
 *     ma79ma mila 9n8e7 r1a2m3u
 *
 * Date: January, 2008
 * URL: http://www.isd.dp.ua/sample.html.en
 *
 * @author Mekhovov Alexander
 */


class Task2_SuperSort {

	static String superSort(String originalString) {
		/**
		*Данная функция принимает строку слов, разделенных пробелами.
		*И производит сортировку слов по возрастанию, при этом игнорируя цифры, встречающиеся в словах.
		*@param originalString - исходная строка (строка, состоящая из латинских букв в нижнем регистре и цифр)
		*@return resultString - результирующая строка, с отсортированными словами
		*/
		String stringArray[];	//Массив строк (используется для преобразования строки слов в массив слов, для проведения сортировки)
		String resultString = ""; //Результирующая отсортированная строка

		//Подсчет кол-ва слов в строке посредством подсчета кол-ва пробелов, причем, некоторое кол-во пробелов подряд игнорируется
		int wordsCount=1;	//Инициализация переменной, содержащей ко-во слов в строке (слов всегда на один больше чем пробелов, т.к. последнее слово не заканчивается пробелом)
		for(int i=0; i < originalString.length(); i++)
			if (originalString.regionMatches(i," ",0,1) & !originalString.regionMatches(i+1," ",0,1)) 		//Если текущий рассматриваемый символ пробел, и следующий за ним не пробел, то увеличиваем счетчик слов. Дополнительное условие сделано для того, чтобы исключить влияние нескольких подряд идущих пробелов на счетчик кол-ва слов
				wordsCount++;
	
		stringArray = new String[wordsCount];		//создаем массив слов размером равным кол-ву слов (кол-во пробелов + 1)

		//Преобразование строки слов в массив слов
		int wordNumber=0; //Номер слова в массиве
		int startingWordPosition=0; //Номер позиции в строке, с которого будет начинаться копируемое в массив слово 
		for(int i=0; i < originalString.length(); i++)
			if (originalString.regionMatches(i," ",0,1) & !originalString.regionMatches(i+1," ",0,1) ) {	//Если текущий рассматриваемый символ пробел, и следующий за ним не пробел, то выделяем из строки слово, и заносим его в массив слов	
				stringArray[wordNumber] = originalString.substring(startingWordPosition,i);
				wordNumber++;
				startingWordPosition=i+1;
			}
		stringArray[wordNumber] = originalString.substring(startingWordPosition,originalString.length()); //Дописываем последнее слово из строки (не заканчивающееся пробелом)  в массив строк
		//Сортрируем массив слов методом "пузырька"
		//Метод "пузырька" был выбран из соображений его компактных размеров в виде кода, а также дабы не перегружать лисинг программы более длинными и тяжело читаемыми алгоритмами. При необходимости, или приоритетности скорости отработки программы метод сортировки можно заменить, предположим на "Хоара" или "Шелла"
		for(int j=0; j < stringArray.length; j++) {
			for(int i=j+1; i < stringArray.length; i++){
				//записываем сравниваемые слова во временные переменные, в которых будем удалять цифры при ставнении
				String stringWithoutDigits1 = stringArray[i];
				String stringWithoutDigits2 = stringArray[j];
				//Удаление цифр из сравниваемых строк
				for(int digit=0; digit < 10; digit++) {
					stringWithoutDigits1 = stringWithoutDigits1.replace(Integer.toString(digit),"");
					stringWithoutDigits2 = stringWithoutDigits2.replace(Integer.toString(digit),"");
				}
				if(stringWithoutDigits1.compareTo(stringWithoutDigits2) < 0) {		//Проверяем строки (в которых уже исключены цифры) на равенство
					String tmp = stringArray[j];		//Меняем местами строки (большую с меньшей)
					stringArray[j] = stringArray[i];
					stringArray[i] = tmp;
				}
			}
		}
		for(int i=0; i < stringArray.length; i++) 		//Создаем результирующую выходную строку путем извлечения слов из массива
			resultString = resultString + stringArray[i] + " ";

		return resultString;
	}

	//Основная программа
	public static void main (String args[]) {
		String inputString = "ma79ma 9n8e7 mila r1a2m3u ";	//Исходная строка слов
		String outputString = ""; //Результирующая отсортированная строка
		outputString = Task2_SuperSort.superSort(inputString);	//Вызов функции superSort, сортирующей строку слов
		System.out.println(outputString); //  Вывод отсортированной строки
	}
}
