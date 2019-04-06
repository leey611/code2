String text = "a unicorn has a horn and is a mythological creature that lives in the forrest";

int order = 3;

int generatedTextLength = 100;

HashMap<String, ArrayList<String>>chain;

void setup(){
  size(600,600);
  chain = new HashMap<String, ArrayList<String>>();
  for(int i =0; i < text.length() - order; i++){
    String gram = text.substring(i, i+order);
    ArrayList<String> characters;
    if(!chain.containsKey(gram)){
      characters = new ArrayList<String>();
      chain.put(gram, characters);
    }else{
      characters = chain.get(gram);
    }
    characters.add(text.substring(i+order, i+order+1));
  }
}
void draw(){
  background(0);
  fill(255);
  textAlign(CENTER);
  text(result, width/4, height/4, width/2, height/4);
}
String result = " ";
void mousePressed(){
  String currentGram = text.substring(0, order);
  result = currentGram;
  for(int i= 0; i<generatedTextLength; i++){
    if(chain.containsKey(currentGram)){
      ArrayList<String> characters=chain.get(currentGram);
      result += characters.get(round(random(characters.size()-1)));
      currentGram = result.substring(result.length()-order, result.length());
    }
  }
}
