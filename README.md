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
