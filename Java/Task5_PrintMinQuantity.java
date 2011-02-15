package Java;

/** Task 5 (35 �)
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

static int minimumAmountOfSummand;   //����������� ���-�� ���������
static String minimumalStringOfSummand = "";   //������, ��������� �� ���������, ����������� ���������
static java.util.ArrayList <Integer> primeNumbersArray = new java.util.ArrayList <Integer> ();   //��������� ��� �������� ������� ����� (������������ ������)


	static void findMinQuantity(int limitInterval, int SummandCount, String summandString) {
		/**
		*������ ������� ������� ����������� ���-�� ��������� �� ������� �����.
		*@param limitInterval - ����� (������� �� ���������)��� �������� ��������� ���������� ����� ������� ����� �� ������� ����� ��������
		*@param SummandCount - ���-�� ��������� � ������� ��������������� ������������������
		*@param summandString - ������, ��������� �� ����� ������� ������������������ (���������� � ���� ��� ��������� ���������, �� ������� ������, ����������� ���������)
		*@return �����������
		*/
		if ((SummandCount+1) < minimumAmountOfSummand) {  // ���� ������� ���-�� ��������������� ��������� ������ ���-�� ��� ��������� - ��  
			//���������� ������� �������� ����� � �������, �������� ��� ������� limitInterval
			//���������� ����� ��������� ������ � ������������� �������
			int primeIndex=primeNumbersArray.size()-1;    //������ �������� ����� �������� ��� ������� limitInterval, ������ ������������� ������������ ������
			int left=0;				//����� �������, �������������� ��������� ������� ������� ��������
			int right=primeNumbersArray.size()-1;	//������ �������, �������������� ��������� ������� ���������� ��������
			int medium=0;				//���������� ��� �������� ������� �������� ���������������� ��������� �������
			while (left<right) {			//���� ����� ������� ������ ������
				medium=(left+right)/2;			//��������� ������ �������� �������� ���������������� ��������� �������
				if ((Integer)primeNumbersArray.get(medium) < limitInterval)		//���� ��������������� ������� ������ ���������
					left=medium+1;		//��  ������ ���� � ������ ������� �������
				else
					right=medium;		//����� � �����
				}
			//���������� ������ ��-��
			if ((Integer)primeNumbersArray.get(right) <= limitInterval)	//���� �������� ���������� ��-�� ������ ��� ����� ��������
				primeIndex=right;							//�� ��� ������ ����� right (�.�. ������ ����� �� ��-��)
			else
				primeIndex=right-1;							//����� right-1 (���������� �������)

                        //����� ����������
			for (int i=primeIndex; i>=0; i--)     //�������� ������� ����������� ���������� ������� � ������� ��������������� ������������������ � �� ������� �������� 	
				if (limitInterval - (Integer)primeNumbersArray.get(i) == 0)  {  //���� ����� ������ ���� ��������� �� ����� �� ������� 0 (�.�. ����� ���� ��������� ����� �����)��
					minimumAmountOfSummand = SummandCount+1;  //������� ���������, ����������� ������� ������������ ���-�� ���������	
					minimumalStringOfSummand = summandString + Integer.toString((Integer)primeNumbersArray.get(i)) + " ";   //������� ��� ��������� � �������������� ������
                }
                else
					findMinQuantity(limitInterval - (Integer)primeNumbersArray.get(i), SummandCount+1, summandString + Integer.toString((Integer)primeNumbersArray.get(i)) + " ");
                        //����������� ����� ������� ������ ��������� � ������ ������������:
                        //1� ���-� - ����� (������� �� ���������)��� �������� ��������� ���������� ����� ������� ����� �� ��������� ����� ��������
                        //2� ���-�  - ��-��� � ������� ������������������ ����������� ������ �� 1
                        //3� ���-� - ������, ��������� �� ����� ������� ������������������
        }
	}


	static void printMinQuantity(int input_value) {     //�������� �������
		/**
		*������ ������� �������� ��������, � �� ������ ������ ���������� ������� �����, ����� ������� ������ ���������, � ������ ���������� ������ �� �����
		*@param input_value - �������� �����, ��� �������� ����� ������ ����������� ���-�� ���������, ��������� �� ������� �����
		*@return ����������� (��� ������� ������������� �������� ����� ���������� ������� �������������� ������, ���������� ���������, ����������� �������� (minimumalStringOfSummand), ��� �� ������, ��������� �� ���������, ���������� ����������� ������������������� ����������� )
		*/
		//���������� ���� ������� ����� �� 1 �� input_value-1 � ������ �� � ������
        //���������� �������� "������ ����������"
        primeNumbersArray.add(new Integer(1));   //��������� ������ ������� 3-��, ������� ����������, �������� �������
        primeNumbersArray.add(new Integer(2));
        primeNumbersArray.add(new Integer(3));
        int tempPrime=3;                    //������������ ��� �������������� �������� ������������������ �������� �����. �������������� �� ��������� ������ 3 (���������� ��������� �� ������ ������ ������� �����)
        int limitOfPrimesDivisor;                    //������������ ��� ���������� �������, �� ������� ������������� ���������� ��������. ��������, ��� ��� �������� �������� ����� ���������� ������������� �������� �� ��������, ������� ����������� ����� �� �����
        int primesIndex=0;                //������� ��� �������� �������� ��������� �������
        boolean prime=true;         //���� ����� �������� �����
        do {
            tempPrime += 2;       //��������� �� ������������ ������ �����
            limitOfPrimesDivisor=(int) Math.round(Math.sqrt(tempPrime));      //��������� ��������� ��������, �� �������� ������������� ���������� ��������
            primesIndex=1;        //������ ������� �������� �������� �� ������ ������� �������
            while ((Integer)primeNumbersArray.get(primesIndex) <= limitOfPrimesDivisor) {         //���� ��� ��������������� �������� (������� ����� �� ��� ������������ �������) ������ ��� ����� �������� ���������� �������, �� �������� ������������� ���������� ��������
                prime=true;                                 //������������ ��� ����� �������
                if (tempPrime % (Integer)primeNumbersArray.get(primesIndex) == 0) {  //���� ������� �� ������� ��������������� �������� ����� �� ����� �������� �� ��� ��������� ������� ����� ����� ����, �.�. ����� ���������� ������
                    prime = false;                       //�� ��������, ��� ��� ����� ���������
                    break;                               //� ���������� ���� �������� ��������� ��� ����� �����
                } else                                        //�����, ���� ��������������� �������������� ������� ����� �� ���������� ������ �� �������� 
                    primesIndex++;                                //�� ����������� ������� �������� ������� ����� �������, � ��������� ��������� �������� 
                }
                if (prime & (tempPrime < input_value))                         //���� �� ����� ������� ����� � ��� ������ ������ ��������� �����, ��
                    primeNumbersArray.add(new Integer(tempPrime));                       //���������� ��� � ������
        } while (tempPrime < input_value);     //��������� ����, ���� �������������� ��������������� ������� ����� ������ ������ ��������� ����� (��� �������� �� ���������� � ���� ���������)

        minimumAmountOfSummand = input_value + 1;   //����������� ������������ ���-�� ��������� ����� ������� ���������
		Task5_PrintMinQuantity.findMinQuantity(input_value, 0, minimumalStringOfSummand);   //�������� ������� ���������� ������������ ���-�� ���������

		System.out.println("Sum (" + input_value + ") = " + minimumalStringOfSummand);    //�������� ��������� �� �����
	}

	//�������� ���������
	public static void main (String args[]) {
		int inputValue =  222706; //222705; //50013;	//�������� �����, ��� �������� ���� ���������
                //for (inputValue = 222700; inputValue <= 222800; inputValue++)
                   printMinQuantity(inputValue);  //����� �������� ������� ���������� ������������ ���-�� ���������
       	}
}

