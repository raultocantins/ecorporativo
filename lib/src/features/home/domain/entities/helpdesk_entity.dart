class HelpDeskEntity {
  final int id;
  final HelpDeskStatusEntity status;
  final HelpDeskPrognosticEntity prognostic;
  final HelpDeskDatesEntity dates;

  HelpDeskEntity(
      {required this.dates,
      required this.id,
      required this.prognostic,
      required this.status});
}

class HelpDeskStatusEntity {
  final String? description;
  final String? code;
  HelpDeskStatusEntity({this.description, this.code});
}

class HelpDeskPrognosticEntity {
  final String? description;
  final int? code;
  HelpDeskPrognosticEntity({this.description, this.code});
}

class HelpDeskDatesEntity {
  final DateTime? openingDate;
  final DateTime? serviceDate;
  final DateTime? finishDate;
  HelpDeskDatesEntity({this.openingDate, this.serviceDate, this.finishDate});
}
