import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:emergency_buddy/domain/entities/first_aid_home_page_model.dart';
import 'package:emergency_buddy/presentation/widgets/first_aid/blocs/first_aid_cubit.dart';
import 'package:emergency_buddy/presentation/widgets/shared/buttons/camera_button.dart';
import 'package:emergency_buddy/presentation/widgets/shared/buttons/chat_button.dart';
import 'package:emergency_buddy/presentation/widgets/shared/pdf/pdf_display_mobile.dart';
import 'package:emergency_buddy/presentation/widgets/shared/pdf/pdf_display_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstAidCategorySectionTile extends StatelessWidget {
  final List<FirstAidHomePageData> firstAidSectionData;
  final String firstAidCategory;
  final String ageGroup;

  const FirstAidCategorySectionTile(
      {super.key,
      required this.firstAidSectionData,
      required this.firstAidCategory,
      required this.ageGroup});

  @override
  Widget build(BuildContext context) {
    var filteredCategories = firstAidSectionData
        .where((item) =>
            item.promptTag == firstAidCategory && item.ageGroup == ageGroup)
        .toList();
    if (filteredCategories.isEmpty) {
      filteredCategories = firstAidSectionData
          .where((item) => item.promptTag == firstAidCategory)
          .toList();
    }
    return BlocListener<FirstAidCubit, FirstAidState>(
      listener: (context, state) {
        if (state is FirstAidAllCategoriesLoaded) {
          filteredCategories = firstAidSectionData
              .where((item) =>
                  item.promptTag == firstAidCategory &&
                  item.ageGroup == ageGroup)
              .toList();
          if (filteredCategories.isEmpty) {
            filteredCategories = firstAidSectionData
                .where((item) => item.promptTag == firstAidCategory)
                .toList();
          }
        }
      },
      child: ExpansionTile(
        leading: Icon(Icons.medical_services_outlined,
            color: Theme.of(context).colorScheme.primary),
        title: Text(filteredCategories.first.promptTag,
            style: Theme.of(context).textTheme.headlineSmall),
        children: [
          Padding(
            padding: EdgeInsets.all(UIConstants.mediumSize),
            child: SizedBox(
              width: 500,
              height: 500,
              child: kIsWeb
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: UIConstants.largeSize),
                            Text(
                                "Ask Gemma a question specific to $firstAidCategory:", textAlign: TextAlign.center,),
                            SizedBox(height: UIConstants.smallSize),
                            ChatButton(),
                            SizedBox(height: UIConstants.smallSize),
                            Text(
                                "Upload an image and Gemma will analyse this for you:", textAlign: TextAlign.center),
                            SizedBox(height: UIConstants.smallSize),
                            CameraButton(),

                          ],
                        ),
                      ),
                Expanded(
                  flex: 1,
                  // Using the first item in the filtered list for web display
                  child: PDFDisplayWeb(
                    pdfUrl: filteredCategories.first.pdf,
                    pageNumber: filteredCategories.first.pageNumber,
                  ),
                ),
                    ])
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Upload an image or ask Gemma a question specific to $firstAidCategory:",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: UIConstants.smallSize),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [CameraButton(), ChatButton()],
                        ),
                        SizedBox(height: UIConstants.smallSize),
                        PDFDisplayMobile(
                            pdfFileName: filteredCategories.first.pdf,
                            pageID: filteredCategories.first.pageNumber),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
