# generator-fatarrow
[![License][license-image]][license-url]
[![Version][version-image]][version-url]
[![Build Status][build-image]][build-url]
[![Dependency Status][dependencies-image]][dependencies-url]
> An [AngularJS](http://angularjs.org/) large application Reference Architecture

> <img src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/AngularJS_logo.svg/695px-AngularJS_logo.svg.png" height="100px" />

> <img src="http://www.jqueryscript.net/images/collective/gulp.js.png" height="100px" />
> <img src="http://bower.io/img/bower-logo.png" height="100px" />
> <img src="http://onesime.fr/images/yeoman.svg" height="100px" />
> <img src="http://jasmine.github.io/images/jasmine-horizontal.svg" height="100px" />
> <img src="http://pascalprecht.github.io/full-spectrum-testing-slides/styles/karma-logo.svg" height="100px" />
> <img src="http://pascalprecht.github.io/full-spectrum-testing-slides/styles/protractor-logo-large.png" height="100px" />

Build large [AngularJS](http://angularjs.org/) applications with [CoffeeScript](http://coffeescript.org/) - **without the ceremony** or write plain old JavaScript.


## Install
Install with [npm](https://npmjs.org/package/generator-fatarrow)

```bash
$ npm install -g generator-fatarrow
```


## Usage
Make a new directory, and `cd` into it:

```bash
$ mkdir my-project && cd $_
```

Create your app:

```bash
$ yo fatarrow
```

Run your app:

```bash
$ gulp
```


## Table of Contents
* [Install](#install)
* [Usage](#usage)
* [Generators](#generators)
	- [fatarrow](#fatarrow)
	- [fatarrow:feature](#fatarrowfeature)
* [Configuration](#configuration)
	- [Add Bower Component](#add-bower-component)
* [Supported Technologies](#supported-technologies)
* [Contributing](#contributing)
* [Changelog](#changelog)
* [License](#license)


## Generators


### fatarrow
Scaffold your app

```bash
$ yo fatarrow
```


### fatarrow:feature
Create a new feature

```bash
$ yo fatarrow:feature {featureName}
```

The following will create a feature named **login** within the **user** directory.

```bash
$ yo fatarrow:feature user/login
```


## Configuration
fatarrow is configured via a single file - `config.coffee`


### Add Bower Component
You need three pieces of information for each Bower component to include in your app.

1. The Bower component name (e.g. *restangular*)
2. The version of the component (e.g. *1.4.0*)
3. The files within the component to include in your app (e.g. *restangular.min.js*)

The following will include the **restangular** component, version **1.4.0**, and place the `dist/restangular.min.js` file in the `vendor/scripts` directory.  By default, all Bower components will be placed in the `vendor` directory.
```coffee
BOWER_COMPONENTS =
	'restangular': '1.4.0':
		scripts: 'dist/restangular.min.js'
```

If load order is important, include a reference to the file in the **SCRIPTS** section.

The following will ensure **restangular** is loaded prior to `app.js`.
```coffee
SCRIPTS =
	'**/angular.min.js'
	'**/restangular.min.js'
	'**/app.js'
	'**/*.js'
```

For AngularJS components, include a reference to the module within your application.  For example:
```coffee
angular.module('app', ['restangular']);
```


## Supported Technologies
Use your choice of scripting, styling, and templating technologies.


### Scripting
Your choice of scripting languages.

* <img src="http://drtom.ch/talks/2012/06/jazoon/images/coffeescript_logo.svg" height="100px" />

* **LiveScript** <img src="http://livescript.net/images/icon.png" height="16px" />

* <img src="http://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png" height="100px" />

* <img src="http://www.typescriptlang.org/content/images/logo_small.png" height="100px" />


### Styling
Your choice of styling languages.

* <img src="http://www.logotypes101.com/logos/194/830812341256B99B32E1A9F242BB9F5F/css3logo.png" height="100px" />

* <img src="http://moduscreate.com/wp-content/uploads/2012/01/less-css-logo.png" height="100px" />

* <img src="http://sass-lang.com/assets/img/logos/logo-235e394c.png" height="100px" />


### Templating
Your choice of templating engines.

* <img src="http://haml.info/images/haml.png" height="100px" />

* <img src="http://www.w3.org/html/logo/downloads/HTML5_Logo_512.png" height="100px" />

* <img src="http://jade-lang.com/public/images/logo.png" height="100px" />

* <img src="http://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Markdown-mark.svg/208px-Markdown-mark.svg.png" height="100px" />


## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md)


## Changelog
See [CHANGELOG.md](CHANGELOG.md)


## License
See [LICENSE](LICENSE)


[build-image]:            http://img.shields.io/travis/CaryLandholt/generator-fatarrow.svg?style=flat
[build-url]:              http://travis-ci.org/CaryLandholt/generator-fatarrow

[dependencies-image]:     http://img.shields.io/gemnasium/CaryLandholt/generator-fatarrow.svg?style=flat
[dependencies-url]:       https://gemnasium.com/CaryLandholt/generator-fatarrow

[license-image]:          http://img.shields.io/badge/license-MIT-blue.svg?style=flat
[license-url]:            LICENSE

[version-image]:          http://img.shields.io/npm/v/generator-fatarrow.svg?style=flat
[version-url]:            https://npmjs.org/package/generator-fatarrow