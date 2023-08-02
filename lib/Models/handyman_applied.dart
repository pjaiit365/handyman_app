class HandymanAppliedData {
  final String jobID;
  final String name;
  final String addressType;
  final String street;
  final String town;
  final String houseNum;
  final String region;
  final String notes;
  final String date;
  final String time;
  final String pic;
  final String applierID;
  final String documentID;
  final String receiverID;
  String? whoApplied;
  List? referenceLinks;
  // final List portfolio;
  HandymanAppliedData({
    this.whoApplied,
    required this.documentID,
    required this.jobID,
    required this.receiverID,
    required this.applierID,
    required this.name,
    required this.addressType,
    required this.houseNum,
    required this.town,
    required this.street,
    required this.region,
    required this.notes,
    required this.time,
    required this.pic,
    required this.date,
    this.referenceLinks,
    // required this.portfolio,
  });
}
