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

Build large [AngularJS](http://angularjs.org/) applications with [CoffeeScript](http://coffeescript.org/) - **without the ceremony**.  By the way, you can write JavaScript too.


## Table of Contents
* [Installing](#installing)
* [Running](#running)
* [Generators](#generators)
* [Supported Technologies](#supported-technologies)
* [Contributing](#contributing)
* [Changelog](#changelog)
* [License](#license)


## Installing
Before running, you must install and configure the following one-time dependencies:

* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/)

Once the dependencies have been installed, enter the following in the terminal:
```bash
$ npm install -g generator-fatarrow
```

Make a new directory, and `cd` into it:
```bash
$ mkdir my-project && cd $_
```

Run `yo fatarrow`:
```bash
$ yo fatarrow
```


## Running
Enter the following in the terminal:
```bash
$ gulp
```


## Generators


### feature
```bash
$ yo fatarrow:feature {featureName}
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