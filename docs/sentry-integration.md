# How to setup sentry monitoring

Q-client supports sentry.io integration. Sentry is a service that helps you monitor and fix crashes in realtime.
If you are having issues with Q-client, Sentry’s error tracking software will help you identify and resolve them as
quickly as possible.

## How to setup sentry monitoring

1. Create an account on [sentry.io](https://sentry.io)
2. Create a new project and select the framework you are using (GO)
3. Copy the DSN string from the project settings page
4. Run q-client with the additional flags (you can add them to the *entrypoint* section of your docker-compose.yaml  :

```bash
  --sentry --sentry-dsn=<your DSN string>
```

Since you have set up flags and restarted Q-Client you will be able to receive notifications about critical/fatal
errors/set of blockchain-related errors (bad blocks, etc.). You can also set up alerts for specific errors. For more
information please visit [sentry.io](https://sentry.io)