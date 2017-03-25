import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.StringTokenizer;

// This is the Reducer part of MapReduce
public class Reducer {
	public static void main (String args[]) {
		try {
			
			BufferedReader br = 
					new BufferedReader(new InputStreamReader(System.in));
			
			String key = "";
			String value = "";
			String input = "";
			String lastTweet = "";
			ArrayList<Integer> dateArray = new ArrayList<Integer>();
			ArrayList<Integer> accessArray = new ArrayList<Integer>();
			
			// read line by line
			while((input = br.readLine()) != null) {
				if(input.indexOf(' ') == -1) 
					continue;
				// get key/value pair
				key = input.substring(0,input.indexOf(' '));
				value = input.substring(input.indexOf(' ')+1);
				
				//final result format: "tweetid;userid;timestamp;score;censored_text"
				if(key.equals(lastTweet) == false)
					System.out.println(key + "\t" + value);

				//record the last tweet
				lastTweet = key;
			}
		} catch(IOException io) {
			io.printStackTrace();
		}
	}
	
}
