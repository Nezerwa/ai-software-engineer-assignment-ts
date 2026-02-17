# EXPLANATION.md

## What was the bug?

The bug was that the `HttpClient` did not refresh the OAuth2 token or set the Authorization header when `oauth2Token` was a plain object instead of an instance of `OAuth2Token`. This caused the test case for "api=true refreshes when token is a plain object" to fail, as the Authorization header was missing.

## Why did it happen?

The original implementation only checked for null tokens and expired `OAuth2Token` instances. It missed the case where `oauth2Token` could be a plain object, which is not an instance of `OAuth2Token` and should be treated as invalid or expired.

## Why does your fix solve it?

My fix updates the condition to refresh the token whenever `oauth2Token` is null, not an instance of `OAuth2Token`, or expired. This ensures that any plain object or invalid token triggers a refresh, so the Authorization header is always set correctly for API requests.

## One realistic case / edge case your tests still don’t cover

The tests do not cover the scenario where `oauth2Token` is set to an unexpected type (e.g., a string, number, or array). In such cases, the client will refresh the token, but this behavior is not explicitly tested.
