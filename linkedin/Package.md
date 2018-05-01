Connects to LinkedIn API from Ballerina.

# Package Overview
 
The Linkedin connector allows you to sign in with LinkedIn, share on LinkedIn, manage company pages and add 
certifications and degrees to profiles through the REST API. It handles OAuth 2.0 authentication. 

**User Operations**

The `Tharindu/linkedin` package contains operations to check whether a given company profile is share enabled, and to 
check if the user an administrator. 

## Compatibility

|                                 |       Version                  |
|  :---------------------------:  |  :---------------------------: |
|  Ballerina Language             |   0.970.0                 |
|  LinkedIn API                       |  v1 |

## Sample
First, import the `Tharindu/linkedin` package into the Ballerina project.

```ballerina
import Tharindu/linkedin;
```
#### Obtaining Access Token to Run the Sample

1. Visit [LinkedIn Developers](https://developer.linkedin.com/docs) and create a connected app to obtain the Access 
Token.

```ballerina
endpoint Client scimEP {
   clientConfig:{
       auth:{
           scheme:"oauth",
           accessToken:"<your_access_token>"
       },
       url:url
   }
};
```

The `isSharingEnabled` function returns `true` if sharing is enabled in the given company profile

```ballerina
var response = linkedinEP->isSharingEnabled("<company_ID>");
match response {
    boolean b => io:println(b);
    error err => io:println(err);
}
```
The `isMeAdmin` function returns `true` if the currently authenticated user is the admin of the given company page.

```ballerina
var response = linkedinEP->isMeAdmin("<company_ID>");
match response {
    boolean b => io:println(b);
    error err => io:println(err);
}
```