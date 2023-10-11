class LoginRegisterModel {
  late Result? result;
  ReturnObject? returnObject;
  int? totalCount;

  LoginRegisterModel({this.result, this.returnObject, this.totalCount});

  LoginRegisterModel.fromJson(Map<String, dynamic> json) {
    result =
        json['Result'] != null ? new Result.fromJson(json['Result']) : null;
    returnObject = json['ReturnObject'] != null
        ? new ReturnObject.fromJson(json['ReturnObject'])
        : null;
    totalCount = json['TotalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    if (this.returnObject != null) {
      data['ReturnObject'] = this.returnObject!.toJson();
    }
    data['TotalCount'] = this.totalCount;
    return data;
  }
}

class Result {
  int? resultCode;
  String? resultMessage;

  Result({this.resultCode, this.resultMessage});

  Result.fromJson(Map<String, dynamic> json) {
    resultCode = json['ResultCode'];
    resultMessage = json['ResultMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResultCode'] = this.resultCode;
    data['ResultMessage'] = this.resultMessage;
    return data;
  }
}

class ReturnObject {
  String? token;
  String? expiresDate;

  ReturnObject({this.token, this.expiresDate});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    expiresDate = json['ExpiresDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    data['ExpiresDate'] = this.expiresDate;
    return data;
  }
}
