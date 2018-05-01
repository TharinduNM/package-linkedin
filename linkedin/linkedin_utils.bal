import ballerina/http;

function resolveResponse(http:Response response, string format) returns (json|xml) {
    int statusCode = response.statusCode;
    if (statusCode == HTTP_OK) {

    }
}