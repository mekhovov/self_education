package Java;

/** Task 2 (15 �)
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
		*������ ������� ��������� ������ ����, ����������� ���������.
		*� ���������� ���������� ���� �� �����������, ��� ���� ��������� �����, ������������� � ������.
		*@param originalString - �������� ������ (������, ��������� �� ��������� ���� � ������ �������� � ����)
		*@return resultString - �������������� ������, � ���������������� �������
		*/
		String stringArray[];	//������ ����� (������������ ��� �������������� ������ ���� � ������ ����, ��� ���������� ����������)
		String resultString = ""; //�������������� ��������������� ������

		//������� ���-�� ���� � ������ ����������� �������� ���-�� ��������, ������, ��������� ���-�� �������� ������ ������������
		int wordsCount=1;	//������������� ����������, ���������� ��-�� ���� � ������ (���� ������ �� ���� ������ ��� ��������, �.�. ��������� ����� �� ������������� ��������)
		for(int i=0; i < originalString.length(); i++)
			if (originalString.regionMatches(i," ",0,1) & !originalString.regionMatches(i+1," ",0,1)) 		//���� ������� ��������������� ������ ������, � ��������� �� ��� �� ������, �� ����������� ������� ����. �������������� ������� ������� ��� ����, ����� ��������� ������� ���������� ������ ������ �������� �� ������� ���-�� ����
				wordsCount++;
	
		stringArray = new String[wordsCount];		//������� ������ ���� �������� ������ ���-�� ���� (���-�� �������� + 1)

		//�������������� ������ ���� � ������ ����
		int wordNumber=0; //����� ����� � �������
		int startingWordPosition=0; //����� ������� � ������, � �������� ����� ���������� ���������� � ������ ����� 
		for(int i=0; i < originalString.length(); i++)
			if (originalString.regionMatches(i," ",0,1) & !originalString.regionMatches(i+1," ",0,1) ) {	//���� ������� ��������������� ������ ������, � ��������� �� ��� �� ������, �� �������� �� ������ �����, � ������� ��� � ������ ����	
				stringArray[wordNumber] = originalString.substring(startingWordPosition,i);
				wordNumber++;
				startingWordPosition=i+1;
			}
		stringArray[wordNumber] = originalString.substring(startingWordPosition,originalString.length()); //���������� ��������� ����� �� ������ (�� ��������������� ��������)  � ������ �����
		//���������� ������ ���� ������� "��������"
		//����� "��������" ��� ������ �� ����������� ��� ���������� �������� � ���� ����, � ����� ���� �� ����������� ������ ��������� ����� �������� � ������ ��������� �����������. ��� �������������, ��� �������������� �������� ��������� ��������� ����� ���������� ����� ��������, ����������� �� "�����" ��� "�����"
		for(int j=0; j < stringArray.length; j++) {
			for(int i=j+1; i < stringArray.length; i++){
				//���������� ������������ ����� �� ��������� ����������, � ������� ����� ������� ����� ��� ���������
				String stringWithoutDigits1 = stringArray[i];
				String stringWithoutDigits2 = stringArray[j];
				//�������� ���� �� ������������ �����
				for(int digit=0; digit < 10; digit++) {
					stringWithoutDigits1 = stringWithoutDigits1.replace(Integer.toString(digit),"");
					stringWithoutDigits2 = stringWithoutDigits2.replace(Integer.toString(digit),"");
				}
				if(stringWithoutDigits1.compareTo(stringWithoutDigits2) < 0) {		//��������� ������ (� ������� ��� ��������� �����) �� ���������
					String tmp = stringArray[j];		//������ ������� ������ (������� � �������)
					stringArray[j] = stringArray[i];
					stringArray[i] = tmp;
				}
			}
		}
		for(int i=0; i < stringArray.length; i++) 		//������� �������������� �������� ������ ����� ���������� ���� �� �������
			resultString = resultString + stringArray[i] + " ";

		return resultString;
	}

	//�������� ���������
	public static void main (String args[]) {
		String inputString = "ma79ma 9n8e7 mila r1a2m3u ";	//�������� ������ ����
		String outputString = ""; //�������������� ��������������� ������
		outputString = Task2_SuperSort.superSort(inputString);	//����� ������� superSort, ����������� ������ ����
		System.out.println(outputString); //  ����� ��������������� ������
	}
}
