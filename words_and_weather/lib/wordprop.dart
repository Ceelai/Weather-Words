import 'dart:math';

class WordData {
  //variable declaration
  final String word;
  final String definition;
 
  final String wordClass;

  //constructor
  WordData({this.wordClass,this.word, this.definition});

  static WordData fromJson(dynamic wordJson) {
    Random random = new Random();

    int randomNumber = random.nextInt(49) + 0;
    final assembledWord = wordJson[randomNumber];

    final classID = assembledWord['tags'][0];
    final def = assembledWord['defs'][0];
    //var deflist = assembledWord['defs'] as List;

    return WordData(
      word: assembledWord['word'],
      definition: returnDefinition(def),
     //pronounciation: assembledWord['tags'][1],
      wordClass: returnClass(classID),
    );
  }

  static String returnDefinition(String def){
    if (def == null){
      def = "Definition not available.";
      return def;
    } else{
      return def;
    }
  }

  static String returnClass(String classID){
    String wordClass;
    
    if (classID == 'n'){
      wordClass = 'noun';
    } 

    if (classID == 'v'){
      wordClass = 'verb';
    }

    if (classID == 'adj'){
      wordClass = 'adjective';
    }

    if (classID == 'adv'){
      wordClass = 'adverb';
    }

    if (classID == 'u'){
      wordClass = '';
    }

    if (classID == null){
      wordClass = '';
    }
    return wordClass;
  }

}
