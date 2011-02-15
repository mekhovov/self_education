package Java;

/** Task 5 (35 р)
 * To write a function
 *     int printMinQuantity (unsigned int input_value)
 * which takes integer input_value and prints on the screen the line of prime numbers divided with word spaces. 
 * The sum of these prime numbers is specified value input_value. 
 * The number of prime numbers must be minimal so that one can't select shorter series of prime numbers, 
 * which make in sum input_value. 
 * For example, 
 * for number 6 variants "5 1" and "3 3" are considered as correct, 
 * variants "3 2 1", "2 2 2", "1 1 1 1 1 1" are considered as incorrect and so on. 
 * You have to find not every correct variant, but only one of them. 
 * When writing a function pay attention to the algorithm efficiency 
 * and to the warranty of the fact that your algorithm finds the shortest of the possible series of prime numbers. 
 * 
 * Suggest a value variant, which is returned by function.
 *
 * Date: January, 2008
 * URL: http://www.isd.dp.ua/sample.html.en
 * 
 * @author Mekhovov Alexander
 */

class Task5_PrintMinQuantity {

static int minimumAmountOfSummand;   //Минимальное кол-во слагаемых
static String minimumalStringOfSummand = "";   //Строка, состоящая из слагаемых, разделенных пробелами
static java.util.ArrayList <Integer> primeNumbersArray = new java.util.ArrayList <Integer> ();   //Коллекция для хранения простых чисел (динамический массив)


	static void findMinQuantity(int limitInterval, int SummandCount, String summandString) {
		/**
		*Данная функция находит минимальное кол-во слагаемых из простых чисел.
		*@param limitInterval - число (остаток от аргумента)для которого предстоит определить сумму простых чисел на текущем витке рекурсии
		*@param SummandCount - кол-во слагаемых в текущей рассматриваемой последовательности
		*@param summandString - строка, состоящая из нашей текущей последовательности (включающая в себя уже найденные слагаемые, на текущий момент, разделенные пробелами)
		*@return отсутствует
		*/
		if ((SummandCount+1) < minimumAmountOfSummand) {  // Если текущее кол-во рассматриваемых слагаемых меньше кол-ва уже найденных - то  
			//Нахождение индекса простого числа в массиве, меньшего или равного limitInterval
			//Используем метод двоичного поиска в упорядоченном массиве
			int primeIndex=primeNumbersArray.size()-1;    //Индекс простого числа меньшего или равного limitInterval, ставим первоначально максимальный индекс
			int left=0;				//Левая граница, инициализируем значением индекса первого элемента
			int right=primeNumbersArray.size()-1;	//Правая граница, инициализируем значением индекса последнего элемента
			int medium=0;				//Используем для хранения индекса середины рассматриваемого интервала массива
			while (left<right) {			//Пока левая граница меньше правой
				medium=(left+right)/2;			//Вычисляем индекс элемента середины рассматриваемого диапозона массива
				if ((Integer)primeNumbersArray.get(medium) < limitInterval)		//Если рассматриваемый элемент меньше исходного
					left=medium+1;		//То  дальше ищем в правой стороне массива
				else
					right=medium;		//Иначе в левой
				}
			//Определяем индекс эл-та
			if ((Integer)primeNumbersArray.get(right) <= limitInterval)	//Если значение найденного эл-та меньше или равно искомому
				primeIndex=right;							//То его индекс равен right (т.е. индекс этого же эл-та)
			else
				primeIndex=right-1;							//Иначе right-1 (предидущий элемент)

                        //Поиск слагаемого
			for (int i=primeIndex; i>=0; i--)     //Начинаем перебор подходящего слагаемого начиная с границы рассматриваемой последовательности и до первого элемента 	
				if (limitInterval - (Integer)primeNumbersArray.get(i) == 0)  {  //если после вычета всех слагаемых из числа мы получим 0 (т.е. сумма всех слагаемых равна числу)то
					minimumAmountOfSummand = SummandCount+1;  //Найдено слагаемое, увеличиваем счетчик минимального кол-ва слагаемых	
					minimumalStringOfSummand = summandString + Integer.toString((Integer)primeNumbersArray.get(i)) + " ";   //заносим это слагаемое в результирующую строку
                }
                else
					findMinQuantity(limitInterval - (Integer)primeNumbersArray.get(i), SummandCount+1, summandString + Integer.toString((Integer)primeNumbersArray.get(i)) + " ");
                        //Рекурсивный вызов функции поиска слагаемых с такими парамаетрами:
                        //1й пар-р - число (остаток от аргумента)для которого предстоит определить сумму простых чисел на следующем витке рекурсии
                        //2й пар-р  - эл-тов в текущей последовательности становиться больше на 1
                        //3й пар-р - строка, состоящая из нашей текущей последовательности
        }
	}


	static void printMinQuantity(int input_value) {     //Основная функция
		/**
		*Данная функция является основной, в ее задачи входит нахождение простых чисел, вызов функции поиска слагаемых, и печать результата работы на экран
		*@param input_value - исходное число, для которого будем искать минимальное кол-во слагаемых, состоящих из простых чисел
		*@return отсутствует (как вариант возвращаемого значения можно предложить возврат результирующей строки, содержащей слагаемые, разделенные пробелом (minimumalStringOfSummand), или же массив, состоящий из элементов, являющихся минимальной последовательностью слагаемымых )
		*/
		//Нахождение всех простых чисел от 1 до input_value-1 и запись их в массив
        //Используем алгоритм "Решето Эратосфена"
        primeNumbersArray.add(new Integer(1));   //Заполняем массив первыми 3-мя, заранее известными, простыми числами
        primeNumbersArray.add(new Integer(2));
        primeNumbersArray.add(new Integer(3));
        int tempPrime=3;                    //Используется для промежуточного хранения предположительного простого числа. инициализируем со значением равным 3 (достоверно известное на данный момент простое число)
        int limitOfPrimesDivisor;                    //Используется для нахождения границы, до которой целесообразно перебирать делители. Доказано, что для проверки простого числа достатосно рассматривать делители до значения, равного квадратному корню из числа
        int primesIndex=0;                //Счетчик для перебора индексов элементов массива
        boolean prime=true;         //Флаг факта простоты числа
        do {
            tempPrime += 2;       //Исключаем из рассмотрения четные числа
            limitOfPrimesDivisor=(int) Math.round(Math.sqrt(tempPrime));      //Вычисляем граничное значение, до которого целесообразно перебирать делители
            primesIndex=1;        //Ставим счетчик перебора индексов на первый элемент массива
            while ((Integer)primeNumbersArray.get(primesIndex) <= limitOfPrimesDivisor) {         //Пока наш рассматриваемый делитеть (простое число из уже заполненного массива) меньше или равно значению граничного предела, до которого целесообразно перебирать делители
                prime=true;                                 //Предполагаем что число простое
                if (tempPrime % (Integer)primeNumbersArray.get(primesIndex) == 0) {  //Если остаток от деления предполагаемого простого числа на любой делитель из уже найденных простых чисел равен нулю, т.е. число поделилось нацело
                    prime = false;                       //То помечаем, что это число составное
                    break;                               //И прекращаем цикл перебора делителей для этого числа
                } else                                        //Иначе, если рассматриваемое предполагаемое простое число не поделилось нацело на делитель 
                    primesIndex++;                                //То увеличиваем счетчик индексов простых чисел массива, и проверяем следующий делитель 
                }
                if (prime & (tempPrime < input_value))                         //Если мы нашли простое число и оно меньше самого исходгого часла, то
                    primeNumbersArray.add(new Integer(tempPrime));                       //записываем его в массив
        } while (tempPrime < input_value);     //Выполняем цикл, пока предполагаемое рассматриваемое простое число меньше нашего исходного числа (для которого мы собственно и ищем слагаемые)

        minimumAmountOfSummand = input_value + 1;   //Присваиваем минимальному кол-ву слагаемых самое большое возможное
		Task5_PrintMinQuantity.findMinQuantity(input_value, 0, minimumalStringOfSummand);   //Вызываем функцию находжения минимального кол-ва слагаемых

		System.out.println("Sum (" + input_value + ") = " + minimumalStringOfSummand);    //Печатаем результат на экран
	}

	//Основная программа
	public static void main (String args[]) {
		int inputValue =  222706; //222705; //50013;	//Исходное число, для которого ищем слагаемые
                //for (inputValue = 222700; inputValue <= 222800; inputValue++)
                   printMinQuantity(inputValue);  //Вызов основной функции нахождения минимального кол-ва слагаемых
       	}
}

