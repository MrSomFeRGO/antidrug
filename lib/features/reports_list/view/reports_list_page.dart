import 'dart:math';

import 'package:antidrugs/core/utils/constants.dart';
import 'package:antidrugs/features/navigation/bloc/appbar_bloc.dart';
import 'package:antidrugs/features/reports_list/dto/donosObj.dart';
import 'package:antidrugs/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ReportsListPage extends StatefulWidget {
  const ReportsListPage({Key? key}) : super(key: key);

  @override
  State<ReportsListPage> createState() => _ReportsListPageState();
}

class _ReportsListPageState extends State<ReportsListPage> {
  final _donoses = [
    const DonosObj(
      'Граффити 1',
      'https://od-news.com/wp-content/uploads/2016/03/c440bb068ba1da1dc425c57f99970f6f-1.jpg',
      '34563755',
      23.734051,
      52.097622,
    ),
    const DonosObj(
      'Граффити 2',
      'https://mail.kz/upload/media/f5c1090f4d2db5943c287161160cbedf.jpg',
      '34563757',
      23.734051,
      52.097622,
    ),
    const DonosObj(
      'Граффити 3',
      'https://img.novosti-n.org/upload/ukraine/164000.jpg',
      '34563755',
      23.734051,
      52.097622,
    ),
    const DonosObj(
      'Граффити 4',
      'https://kievvlast.com.ua/project/resources/2017/11/UUpQkQb2.jpg',
      '34563757',
      23.734051,
      52.097622,
    ),
  ];

  @override
  void initState() {
    GetIt.I<AppbarBloc>().add(const AppbarAddTitle(title: 'Список доносов'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(child: ListView.builder(
              itemCount: _donoses.length,
              itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
              child: Material(
                    elevation: 6,
                    shadowColor: const Color(0xff0500FF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      onTap: () {
                        context.push(Routes.denunciationSingleNamedPage,
                            extra: _donoses[i]);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: ColorName.lightWhite,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(vertical: 4),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          height: 20,
                          alignment: Alignment.topLeft,
                          child: Text(_donoses[i].text),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(_donoses[i].userId),
                      ),
                      trailing: Container(
                        width: 20,
                        decoration: BoxDecoration(
                          color: _donoses[i].userId == '34563757' ? Colors.green : Colors.red,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                        ),
                      ),
                      // не нужно
                      // leading: ObjectsListLeading(
                      //   image: state.objects[i].objectImage,
                      // ),
                      // title: Padding(
                      //   padding: const EdgeInsets.only(left: 12),
                      //   child: Container(
                      //     height: 60,
                      //     alignment: Alignment.topLeft,
                      //     child: Text(_donoses[i].text),
                      //   ),
                      // ),
                      // trailing: Padding(
                      //   padding: const EdgeInsets.only(left: 12),
                      //   child: Container(
                      //     height: 60,
                      //     alignment: Alignment.topLeft,
                      //     child: Text(_donoses[i].userId),
                      //   ),
                      // ),
                    ),
                  ),
                );
          }))
        ],
      ),
    );
  }
//   return Scaffold(
//     body: Column(
//       children:[
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//             child: ListView.builder(
//               //shrinkWrap: true,
//               itemCount: _donoses.length,
//               itemBuilder: (context, i) {
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
//                   child: Material(
//                     elevation: 6,
//                     shadowColor: const Color(0xff0500FF).withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                     child: ListTile(
//                       onTap: () {
//                         context.push(Routes.denunciationSingleNamedPage,
//                             extra: _donoses[i]);
//                       },
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       tileColor: ColorName.lightWhite,
//                       contentPadding: EdgeInsets.zero,
//                       visualDensity: const VisualDensity(vertical: 4),
//                       // не нужно
//                       // leading: ObjectsListLeading(
//                       //   image: state.objects[i].objectImage,
//                       // ),
//                       title: Padding(
//                         padding: const EdgeInsets.only(left: 12),
//                         child: Container(
//                           height: 60,
//                           alignment: Alignment.topLeft,
//                           child: Text(_donoses[i].text),
//                         ),
//                       ),
//                       trailing: Padding(
//                         padding: const EdgeInsets.only(left: 12),
//                         child: Container(
//                           height: 60,
//                           alignment: Alignment.topLeft,
//                           child: Text(_donoses[i].userId),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
