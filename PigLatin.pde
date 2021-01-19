public void setup() 
{
  String[] lines = loadStrings("words.txt");
  System.out.println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) 
  {
    System.out.println(pigLatin(lines[i]));
  }
}
public void draw()
{
  //not used
}
public int findQu(String sWord) {
  //Checks first 2 letters to see if they are "qu"
  String qu = sWord.substring(0, 2);
  if (qu.equals("qu")) {
    return 2;
  }
  return -1;
}
public boolean noVowels(String sWord) {
  String vowel;
  for (int i = 1; i <= sWord.length(); i++) {
    vowel = sWord.substring(i-1, i);
    if (vowel.equals("a")) {
      return false;
    } else if (vowel.equals("e")) {
      return false;
    } else if (vowel.equals("i")) {
      return false;
    } else if (vowel.equals("o")) {
      return false;
    } else if (vowel.equals("u")) {
      return false;
    }
  }
  return true;
}

public int findFirstVowel(String sWord)
  //precondition: sWord is a valid String of length greater than 0.
  //postcondition: returns the position of the first vowel in sWord. If there are no vowels, returns -1
  //Checks first letter for vowels
{
  String first = sWord.substring(0, 1);
  if (first.equals("a")) {
    return 1;
  }
  if (first.equals("e")) {
    return 1;
  }
  if (first.equals("i")) {
    return 1;
  }
  if (first.equals("o")) {
    return 1;
  }
  if (first.equals("u")) {
    return 1;
  }

  return 3;
}

public String pigLatin(String sWord)
  //precondition: sWord is a valid String of length greater than 0
  //postcondition: returns the pig latin equivalent of sWord
{
  if (findFirstVowel(sWord) == 1) {
    //When findFirstVowel finds a vowel as the first letter
    return sWord + "way";
  } else if (findQu(sWord) ==  2) {
    //When findQu finds qu as first two letters
    String mod = sWord.substring(2);
    return mod + "quay";
  } else if (noVowels(sWord)) {
    //When there are no vowels in the word
    return sWord+"ay";
  } else if (findFirstVowel(sWord) == 3) {
    //When there is a vowel somewhere in the word (already checked if the vowel is the first letter)
    int foundVowel = 0;
    String potentialVowel;
    String mod;
    String chunk;
    for (int i = 1; i <= sWord.length(); i++) {
      potentialVowel = sWord.substring(i-1, i);
      //System.out.println(potentialVowel);
      if (potentialVowel.equals("a")) {
        foundVowel = i-1;
        break;
      } else if (potentialVowel.equals("e")) {
        foundVowel = i-1; 
        break;
      } else if (potentialVowel.equals("i")) {
        foundVowel = i-1;
        break;
      } else if (potentialVowel.equals("o")) {
        foundVowel = i-1;
        break;
      } else if (potentialVowel.equals("u")) {
        foundVowel = i-1; 
        break;
      }
    }
    //Looking for position of the first vowel in the word
    mod = sWord.substring(0, foundVowel);
    chunk = sWord.substring(foundVowel);
    return chunk+mod+"ay";
  } else {
    return "ERROR";
    //You messed up
  }
  
  
}
