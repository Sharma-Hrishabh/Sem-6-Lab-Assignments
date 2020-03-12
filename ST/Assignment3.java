import java.util.*;
import java.io.*;
public class Assignment3 {
    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);
        System.out.println("enter no of rows:");
        int rows = scan.nextInt();
        System.out.println("enter no of columns:");
        int columns = scan.nextInt();
        char[][] mines = new char[rows][columns];
        for(int i=0;i<rows;i++)
        {
            String s1 = scan.next();
            for(int j=0;j<columns;j++)
            {
                mines[i][j] = s1.charAt(j);
            }
        }
        int[][] ans = new int[rows+1][columns+1];
        for(int i=0;i<rows;i++) {
            for (int j = 0; j < columns; j++) {
//                System.out.println(i+" "+j);
                if (mines[i][j] == '*') {
                    ans[i][j] = 0;
//                    System.out.println(ans[i][j]+" ");
                } else {
                    int c = 0;
                    //check left
                    if (j - 1 >= 0)
                        if (mines[i][j - 1] == '*') {
                            c++;
                        }
                    //check right
                    if (j + 1 < columns)
                        if (mines[i][j + 1] == '*') {
                            c++;
                        }
                    
                    if (i - 1 < rows && i - 1 >= 0) {
                        //check low
                        if (mines[i - 1][j] == '*') {
                            c++;
                        }
                        //check lower diagonals
                        if (j - 1 >= 0) {
                            if (mines[i - 1][j - 1] == '*') {
                                c++;
                            }
                        }
                        if (j + 1 < columns) {
                            if (mines[i - 1][j + 1] == '*') {
                                c++;
                            }
                        }
                    }
                    //check down
                    if (i + 1 < rows && i + 1 >= 0) {
                        if (mines[i + 1][j] == '*') {
                            c++;
                        }
                        if (j - 1 >= 0) {
                            if (mines[i + 1][j - 1] == '*') {
                                c++;
                            }
                        }
                        if (j + 1 < columns) {
                            if (mines[i + 1][j + 1] == '*') {
                                c++;
                            }
                        }
                    }
                    ans[i][j] = c;
                    //System.out.println(ans[i][j]+" ");
                }
            }
        }
        for(int i=0;i<rows;i++)
        {
            for(int j=0;j<columns;j++)
            {
                System.out.print(ans[i][j]+" ");
            }
            System.out.println("");
        }
    }
}
