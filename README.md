# Evolved NPM to ASP packages bundler

## What is it?

It's a package bundler made by nagaozen that makes possible for you to leverage
your favorite node.js libraries to power your ASP (Active Server Pages)
application.

## Who is this for?

The main target audience for this project are fullstack Active Server Pages 3.0
(Classic ASP) developers with a decent notion of node.js and webpack.

## Why does this exists?

With the growing up of node.js community in the last years, many good libraries
are becoming available through the npm utility. This pre-configured webpack
project make it a breeze to exports those packages and make it available to ASP.

## How to use it?

With node.js already installed, it's very straight forward. Just run:

```sh
$ npm start
```

This will ensure your environment get automaticaly configured. When it concludes,
you should use `npm i -D <package>` as you normally do for your frontend
development. _e.g._:

```sh
$ npm i -D accounting-js
```

Whenever you feel happy with your packages, *edit* `./src/index.js` adding your 
library into `window.npm2asp` object:

```js
window.npm2asp = {

.
.
.

	accounting: require("accounting-js")

};

```

Then, build your project:

```sh
$ npm run build
```

This will update the files under `./dist/` folder. Now, copy'em to your
`domain.com/lib/` folder and use the ASP Server-Side Include directive to make
the libraries available to the server environment.
