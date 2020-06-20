---
id: doc
title: doc
sidebar_label: Docs
---

## Setup

```
npm install paracord
```

## API

Simple usage:

```
const { Paracord } = require('paracord');

const token = process.env.DISCORD_TOKEN;
const bot = new Paracord(token);

const method = 'GET';
const path = '/channels/123456789'
const res = await bot.request!(method, path);
```
