import 'package:da2dbms/list.dart';

import 'package:flutter/material.dart';
class DashboardScreen extends StatefulWidget { @override
_DashboardScreenState createState() => _DashboardScreenState();

}
class _DashboardScreenState extends State<DashboardScreen> { Future<double> getCartTotal(BuildContext context) async { double cost = await Navigator.push(
context, MaterialPageRoute(builder: (context) => ListPageView())); return cost;
}
double totalCost = 0; @override
Widget build(BuildContext context) { return Scaffold(
appBar: AppBar(
title: Text('Stationary Shop Dashboard'),
),

body: Center(
child: Column(

mainAxisAlignment: MainAxisAlignment.center, children: [
ElevatedButton(
child: Text('View Available Stationary'), onPressed: () async {
totalCost = await getCartTotal(context); setState(() {});
},
 
),
const SizedBox(height: 20),

const SizedBox(height: 10),
const SizedBox(height: 20), Text(
'Total Cost: Rs. ${totalCost}',
style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
],
),
),
);
}
}
class DashboardApp extends StatelessWidget { @override
Widget build(BuildContext context) { return MaterialApp(
title: 'Stationary Shop',
theme: ThemeData(primarySwatch: Colors.blue), home: DashboardScreen(),
);

}
}
void main() {
runApp(DashboardApp());
}
