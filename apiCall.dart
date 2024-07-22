import 'dart:convert';
import 'package:flutter/foundation.dart'; import 'package:http/http.dart' as http; class Inv {
final int id;
final String name;
 
int qty = 0; int sel = 0;
final double price;
final Map<String, dynamic> map; Inv(
{required this.id,
required this.name, required this.qty,
required this.sel, required this.price,
required this.map});
factory Inv.fromJson(Map<String, dynamic> json) { return Inv(
id: json['id'],
name: json['name'], qty: json['quantity'], sel: 0,
price: json['price'], map: json,
);
}
}
class StationaryApi {
static List<Inv> parseProd(String responseBody) { final parse = json.decode(responseBody);
if (kDebugMode) { print(parse);
}
return parse.map<Inv>((json) => Inv.fromJson(json)).toList();
}
static Future<List<Inv>> getStationary() async { final response =
await   http.get(Uri.parse('http://127.0.0.1:5000/get_data')); if (response.statusCode == 200) {
return parseProd(response.body);
} else { return [];
}
}
}
