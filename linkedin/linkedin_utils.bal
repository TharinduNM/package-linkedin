import ballerina/http;

function resolveResponse(http:Response response, string format) returns (json|xml|error) {
    int statusCode = response.statusCode;
    if (statusCode == HTTP_OK) {
        if(format.equalsIgnoreCase("json")) {
            var payload = response.getJsonPayload();
            match payload {
                json j => return j;
                error err => return err;
            }
        }
        var payload = response.getXmlPayload();
        match payload {
            xml x => return x;
            error err => return err;
        }
    } if(format.equalsIgnoreCase("json")) {
        var payload = response.getJsonPayload();
        match payload {
            json j => {
                error Error = {};
                Error = {message:j.message.toString()};
                return Error;
            }
            error err => return err;
        }
    }
    var payload = response.getXmlPayload();
    match payload {
        xml x => {
            error Error = {};
            Error = {message:x.message.getTextValue()};
            return Error;
        }
        error err => return err;
    }
}