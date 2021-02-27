class ProjectModel {
  final List<String> item1;
  final List<String> item2;
  final List<String> item3;
  final List<String> item4;
  final List<String> item5;

  ProjectModel({this.item1,this.item2,this.item3,this.item4,this.item5,});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      item1: json['1'],
      item2: json['2'],
      item3: json['3'],
      item4: json['4'],
      item5: json['5'],
    );
  }
}
