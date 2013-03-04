# OAuth Examples for the Asana API

Examples of how to use OAuth to access the Asana API

## Running the examples

This repository will contain examples in several different languages and frameworks to help you get started. (Currently, we only have an example ruby app in sinatra, but more to follow.) Here are the steps you need to follow to try them out:

### Getting the code

```bash
git clone https://github.com/Asana/oauth-examples.git
cd oauth-examples/
cp .env.example .env
```

### Creating an application

Visit [the Apps tab of your Account Settings in Asana](https://app.asana.com/-/account_api) and create an application. Name it whatever you like, but be sure to enter the right URLs. For this example, let's assume you're going to run the examples on `http://localhost:5000`.  You'll want to enter the Redirect URL `http://localhost:5000/auth/asana/callback`.  After you've created it, copy the client ID and client secret - you'll need them in the next step.

### Starting the app

Edit the `.env` file and enter your client ID and secret key, which you obtained in the previous step. (You can also change the port that the process will run on, default 5000).

To actually run an app (e.g. the ruby example) you would type:

```bash
./start ruby
```

Every example will be run with the same command: `./start $SUBDIR`.

## Under the hood

So how does OAuth with Asana work exactly? What is it these examples do, and how precisely would you implement it yourself?

Obviously, a working knowledge of the OAuth 2.0 spec (we're using [Draft 31](http://tools.ietf.org/html/draft-ietf-oauth-v2-31)) is useful. If you're familiar with the spec — or intend to use an out-of-the-box OAuth 2.0 library rather than hand-coding it — all you need to know is this:

### Quick Reference

1. The endpoint for user authorization is `http://app.asana.com/-/oauth_authorize`
2. The endpoint for token exchange is `http://app.asana.com/-/oauth_token`
3. Applications can be created from the "Apps" tab of your account settings, where you will find your Client ID and Client Secret.
4. We support both the Authorization Code Grant flow, and the Implicit Grant flow.

### Authorization Code Grant

To actually implement the Authorization Code Grant flow (the most typical flow for most applications), there are basically three steps:

1. Redirect a user to the authorization endpoint so that they can approve access of your app to their Asana account
2. Receive a redirect back from the authorization endpoint with a **code** embedded in the parameters
3. Exchange the code for a **token** via the token exchange endpoint

The token that you have at the end can be used to make calls to the Asana API on the authorizing user's behalf.

### Implicit Grant

The implement the Implicit Grant flow, which is suitable for in-browser web apps in JavaScript or other applications that might have difficulty making arbitrary HTTP POST requests to the token exchange endpoint, there are only two steps:

1. Redirect a user to the authorization endpoint so that they can approve access of your app to their Asana account
2. Receive a redirect back from the authorization endpoint with a **token** embedded in the *fragment* portion (the bit following the `#`) of the URL.

This token can then be used to access the API, in this case typically using JSONP.

## Feedback

Please send any feedback to ...

## MIT License

All examples copyright (c) 2013 Asana, Inc.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
