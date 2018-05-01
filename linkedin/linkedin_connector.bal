import ballerina/http;
import ballerina/mime;


documentation {Object for linkedin endpoint.
    F{{httpClient}} HTTP client endpoint
}
public type LinkedinConnector object {
    public {
        http:Client httpClient;
    }

    documentation {Returns a list of user records if found or error if any error occured
        P{{format}} - Required output format
        P{{companyId}} - ID of the company profile
        R{{}} - If success, returns list of User objects, else returns error object
    }
    public function isSharingEnabled(string format, string companyId) returns (boolean|error);
};

public function LinkedinConnector::isSharingEnabled(string format, string companyId) returns (boolean|error){
    endpoint http:Client httpEP = self.httpClient;
    http:Request request = new();

    string s = LINKEDIN_COMPANY_ENDPOINT + companyId + "/" + LINKEDIN_RELATION_TO_VIEWER + "/" +
                LINKEDIN_COMPANY_IS_SHARE_ENABLED + "?" + LINKEDIN_FORMAT + "=" + format;
    var res = httpEP->get(s, request = request);
    match res {
        error err => return err;
        http:Response response => {
            var received = resolveResponse(response, format);
        }
    }
}
