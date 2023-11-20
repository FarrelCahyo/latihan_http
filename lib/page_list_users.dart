import 'package:flutter/material.dart';
import 'package:latihan_http/api_data_source.dart';
import 'users_model.dart';

class PageListUsers extends StatefulWidget {
  const PageListUsers({super.key});

  @override
  State<PageListUsers> createState() => _PageListUsersState();
}

class _PageListUsersState extends State<PageListUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Users dari API"),
      ),
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody(){
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadUsers(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.hasError){
              return _buildErrorSection();
            }
            if(snapshot.hasData){
              UsersModel usersModel =
                  UsersModel.fromJson(snapshot.data);
              return _buildSuccessSection(usersModel);

            }
            return _buildLoadingSection();
          }
      ),
    );
  }

  Widget _buildErrorSection(){
    return Text("Error");
  }

  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(UsersModel data){
    return ListView.builder(
        itemCount: data.data!.length,
        itemBuilder: (BuildContext context, int index){
          return _buildItemUsers(data.data![index]);
        }
    );
  }

  Widget _buildItemUsers(Data usersModel){
    return InkWell(
      onTap: () => null,
          // Navigator.push(
          // context,
          // MaterialPageRoute(
          //     builder: (context) => PageDetailUser(idUser: userData.id!,))),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(usersModel.avatar!),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(usersModel.firstName! + " " + usersModel.lastName!),
                Text(usersModel.email!),
              ],
            )
          ],
        ),
      ),
    );
  }

}
