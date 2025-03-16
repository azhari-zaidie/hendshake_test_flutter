import 'package:get_it/get_it.dart';
import 'package:hendshake_test_flutter/core/hive/hive_init.dart';
import 'package:hendshake_test_flutter/features/activity/data/datasource/activity_ds.dart';
import 'package:hendshake_test_flutter/features/activity/data/datasource/activity_local_ds.dart';
import 'package:hendshake_test_flutter/features/activity/data/repository/activity_repository_impl.dart';
import 'package:hendshake_test_flutter/features/activity/domain/repository/activity_repository.dart';
import 'package:hendshake_test_flutter/features/activity/domain/usecase/get_activity_case.dart';
import 'package:hendshake_test_flutter/features/activity/presentation/provider/activity_provider.dart';
import 'package:hendshake_test_flutter/features/history/data/datasource/history_ds.dart';
import 'package:hendshake_test_flutter/features/history/data/repository/history_repository_impl.dart';
import 'package:hendshake_test_flutter/features/history/domain/repository/history_repository.dart';
import 'package:hendshake_test_flutter/features/history/domain/usecase/get_history_case.dart';
import 'package:hendshake_test_flutter/features/history/presentation/provider/history_provider.dart';
import 'package:hendshake_test_flutter/features/home/presentation/provider/home_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'init_dependencies.dart';