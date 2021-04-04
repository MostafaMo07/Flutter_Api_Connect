void pretendFileIO() {
  print("File IO: Started");
  print("File IO: File contents => Hello Futures");
  print("File IO: Done");
}

Future<String> pretendHTTPRequest({bool withError = false}) async {
  print("HTTP Request: Started");
  if (withError) {
    return Future.error("Pretend HTTP Timeout");
  } else {
    return Future.delayed(Duration(seconds: 8), () => ("A JSON PlaceHolder"));
  }

  // print("HTTP Request: Response => A JSON placeholder");
  // print("HTTP Request: Done");
}

Future<String> pretendDataBaseQuery(String searchTerm) async {
  print("Database query for $searchTerm: Started");
  return Future.delayed(
      Duration(seconds: 2),
      () =>
          ("Database query: Resultset => ID :1, First Name: Mostafa, Last Name:Morsy"));
}

void main(List<String> args) async {
  pretendFileIO();
  try {
    var response = await pretendHTTPRequest(withError: false);
    var query = await pretendDataBaseQuery(response);
    print(query);
  } catch (e) {
    print("An Error Occured: $e");
  }
}
