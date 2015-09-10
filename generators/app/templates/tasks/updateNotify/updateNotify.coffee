notify         = require('../utils').notify
updateNotifier = require 'update-notifier'
shell          = require 'shelljs'
yorc = require '../../.yo-rc.json'

module.exports = ->
	return unless yorc

	notifier = updateNotifier
		pkg:
			name: 'generator-fatarrow'
			version: yorc['generator-fatarrow'].version
		updateCheckInterval: 1000 * 60 * 60 * 24

	notifier.notify()
	if notifier.update?.latest
		notify "Fatarrow update available: #{notifier.update.latest} (current #{notifier.update.current})", false
