// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

/*
http://toyohide.work/BrainLog/api/getTrainCompany

{
    'data': [
        {
            'company_id': 1,
            'company_name': 'JR北海道',
            'flag': '0',
            'train': [
                {
                    'train_number': '11101',
                    'train_name': 'JR函館本線(函館～長万部)',
                    'pickup': '0'
                },

*/

import '../extensions/extensions.dart';

class Company {
  Company({
    required this.companyId,
    required this.companyName,
    required this.flag,
    required this.train,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyId: json['company_id'].toString().toInt(),
        companyName: json['company_name'].toString(),
        flag: json['flag'].toString(),
        train: List<Train>.from(
            json['train'].map((x) => Train.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
      );
  int companyId;
  String companyName;
  String flag;
  List<Train> train;

  Map<String, dynamic> toJson() => {
        'company_id': companyId,
        'company_name': companyName,
        'flag': flag,
        'train': List<dynamic>.from(train.map((x) => x.toJson())),
      };
}

class Train {
  Train({
    required this.trainNumber,
    required this.trainName,
    required this.pickup,
  });

  factory Train.fromJson(Map<String, dynamic> json) => Train(
        trainNumber: json['train_number'].toString(),
        trainName: json['train_name'].toString(),
        pickup: json['pickup'].toString(),
      );
  String trainNumber;
  String trainName;
  String pickup;

  Map<String, dynamic> toJson() => {
        'train_number': trainNumber,
        'train_name': trainName,
        'pickup': pickup,
      };
}
