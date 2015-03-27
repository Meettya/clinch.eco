###
Test suite for addon
###
_     = require 'lodash'
fs    = require 'fs'
path  = require 'path'
vm    = require 'vm'

lib_path = GLOBAL?.lib_path || ''

fixtures       = path.join __dirname, "fixtures"
fixturesOk     = path.join fixtures,  "component.eco"
fixturesErr    = path.join fixtures,  "with_error.eco"

results = 
  ok : '<div class="message"><p>Hello Bender!!!</p></div>'

# get addon
adon_file  = 'addon'
addon_path = path.join lib_path, adon_file
Compiller  = require addon_path

READ_OPTIONS = encoding : 'utf8'

describe 'Addon:', ->

  describe 'itself', ->

    it 'should export "extension" and "processor"', ->
      expect(Compiller).to.have.all.keys ['extension', 'processor']

    it 'should export string as "extension"', ->
      expect(Compiller.extension).to.be.a 'string'

    it 'should export function as "processor"', ->
      expect(Compiller.processor).to.be.a 'function'

  describe 'as addon', ->

    it 'should export correct file extension ".eco"', ->
      expect(Compiller.extension).to.equal '.eco'

    it 'should compile correct .eco file', (done) ->
      fs.readFile fixturesOk, READ_OPTIONS, (err, data) ->
        expect(err).to.be.null
        expect(data).to.be.a 'string'
        Compiller.processor data, fixturesOk, (err, code) ->
          expect(err).to.be.null
          expect(code).to.be.a 'string'
          #console.log code
          # test result
          vm.runInNewContext code, sandbox = { module:exports:null }
          ecoTmpl   = sandbox.module.exports
          ecoHtml   = ecoTmpl name : 'Bender'
          #console.log ecoHtml
          expect(ecoHtml).to.equal results.ok

          done()

