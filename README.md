[![Dependency Status](https://gemnasium.com/Meettya/clinch.eco.svg)](https://gemnasium.com/Meettya/clinch.eco)
[![Build Status](https://travis-ci.org/Meettya/clinch.eco.svg?branch=master)](https://travis-ci.org/Meettya/clinch.eco)

# clinch.eco

This is external addon for [clinch](https://github.com/Meettya/clinch) - CommonJS to browser packer to support ```.eco``` template files.

## How to use

    Clinch = require 'clinch'
    clinch_eco = require 'clinch.eco'

    # create packer object
    packer = new Clinch runtime : on
    # add plugin (chainable)
    packer.addPlugin clinch_eco

For more information see main module documentation.
