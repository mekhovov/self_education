/** Self Education
 * 
 * Stack implementation
 *
 * Date: January, 2008
 * 
 * @author Alex Mekhovov
 */
 
package Java;

import java.util.*;

/** class Stack
 * 
 * methods: 
 * 		- pop
 * 		- push
 * 
 * @author Dark_Alex
 */
public class Stack {
	private int iCount = 0;
	private static int iCals = 0;
	private int iStack[];
	
	/** Constructor by default
	 * @return count of created objects
	 */
	public Stack(int f_iSize) {
		iCals++;
		iStack = new int [f_iSize];	
	}
	
	/** Method Push
	 * add element to stack
	 * 
	 * @param f_iElement - added element
	 * @exception ArrayIndexOutOfBoundsException
	 */
	public void Push (int f_iElement) {
		if (iCount < iStack.length) {
			iStack[iCount++] = f_iElement;
		} else {
			throw new ArrayIndexOutOfBoundsException(iCount);
		}
	}
	
	/** Method Pop
	 * get element from stack
	 * 
	 * @return - element from stack
	 * @exception ArrayIndexOutOfBoundsException
	 */
	public int Pop () {
		int iElemet;
		if (iCount >= 0) {
			iElemet = iStack[--iCount];
		} else {
			throw new ArrayIndexOutOfBoundsException(iCount);
		}		
		return iElemet;
	}

	/** Method Cals
	 * Count of stack created
	 * 
	 * @return - count
	 */
	public static int Cals () {
		return iCals;
	}

	public static void main(String[] args) throws RuntimeException {
		Random rnd = new Random();		
		int iElement = rnd.nextInt(), n = 12;
		Stack my_stack = null;
		
		System.out.println(">>> Stacks created: " + my_stack.Cals() );
		
		my_stack = new Stack(10);
		
		System.out.println(">>> Stacks created: " + my_stack.Cals() );
		
		System.out.println(">>> Add " + n + "elements to stack...");
		
		try {
			for (int i = 0; i < n; i++) {
				iElement = rnd.nextInt();
				my_stack.Push(iElement);
				System.out.println(">>> Added element (" + i + "): " + iElement);
			}
					
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("*** ERROR: Stack overflow. ");
			System.err.println("*** ERROR: Stack overflow. " +  e.getMessage());
		}
			
		System.out.println(">>> Get " + n + "elements from stack...");
		
		try {
			for (int i = 0; i < n; i++) 
				System.out.println (">>> Get element (" + i +"):" + my_stack.Pop());
		
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("*** ERROR: Stack empty. ");
			System.err.println("*** ERROR: Stack empty. " +  e.getMessage());
		}
		
		
		Stack my_stack2 = new Stack(10);
		
		System.out.println(">>> Stacks created: " + my_stack.Cals() );
		
		}
	
}
