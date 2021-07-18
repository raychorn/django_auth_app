# Django Auth App

<!-- TOC -->

- [Django Auth App](#django-auth-app)
        - [Use Case](#use-case)
                - [Visitor does not have cookie with an auth ID token](#visitor-does-not-have-cookie-with-an-auth-id-token)
                - [Redirects to Django Auth App to authenticate the user.](#redirects-to-django-auth-app-to-authenticate-the-user)

<!-- /TOC -->

## Use Case

### Visitor does not have cookie with an auth ID (token)

### Redirects to Django Auth App to authenticate the user.

1. Payload is URL to redirect the visitor to once the user is Authenticated.
2. URL contains the domain, domain is used to control the users. Domain is a MongoDb Collection.
3. Once the user is Authenticated a token is generated and stored in the database collection for the domain.
4. Domain metadata specifies the authentication method. 1 factor (username + password), 2 factor (+ TOTP)
5. Token is stored in the cookie for the originating site.
6. Background process checks for expired logins, sessions are auto-expired after XX minutes of in activity.
7. REST API is used to track user activities.

