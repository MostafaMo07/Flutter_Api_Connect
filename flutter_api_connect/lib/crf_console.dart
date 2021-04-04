import 'package:http/http.dart' as http;

String url = "https://fakerapi.it/api/v1/persons?_locale=fr_FR";

void useHttpRead() async {
  var contents = await http.read(url);
  print(contents);
}

void useHttpGet() async {
  var response = await http.get(url);
  print(response.body);
  print(response.statusCode);
}

void main() {
  useHttpGet();
}
