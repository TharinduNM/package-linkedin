import ballerina/http;

documentation {LinkedIn Client Endpoint configuration object
    F{{clientConfig}} HTTP client endpoint configuration object
}
public type LinkedInConfiguration {
    http:ClientEndpointConfig clientConfig;
};

documentation {LinkedIn Client
    E{{}}
    F{{linkedInConfig}} LinkedIn client endpoint configuration object
    F{{linkedinConnector}} LinkedIn connector object
}
public type Client object {
    public {
        LinkedInConfiguration linkedInConfig = {};
        LinkedinConnector linkedinConnector = new;
    }

    documentation {Initialize the LinkedIn endpoint
        P{{linkedInConfig}} LinkedIn configuration object
    }
    public function init(LinkedInConfiguration linkedInConfig);

    documentation {Returns the connector that client code uses
        R{{}} - LinkedIn Client
    }
    public function getCallerActions() returns LinkedinConnector;
};

public function Client::init(LinkedInConfiguration linkedInConfig) {
    self.linkedinConnector.httpClient.init(linkedInConfig.clientConfig);
}

public function Client::getCallerActions() returns LinkedinConnector {
    return self.linkedinConnector;
}
