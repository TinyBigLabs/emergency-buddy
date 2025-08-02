import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:emergency_buddy/presentation/widgets/first_aid/blocs/first_aid_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class FirstAidListing extends StatelessWidget {
  final String category;
  const FirstAidListing({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstAidCubit, FirstAidState>(builder: (context, state) {
      if (state is FirstAidLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is FirstAidAllCategoriesLoaded) {
        final filteredCategories = category == 'Life Threatening'
            ? state.lifeThreateningCategories
                .map((e) => e.promptTag)
                .toSet()
                .toList()
            : state.emergencyCategories
                .map((e) => e.promptTag)
                .toSet()
                .toList();
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final firstAid = filteredCategories[index];
              return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: UIConstants.mediumSize,
                    vertical: UIConstants.smallSize),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).secondaryHeaderColor,
                      child: Icon(Icons.medical_services,
                          color: Colors.black,
                          size: UIConstants.iconSizeListing),
                    ),
                    title: Text(firstAid,
                        style: Theme.of(context).textTheme.headlineSmall),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(UIConstants.mediumSize),
                        child: Text(firstAid,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: filteredCategories.length,
          ),
        );
      } else if (state is FirstAidError) {
        return Center(child: Text('Error: ${state.errorMessage}'));
      } else {
        return const Center(child: Text('No categories available.'));
      }
    });
  }
}
