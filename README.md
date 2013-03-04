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

Edit the `.env` file and enter your client ID and secret key, which you obtained in the previous step.

To actually run an app (e.g. the ruby example) you would type:

```bash
ruby/start.sh
```

Every example will be run with the same command: `$SUBDIR/start.sh`.

## Feedback

Please send any feedback to ...
