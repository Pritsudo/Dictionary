import 'package:http/http.dart' as https;
import 'dart:convert';

class ApiCall {
  Future<List> translateWord(String searchedWord) async {
    var url = Uri.parse(
        "Api");
    var responce = await https.get(url);
    final extractedData = json.decode(responce.body);
    return extractedData["noun"]["syn"];
  }
}

class DataBase{
  Future<void> submitWord(
      {required String word,
      required String meaning1,
      required String meaning2,
      required String meaning3}) async {
    final url = Uri.parse("http://10.0.2.2:8080/words");
    //Student student = Student(address: address, id: 2, name: name);
    var body = json.encode({
      "word": word,
      "meaning1": meaning1,
      "meaning2": meaning2,
      "meaning3": meaning3,
    });
    var status = await https
        .post(url, body: body, headers: {"content-type": "application/json"});
    var code = status.statusCode;
    print("Status is : $code");
  }

  Future<List> getWords() async {
    final url = Uri.parse("http://10.0.2.2:8080/words/all");
    final responce = await https.get(url);
    final extractedData = json.decode(responce.body);
    return extractedData;
  }

  Future<void> deleteWord({required int Id}) async {
    final url = Uri.parse("http://10.0.2.2:8080/words/$Id");
    final responce = await https.delete(url);
    // responce.whenComplete(() {
      print(responce);
    // });
    
  }
}
