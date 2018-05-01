import ballerina/test;
import ballerina/io;


endpoint Client linkedinEP {
    clientConfig:{
        auth:{
            scheme:"oauth",
            accessToken:"AQWOlI-PGU68Ykp3yI5eKSBYAN0BFO1UMgXkFyLMBm_CNFDDaUsmhbK7Llk93XuLFd_bbhneB1VoGYWsrKMbSYe-W89_LQ9gJXRmxJF68CWJz3Mz9kixQrAFtAlaW9aSISIx6rodwCXY7edSKGI0EUL8wW6Ihu9LMyzFem6HxIOQZIqRolSbIuY_PAckypZdEIuks3Vog2BbwF5nJhW4Afd5cUXETmDTipXYlsVNiKAGytDlDGly_IWUoIi9PFR5jqlK62Y0DCyyYo4KwtCwabfPJPZACKX3pQ4E1VDRxYg5e5j6piJHpCQyY6cWY-d6ujmn4K0CKQFDYsGVKcsjaTDIPFTg2w"
        },
        url:"https://api.linkedin.com"
    }
};

@test:Config
function testIsSharingEnabled() {
    http:Response response = check linkedinEP->isSharingEnabled("json", "28600911");
    io:println(response);

    io:println(response.getJsonPayload()==true);
}