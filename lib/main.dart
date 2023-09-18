import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:skilldren/Notification_Service/notification_service.dart';
import 'package:skilldren/Provider/AddFavProvider/add_fav_provider.dart';
import 'package:skilldren/Provider/All%20Competion/all.competition_provider.dart';
import 'package:skilldren/Provider/Batch/batch_provider.dart';
import 'package:skilldren/Provider/FavVideoProvider/fav_video_list.dart';

import 'package:skilldren/Provider/Get%20All%20Task/get_all_task_provider.dart';
import 'package:skilldren/Provider/GetAllTopic/get_all_topic_provider.dart';
import 'package:skilldren/Provider/LeaderBoard/leaderboard_provider.dart';
import 'package:skilldren/Provider/Manage%20Videos/manage_videos_provider.dart';
import 'package:skilldren/Provider/OtpProvider/otpprovider.dart';
import 'package:skilldren/Provider/PricingPlansProvider/pricing_plans_privder.dart';
import 'package:skilldren/Provider/RankList/ranklist_provider.dart';
import 'package:skilldren/Provider/ReelDislike/reel_dislike_provider.dart';
import 'package:skilldren/Provider/ReelLike/reel_like_provider.dart';
import 'package:skilldren/Provider/ReelProvider/reel_provider.dart';
import 'package:skilldren/Provider/RegisterProvider/registerprovider.dart';
import 'package:skilldren/Provider/Stack%20Home%20Provider/stack_home_provider.dart';
import 'package:skilldren/Provider/Student%20Info/student_info_provider.dart';
import 'package:skilldren/Provider/Student%20Rank/student_rank.dart';
import 'package:skilldren/Provider/Sub%20Chapter/sub_chapter_proivder.dart';
import 'package:skilldren/Provider/Submit%20Task/submit_task_provider.dart';
import 'package:skilldren/Provider/Transactions/store_transaction.dart';
import 'package:skilldren/Provider/Transactions/transaction_history_provider.dart';
import 'package:skilldren/Provider/UpdateProfile/update_profile_provider.dart';
import 'package:skilldren/Provider/getAllChapterProvider/getallchapterprovider.dart';
import 'package:skilldren/Provider/getAllcategory/getall_category_provider.dart';
import 'package:skilldren/Provider/loginProvider/loginprovider.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/spalsh.dart';

import 'Prefrenses/prefrenses.dart';
import 'Provider/LiveClassProvider/live_class_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterDownloader.initialize(
      debug: true,
      ignoreSsl:
          true // optional: set to false to disable printing logs to console
      );
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  initializeNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => OtpProvider()),
          ChangeNotifierProvider(create: (_) => RegisterProvider()),
          ChangeNotifierProvider(create: (_) => GetAllCategoryProvier()),
          ChangeNotifierProvider(create: (_) => GetAllTopicProvider()),
          ChangeNotifierProvider(create: (_) => GetAllChapterProvider()),
          ChangeNotifierProvider(create: (_) => Prefrenses()),
          ChangeNotifierProvider(create: (_) => PricingPlansProvider()),
          ChangeNotifierProvider(create: (_) => TransactionProvider()),
          ChangeNotifierProvider(create: (_) => ReelProvider()),
          ChangeNotifierProvider(create: (_) => LiveClassProvider()),
          ChangeNotifierProvider(create: (_) => UpdateProfileProvider()),
          ChangeNotifierProvider(create: (_) => StudentInfoProvider()),
          ChangeNotifierProvider(create: (_) => StoreTransactionProvider()),
          ChangeNotifierProvider(create: (_) => GetAllCompetionProvier()),
          ChangeNotifierProvider(create: (_) => GetAllTaskProvier()),
          ChangeNotifierProvider(create: (_) => SubmitTaskProvider()),
          ChangeNotifierProvider(create: (_) => LeaderBoardListProvider()),
          ChangeNotifierProvider(create: (_) => RankListProvider()),
          ChangeNotifierProvider(create: (_) => ManageVideosProvider()),
          ChangeNotifierProvider(create: (_) => StudentRankProvider()),
          ChangeNotifierProvider(create: (_) => SubChapterProvider()),
          ChangeNotifierProvider(create: (_) => StackHomeProvider()),
          ChangeNotifierProvider(create: (_) => ReelLikeProvider()),
          ChangeNotifierProvider(create: (_) => ReelDislikeProvider()),
          ChangeNotifierProvider(create: (_) => BatchProvider()),
          ChangeNotifierProvider(create: (_) => AddFavProvider()),
          ChangeNotifierProvider(create: (_) => FavVideoListProvider()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Skilldren',
            theme: ThemeData(
              fontFamily: balooBhai2,
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
            ),
            home: const Spalsh()),
      );
    });
  }
}
