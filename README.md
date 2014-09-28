# lpvs

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with lpvs](#setup)
    * [What lpvs affects](#what-lpvs-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with lpvs](#beginning-with-lpvs)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module provide lpvs for ubuntu and centos. works with puppet server 3.7.1

## Module Description

Module create directory in /opt/ and ships lpvs.pl, then installs the perl packages needed for the proper operation. 
Also it creates a crontab for scheduled runs. 

lpvs.pl and lpvs-scanner.pl used from:
https://github.com/lwindolf/lpvs

## Setup

### What lpvs affects

* RedHat family packages: perl-XML-LibXML perl-XML-LibXSLT perl-Crypt-SSLeay perl-LWP-Protocol-https
* Debian family packages: libxml-libxslt-perl

### Setup Requirements 

puppet server and zombie slaves :)

### Beginning with lpvs

In order script to work you'll need internet access.

## Usage

	include "lpvs"

## Limitations

This module works on ubuntu and centos instances  

## Development

Apache 2.0 License 

Whoever wants to contribure, just let me know. 
Module written to solve stupid package vuln update problems.

Optionally you could diff and mail the output to your box. /could be implemented in future versions/ 

## Release Notes/Contributors

Current version 0.0.1
Developed by: Vasil Petrov
