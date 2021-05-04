const { environment } = require('@rails/webpacker')

// Bootstrap 4 has a dependency over jQuery & Popper.js:
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
const aliasConfig = {
    'jquery': 'jquery-ui-dist/external/jquery/jquery.js',
    'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
};
environment.config.set('resolve.alias', aliasConfig);
module.exports = environment
