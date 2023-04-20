const { environment } = require('@rails/webpacker')
const coffee = require('./loaders/coffee')

environment.loaders.append('coffee', coffee)
