###
This is separate Eco template for Clinch processor
###
Eco  = require 'eco'

extension = '.eco'

processor = (data, filename, cb) ->
  try
    content = Eco.precompile data
  catch error
    error.filename = filename
    return cb error

  cb null, "module.exports = #{content}"


module.exports = { extension, processor }
