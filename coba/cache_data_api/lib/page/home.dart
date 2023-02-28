import 'package:cache_data_api/bloc/user_bloc.dart';
import 'package:cache_data_api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc myBloc = context.read<UserBloc>();
    return Scaffold(
      body: BlocBuilder(
        bloc: myBloc,
        builder: (context, state) {
          if (state is UserLoadinState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoadedState) {
            List<UserModel> user = state.users;
            return ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => BlocProvider.value(
                    //       value: myBloc,
                    //       child: DetailPage(e: user[index]),
                    //     ),
                    //   ),
                    // );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    color: Colors.blue,
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        user[index].first_name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        user[index].last_name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                  ),
                );
              },
            );
          }

          if (state is UserLoadedError) {
            return Text("Something went wrong");
          }

          return Container();
        },
      ),
    );
  }
}