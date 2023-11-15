import 'package:api/Utc/Model/UserModel.dart';
import 'package:api/Utc/Provider/ApiProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserActivity extends StatefulWidget {
  const UserActivity({super.key});

  @override
  State<UserActivity> createState() => _UserActivityState();
}

class _UserActivityState extends State<UserActivity> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ApiProvider>().fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider=Provider.of<ApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider to fetch data"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: userProvider.userList.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.black,
                elevation: 10.0,
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  ListTile(
                    title: Text(userProvider.userList[index].name.toString()),
                    leading: Text(userProvider.userList[index].id.toString()),
                    subtitle: Text(userProvider.userList[index].email.toString()),
                  )
                ],
                ),
              );

            },
        ),
      ),
    );
  }
}
