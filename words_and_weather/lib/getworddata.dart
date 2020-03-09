
/*int newRandomNumber = next(5, 10);

final _random = new Random();

//return random number given min and max
int next(int min, int max) => min + _random.nextInt(max - min);

abstract class GetWordData{
 

  GetWordData(this.httpClient);

  Future<WordData> getRandomWord() async {
    final wordUrl = '$baseURL?sp=???????&md=d&max=2';
    final wordResponse = await this.httpClient.get(wordUrl);
    if (wordResponse.statusCode != 200) {
      throw Exception('There was a problem getting a word');
    }
    final wordJson = jsonDecode(wordResponse.body);
    return WordData.fromJson(wordJson);
  }
  GetDataState(getRandomWord);
}
*/