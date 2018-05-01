import ballerina/test;
import ballerina/io;


endpoint Client linkedinEP {
    clientConfig:{
        auth:{
            scheme:"oauth",
            accessToken:"<access_token>"
        },
        url:"https://api.linkedin.com"
    }
};

@test:Config
function testIsSharingEnabled() {
    var sharingEnabled = linkedinEP->isSharingEnabled("28600911");
    match sharingEnabled {
        boolean x => test:assertTrue(x, msg = "isSharingEnabled() failed");
        error err => test:assertFail(msg = err.message);
    }
}

@test:Config
function testIsMeAdmin() {
    var sharingEnabled = linkedinEP->isMeAdmin("28600911");
    match sharingEnabled {
        boolean x => test:assertTrue(x, msg = "isMeAdmin() failed");
        error err => test:assertFail(msg = err.message);
    }
}