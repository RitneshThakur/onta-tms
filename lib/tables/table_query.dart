// travel_request_model.dart
class TravelRequest {
  final int sn;
  final String qId;
  final String entryDate;
  final String ledgerName;
  final String purpose;
  final String travelDate;
  final String returnDate;
  final String from;
  final String to;
  final int noOfPax;
  final int qDays;
  final String airlines;
  final String paxName;
  final String agent;
  final String tNumber;
  final String tStatus;
  final String remarks;

  TravelRequest({
    required this.sn,
    required this.qId,
    required this.entryDate,
    required this.ledgerName,
    required this.purpose,
    required this.travelDate,
    required this.returnDate,
    required this.from,
    required this.to,
    required this.noOfPax,
    required this.qDays,
    required this.airlines,
    required this.paxName,
    required this.agent,
    required this.tNumber,
    required this.tStatus,
    required this.remarks,
  });
}
