import 'package:api/Utc/Provider/MyCountProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';


class ProviderFltter extends StatefulWidget {
  const ProviderFltter({super.key});

  @override
  State<ProviderFltter> createState() => _ProviderFltterState();
}

class _ProviderFltterState extends State<ProviderFltter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Provider Tutorail"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("Count value is= ${context.watch<MyCountProvider>().con}"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    context.read<MyCountProvider>().addCount();
                  },
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: (){
                    context.read<MyCountProvider>().subtractCount();
                  },
                  child: Icon(Icons.remove),
                )
              ],
            )

          ],
        ),
      ),

    );
  }
}
