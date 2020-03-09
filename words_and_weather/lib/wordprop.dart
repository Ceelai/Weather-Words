class WordData {
  //variable declaration
  final String word;
  final String definition;
  final String pronounciation;

  //constructor
  WordData({this.word, this.definition, this.pronounciation});

  static WordData fromJson(dynamic wordJson) {
    final assembledWord = wordJson[0];

    return WordData(
      word: assembledWord['word'],
      definition: assembledWord['defs'][0],
      pronounciation: assembledWord['tags'][0],
    );
  }
}
