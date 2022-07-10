import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sencillo/contact.dart';
import 'package:sencillo/hive_data.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContacAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final HiveData hiveData = const HiveData();

  List<Contac> contacts = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    numberController.dispose();
    super.dispose();
  }

  Future<void> getData() async {
    contacts = await hiveData.contacts;
    setState(() {
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Hive Example"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                ),
                TextField(
                  controller: numberController,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await hiveData
                          .saveContact(
                            Contac(
                                name: controller.text,
                                number: numberController.text),
                          )
                          // ignore: avoid_print
                          .then((value) => print(value));
                      await getData();
                    },
                    child: const Text('Add')),
                Expanded(
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(contacts[index].name),
                        subtitle: Text(contacts[index].number),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
