import 'package:christy/core/di/dependency_injection.dart';
import 'package:christy/core/widgets/search_app.dart';
import 'package:christy/features/add_friend/logic/cubit/search_friend_cubit.dart';
import 'package:christy/features/add_friend/ui/widget/search_friend_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/cubit/search_friend_states.dart';

class AddFriendScreen extends StatelessWidget {
  const AddFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchFriendCubit(getIt()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<SearchFriendCubit, SearchFriendStates>(
              builder: (BuildContext context, SearchFriendStates state) {
                return Column(
                  children: [
                    SearchApp(
                      text: 'Search For Friend',
                      controller:
                          SearchFriendCubit.get(context).searchController,
                      onTap: () {
                        SearchFriendCubit.get(context)
                            .listenTextEditingController();
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SearchFriendListView(
                      state: state,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
