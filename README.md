# Domo To Teams Webhook Relay

Contains an example function written in Lua to receive a Domo alert webhook and reshape the payload to work with a Microsoft Teams weebhook connector.

1. Create an alert on a Domo card or dataset
1. Create an account in [Webhook Relay](https://webhookrelay.com/)
1. Create a Webhook Relay function using the Lua code snippet in this repository
1. Create a Webhook Relay request forwarder and run the function on the incoming request
1. Configure a webhook connector in the desired Microsoft Teams channel and copy the URL
1. Paste the Teams webhook URL into the Webhook Relay forwarding destination
1. Copy the Webhook Relay public endpoint URL and and paste it into the Domo alert's webhook URL (method should be POST)
1. Send a test from the Domo alert (alert title should be present, but the message will be blank)

# Flow
Domo alert ----> Webhook Relay ----> Microsoft Teams
