import 'package:flutter/material.dart';
import 'package:get_data/dataProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    //final dataprovider = Provider.of<DataProvider>(context, listen: false);
    final dataprovider = Provider.of<DataProvider>(context);
    dataprovider.fetchUsers();
    // dataprovider.isLoading ? 
    // print('Yes') : print(dataprovider.userData[1].lastName);

    return Container(
      
      child: dataprovider.isLoading ? const Text('Loading ') :
      ListView.builder(
        itemCount: dataprovider.userData.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Text('Last Name: ${dataprovider.userData[index].lastName!}'),              
            ],
          ) ;
        })
      ),
    );
  }
}