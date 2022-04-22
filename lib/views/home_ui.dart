import 'package:flutter/material.dart';
import 'package:flutter_app_mydiaryfood/models/diaryfood.dart';
import 'package:flutter_app_mydiaryfood/services/diaryfood_api.dart';
import 'package:flutter_app_mydiaryfood/services/env.dart';

class homeUI extends StatefulWidget {
  const homeUI({ Key? key }) : super(key: key);
  
  @override
  State<homeUI> createState() => _homeUIState();
}

class _homeUIState extends State<homeUI> {

  Future<List<diaryfood>>? diaryfoodData;

  getAllDiaryFoodData(){
    setState(() {
      diaryfoodData = DiaryfoodAPI.getAllDiaryfood();
    });
  }

  @override
  void initState() {
    getAllDiaryFoodData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'My Diary Food V.1.0'
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/banner.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: FutureBuilder(
                future: diaryfoodData,
                builder: (BuildContext buildContext , AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context , index) {
                        return ListTile(
                          onTap: (){},
                          tileColor: index % 2 == 0 ? Colors.green[200] : Colors.grey[300],
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              '${Env.SERVER_URL}/picture_diaryfood/${snapshot.data[index].foodImage}'
                            ),
                          ),
                          title: Text(
                            '${snapshot.data[index].foodShopname}'
                          ),
                          subtitle: Text(
                            '${snapshot.data[index].foodDate}'
                          ),
                          trailing: Text(
                            'ดูรายละเอียด',
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}