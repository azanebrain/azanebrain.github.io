# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {

  # =================================
  # Template Data
  # These are variables that will be accessible via our templates
  # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

  templateData:
    # Specify some site properties
    site:
      # The production url of our website
      # url: "http://azanebrain.github.io"
      # url: "http://localhost:9778"

      # Here are some old site urls that you would like to redirect from
      # oldUrls: [
      #   'localhost:9778',
      #   'azanebrain.github.io'
      # ]

      # The default title of our website
      title: "azanebrain!"

      # Scripts
      scripts: [
        "bower_components/jquery/dist/jquery.min.js"
        , "bower_components/foundation/js/foundation.min.js"
        , "scripts/z.js"
      ]
  # =================================
  # Collections

  collections:
    news: -> 
      @getCollection("html").findAllLive({relativeOutDirPath: 'news'},[{date:-1}])

  # =================================
  # Plugins

  plugins:
    ghpages:
      deployRemote: 'origin'
      deployBranch: 'master'
    sass:
      outputStyle: 'compressed'

}

# Export the DocPad Configuration
module.exports = docpadConfig