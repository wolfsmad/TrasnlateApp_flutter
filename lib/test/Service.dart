import './model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:io';

searchProduct(String search, value) async {
    var res = await http
        .get("http://niksarco.com/api/product/?format=json&search=$search");
    if (res.statusCode == 200) {
      var result = convert.jsonDecode(convert.utf8.decode(res.bodyBytes));
      Product pr;
      List<Product> list = [];
      for (var i = 0; i < result.length; i++) {
        pr = new Product.fromJson(result[i]);
        list.add(pr);
      }
      return list;
    } else {
      return HttpException("${res.statusCode}");
    }
  }
