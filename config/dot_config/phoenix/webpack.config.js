const path = require('path')

module.exports = {
  mode: 'production',
  entry: './src/phoenix.ts',
  output: {
    path: path.resolve(__dirname, '.'),
    filename: 'phoenix.js',
  },
  resolve: {
    extensions: ['.ts', '.js'],
  },
  module: {
    rules: [{test: /\.ts$/, loader: 'ts-loader'}],
  },
}
