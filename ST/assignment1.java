import java.io.*;
import java.util.*;

class TestClass {
   
    static class Solution{
       
        public Solution(){
            //Do nothing;
        }
       
        public void calculate(int n, int t,int cnst_speed[], int brk_speed[],int brk_time[]){
            int dis[] = new int[n];
            for(int i = 0;i<n;i++){
                int const_dis = cnst_speed[i]*(t - brk_time[i]);
                int brk_dis = brk_speed[i]*brk_time[i];
                dis[i] = const_dis + brk_dis;
            }
            int ind = 0;
            int max = dis[0];
            for(int i = 0;i<n;i++){
                if(dis[i]>max){
                    max = dis[i];
                    ind = i;
                }
            }
            ind++;
            System.out.println("The fastest racer is " + ind + " as it covered maximum distance " + max);
        }
       
    }
   
   
   
    public static void main(String args[] ) throws Exception {
        BufferedReader b = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(b.readLine());
        int t = Integer.parseInt(b.readLine());
       
        int cnst_speed[] = new int[n];
        int brk_speed[] = new int[n];
        int brk_time[] = new int[n];
       
        for(int i = 0 ;i<n;i++){
            String[] input = b.readLine().split(" ");
            cnst_speed[i] = Integer.parseInt(input[0]);
            brk_speed[i] = Integer.parseInt(input[1]);
            brk_time[i] = Integer.parseInt(input[2]);
        }
        Solution sol = new Solution();
        sol.calculate(n,t,cnst_speed,brk_speed,brk_time);
    }
}