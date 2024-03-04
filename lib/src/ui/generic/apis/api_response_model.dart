class ApiResponse {
  ApiResponse({
    this.isSuccess = false,
    this.failReason,
    this.failReasonContent,
    this.successContents,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      isSuccess: json['isSuccess'],
      failReason: json['failReason'],
      failReasonContent: json['failReasonContent'],
      successContents: json['successContents'],
    );
  }
  bool isSuccess;
  dynamic failReason;
  String? failReasonContent;
  dynamic successContents;
}
