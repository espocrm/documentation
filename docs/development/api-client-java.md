# API Client implementation in Java

- [Installing](#installing)
- [Usage](#usage)

For the source code, refer to the GitHub repository [here](https://github.com/TheDutchMC/espocrm-java).

## Installing

[![Maven Central](https://img.shields.io/maven-central/v/dev.array21/espocrm-api-client.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22dev.array21%22%20AND%20a:%22espocrm-api-client%22)
[![Build Status](https://drone.k8s.array21.dev/api/badges/TheDutchMC/espocrm-java/status.svg)](https://drone.k8s.array21.dev/TheDutchMC/espocrm-java)

The client is available on the Maven Central repository.  
Minimum supported Java version: 11


Maven:
```xml
<dependency>
  <groupId>dev.array21</groupId>
  <artifactId>espocrm-api-client</artifactId>
  <version>VERSION</version>
</dependency>
```

Gradle:
```groovy
repositories {
    mavenCentral()
}

dependencies {
    implementation 'dev.array21:espocrm-api-client:VERSION'
}
```

## Usage
```java
import java.io.IOException;
import java.security.InvalidKeyException;

import dev.array21.espocrm.client.ClientBuilder;
import dev.array21.espocrm.client.EspoApiClient;
import dev.array21.espocrm.client.RequestException;
import dev.array21.espocrm.types.Where;
import dev.array21.espocrm.types.FilterType;
import dev.array21.espocrm.types.Method;
import dev.array21.espocrm.types.Params;

public class ExampleClass {
    public static void main(String[] args) {
        EspoApiClient client = new ClientBuilder()
            .setHost("YOUR ESPOCRM HOST")
            .setApiKey("YOUR ESPOCRM API KEY")
            .setSecretKey("YOUR ESPOCRM SECRET KEY")
            .build();

        Where[] whereFilter = new Where[] {
            new Where(FilterType.EQUALS, "SomeEspoCrmField").setValue("itMustBeEqualToThis")
        }

        Params requestParams = new Params()
            .setOffset(0)
            .setMaxSize(50)
            .setSelect("id")
            .setOrderBy("id")
            .setOrder(Order.DESC)
            .setWhere(whereFilter);

        try {
            String jsonResponse = client.requestGet("Account", requestParams);
        } catch(InvalidKeyException e) {
            e.printStackTrace();
        } catch(IOException e) {
            e.printStackTrace();
        } catch(RequestException e) {
            e.printStackTrace();
        }
    }
}
```
