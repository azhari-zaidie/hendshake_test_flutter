import 'dart:convert';

import 'package:hendshake_test_flutter/core/result/error/exception.dart';
import 'package:hendshake_test_flutter/features/activity/data/datasource/activity_local_ds.dart';
import 'package:hendshake_test_flutter/features/activity/data/model/activity_model.dart';
import 'package:http/http.dart' as http;

abstract interface class ActivityDs {
  Future<ActivityModel> getActivity();
}

class ActivityDsImpl implements ActivityDs {
  final ActivityLocalDs localDs;

  ActivityDsImpl({required this.localDs});

  @override
  Future<ActivityModel> getActivity() async {
    try{
      final response = await http.get(Uri.parse('https://bored.api.lewagon.com/api/activity'));
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        // if(json is List){
        //   return (json).map((e) => ActivityModel.fromJson(e).copyWith(
        //     activity: e['activity'] ?? '',
        //     accessibility: e['accessibility'] ?? 0,
        //     type: e['type'] ?? '',
        //     participants: e['participants'] ?? 0,
        //     price: e['price'] ?? 0,
        //     link: e['link'] ?? '',
        //     key: e['key'] ?? '',
        //   )).toList();
        // }else{
        //   throw ServerException('Failed to load activity');
        // }
        final activity = ActivityModel.fromJson(json).copyWith(
          // use double parse to avoid error: error int is not double
          // use int parse to avoid error
          activity: json['activity'] ?? '',
          accessibility: double.parse(json['accessibility'].toString()),
          type: json['type'] ?? '',
          participants: int.parse(json['participants'].toString()),
          price: double.parse(json['price'].toString()),
          link: json['link'] ?? '',
          key: json['key'] ?? '',
          createdAt: DateTime.now(),
        );
        
        // Save to local storage
        await localDs.saveActivity(activity);
        
        return activity;
      }
      throw ServerException('Failed to load activity');

    }catch(e){
      // // Try to get from local storage if API fails
      // try {
      //   final localActivity = await localDs.getLastActivity();
      //   if (localActivity != null) {
      //     return localActivity;
      //   }
      // } catch (_) {
      //   // If local storage also fails, throw the original exception
      // }
      
      final exception = ServerException(e.toString());
      throw exception;
    }
  }

  // store local
}


