---
id: doc
title: Get started
sidebar_label: Get started
---

## Setup

Nothing fancy here, just install it directly from NPM into your project.

```
npm install --save paracord
```

or with yarn

```
yarn add paracord
```

## Simple usage

Load paracord on your file:
```
const { Paracord } = require('paracord');
```

Set token and create an instance of the bot or app:
```
const token = process.env.DISCORD_TOKEN; // better to use predefined configs or system ENV, do not store secrets with the code!
const bot = new Paracord(token);
```

To request Discord REST API you can call `request!` method on the bot instance:

```
bot.request!(method, path);
```

Full example:

```
const { Paracord } = require('paracord');

const token = process.env.DISCORD_TOKEN;
const bot = new Paracord(token);

const method = 'GET';
const path = '/channels/701411525872844873/messages'
const res = await bot.request!(method, path);
```
