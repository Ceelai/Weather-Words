import 'dart:math';

class WordData {
  //variable declaration
  final String word;
  final String definition;
  final String pronounciation;

  //constructor
  WordData({this.word, this.definition, this.pronounciation});

  static WordData fromJson(dynamic wordJson) {
    Random random = new Random();

    int randomNumber = random.nextInt(49) + 0;
    final assembledWord = wordJson[randomNumber];

    return WordData(
      word: assembledWord['word'],
      definition: assembledWord['defs'][0],
      pronounciation: assembledWord['tags'][0],
    );
  }
}
