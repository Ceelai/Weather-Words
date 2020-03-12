import 'dart:math';

class WordData {
  //variable declaration
  final String word;
  final String definition;
  final String pronounciation;
  final String wordClass;

  //constructor
  WordData({this.wordClass,this.word, this.definition, this.pronounciation});

  static WordData fromJson(dynamic wordJson) {
    Random random = new Random();

    int randomNumber = random.nextInt(49) + 0;
    final assembledWord = wordJson[randomNumber];

    final classID = assembledWord['tags'][0];

    return WordData(
      word: assembledWord['word'],
      definition: assembledWord['defs'][0],
      pronounciation: assembledWord['tags'][1],
      wordClass: returnClass(classID),
    );
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
    return wordClass;
  }

}
