class Workout {
  String? muscles;
  String? workOut;
  String? intensityLevel;
  String? beginnerSets;
  String? intermediateSets;
  String? expertSets;
  String? equipment;
  String? explaination;
  String? longExplanation;
  String? video;

  Workout(
      {this.muscles,
      this.workOut,
      this.intensityLevel,
      this.beginnerSets,
      this.intermediateSets,
      this.expertSets,
      this.equipment,
      this.explaination,
      this.longExplanation,
      this.video});

  Workout.fromJson(Map<String, dynamic> json) {
    muscles = json['Muscles'];
    workOut = json['WorkOut'];
    intensityLevel = json['Intensity_Level'];
    beginnerSets = json['Beginner Sets'];
    intermediateSets = json['Intermediate Sets'];
    expertSets = json['Expert Sets'];
    equipment = json['Equipment'];
    explaination = json['Explaination'];
    longExplanation = json['Long Explanation'];
    video = json['Video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Muscles'] = this.muscles;
    data['WorkOut'] = this.workOut;
    data['Intensity_Level'] = this.intensityLevel;
    data['Beginner Sets'] = this.beginnerSets;
    data['Intermediate Sets'] = this.intermediateSets;
    data['Expert Sets'] = this.expertSets;
    data['Equipment'] = this.equipment;
    data['Explaination'] = this.explaination;
    data['Long Explanation'] = this.longExplanation;
    data['Video'] = this.video;
    return data;
  }
}