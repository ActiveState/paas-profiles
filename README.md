# Paas Profiles

*Making PaaS offerings comparable - Ecosystem profiles for PaaS vendors.*

<br/>
Currently 82 PaaS vendor profiles. Profiles are encoded as [JSON files](/profiles/).

For convenience, the profiles can be viewed via executing the [sinatra app](sinatra_profiles.rb).

**The current web interface can be viewed [online](http://paas-profiles.aws.af.cm/vendors).**

**Any errors? Important missing properties? Suggestions? [Contribute](#contribution)**

## Profile

The code below shows a sample profile. The profile specification is beta and the properties are subject to change.

```javascript
{
  "name": "SomePaas",
  "revision": "2013-07-02",
  "vendor_verified": false,
  "url": "http://someurl.com",
  "status": "production",
  "status_since": "2012-07-15",
  "type": "polyglot",
  "hosting": [
    "public"
  ],
  "pricing": [
		{ "model": "fixed", "period": "monthly" }
	],
  "scaling": {
    "vertical": true, "horizontal": true, "auto": false
  },
  "compliance": [
    "SSAE 16 Type II", "ISAE 3402 Type II"
  ],
  "runtimes": [
    { "language": "java", "versions": [ "1.7", "1.6" ] }
  ],
  "middleware" [
    { "name": "tomcat", "runtime": "java", "versions": [ "6.0.35" ] }
  ],
  "frameworks": [
	{ "name": "rails", "runtime": "ruby", "versions": [ "4.0.0" ] },
	{ "name": "django", "runtime": "python", "versions": [ "1.5.1" ] }
  ],
  "services": {
    "native": [
      { "name": "mongodb", "description": "", "type": "datastore", "versions": [ "1.8" ] }
    ],
    "addon": [
      { "name": "mongolab", "url": "https://mongolab.com/", "description": "", "type": "datastore" }
    ]
  },
  "extendable": false,
  "infrastructures": [
    { 
      "continent": "NA",
      "country": "US",
      "region": "Virginia",
      "provider": "AWS"
    }
  ]
}
```
### Name  

The official name of the PaaS offering.

### Revision

`Date` or `DateTime` of the profile's last update.
 
### Vendor Verification

This may be set to `true` if the profile was officially created or audited by the vendor.

### URL

The URL leading to the Paas' webpage.

### Status

The current status of the offering. This may be one of the following lifecycle stages:

`beta` = In private or public beta testing  
`production` = Live and generally available  
`eol` = Discontinued or integrated into another offering (End of life).  

### Status Since

`Date` of the last status transition.

### Type

Type of the PaaS. Currently allowed categories:

```
language-specific, polyglot, apaas
```

### Pricing

An array of all available billing options. If the PaaS is Open Source or no pricing is announced yet, the array should be empty.

#### Model

The pricing model of the PaaS. Currently allowed values:
```
fixed, metered, threshold
```
#### Period

The billing period. Currently allowed values:
```
monthly, annually
```

### Scaling

An object including three boolean properties for characterizing the scaling capabilities:

`vertical` = Can you scale the instance sizes, e.g. ram?  
`horizontal` = Can you scale the number of instances?  
`auto` = Is the PaaS capable of scaling any of the above properties automatically?    

### Hosting

An array that describes the different provided hosting styles of the PaaS.
Values can be `public` for a publicly hosted service and `private`for a service that can be deployed on premise, too.

### Compliance

Currently a simple array of compliance standard strings that are fulfilled by the PaaS.

### Runtimes

The runtimes an application can be written in. Defined as an array of objects.

```json
"runtimes": [
    { "language": "java", "versions": [ "1.7", "1.6" ] },
    { "language": "ruby", "versions": [ "1.9.3", "2.0.0" ] }
]
```

#### Language

This section must only include languages that are officially supported by the vendors.
Languages added via community buildpacks must not be added. Extensibility is modeled by the property *extenable*. 
In order to allow exact matching, the language keys are restricted. Currently allowed keys are:

```
apex, clojure, cobol, dotnet, erlang, go, groovy, haskell, java, lua, node, perl, php, python, ruby, scala
```

#### Versions

A string array containing the supported runtime versions.

### Middleware

*tbd*

An array of preconfigured middleware stacks.

```json
"middleware": [
    { "name": "tomcat", "versions": [ "6", "7" ] },
    { "name": "glassfish", "versions": [ "3.1" ] }
]
```

#### Name

Should be the official name in lowercase. Currently not restricted.

#### Versions

A string array containing the supported middleware versions.

### Frameworks

*tbd*

An array of preinstalled frameworks.

```json
"frameworks": [
    { "name": "rails", "versions": [ "4.0.0" ] },
    { "name": "django", "versions": [ "1.5.1" ] }
]
```

#### Name

Should be the official name in lowercase. Currently not restricted.

#### Versions

A string array containing the supported framework versions.

### Services

```json
"services": {
  "native": [
    { "name": "mongodb", type="", "description": "", "versions": [ "1.8" ] } // tbd
  ],
  "addon": [
    { "name": "mongolab", url="https://mongolab.com/", description="", type="" } // tbd
  ]
}
```

#### Native

#### Addon

#### Type

A category the service does fit in. Currently allowed keys are:
*tbd* Maybe make it an array of types. 

```
datastore, search, worker, analytics, payment, media, messaging, other, devops
```

### Infrastructures

The infrastructures an application can be deployed to. Defined as an array of objects.

```json
"infrastructures": [
    { 
      "continent": "EU",
      "country": "IE",
      "region": "Dublin",
      "provider": "AWS"
    }
]
```

#### Continent

The continent must be encoded with the following continent codes:

```
AF = Africa, AS = Asia, EU = Europe, NA = North America, OC = Oceania, SA = South America
```

#### Country

The country codes must conform to the codes defined in [ISO 3166-2](http://en.wikipedia.org/wiki/ISO_3166-2).

#### Region

The property region can be used to further specify the location of the datacenter. This field is freeform and may specify a region or even the city the datacenter is located in.

#### Provider

This optional field may specify the name of the external IaaS provider used by the PaaS vendor, e.g. *Amazon Web Services*.

## Authors

[Stefan Kolb](https://github.com/stefan-kolb)

## Contribution

I encourage **everyone** to submit corrections or additions in order to keep the profiles accurate and up-to-date.
In any case, please add evidence for the information so I can verify your changes.

I am also interested in direct **cooperation with vendors** in order to keep the profiles at first hand and spot-on. Contact me if you are interested to supply a [vendor verified profile](#vendor-verification).

Contribute either via [pull request](https://help.github.com/articles/using-pull-requests), create an [issue](https://github.com/stefan-kolb/paas-profiles/issues) or send me an [email](mailto:stefan.kolb@uni-bamberg.de).
