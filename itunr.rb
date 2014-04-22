#!/usr/bin/env ruby
require 'bundler'
require 'uri'
require 'fileutils'
Bundler.require

ITUNES_DIR = "#{ENV['HOME']}/Music/iTunes"
LIBRARY_FILE = File.join ITUNES_DIR, 'iTunes Music Library.xml'
LIBRARY_DATA_FILE = File.join ITUNES_DIR, 'iTunes Library.itl'

lib = Plist::parse_xml LIBRARY_FILE

valid_files = lib['Tracks'].select do |track, data|
	filepath = data['Location']
	# decode file path, which is encoded as a URI, not very file-system friendly
	file = URI.decode filepath
	# normalize file path by pruning URI info
	file = file.sub(/file:\/\/localhost/, '')
	# check to see if file has been removed or not, the condition for 'select'
	File.exist? file
end

missing_track_count = lib['Tracks'].size - valid_files.size
lib['Tracks'] = valid_files # remove deleted files from library tracklist

if File.exist? LIBRARY_DATA_FILE
	FileUtils.cp LIBRARY_DATA_FILE, "#{LIBRARY_DATA_FILE}.backup" # backup library file
	FileUtils.rm LIBRARY_DATA_FILE # delete actual library file, prompting a rebuild from plist
else
	abort 'ERROR - missing iTunes Library file.'
end

if File.exist? LIBRARY_FILE
	FileUtils.cp LIBRARY_FILE, "#{LIBRARY_FILE}.backup" # backup library plist
	FileUtils.rm LIBRARY_FILE
else
	abort 'ERROR - missing iTunes Library plist.'
end

IO.write LIBRARY_FILE, lib.to_plist # replace library plist file with purged plist

puts "Cleaned #{missing_track_count} missing file records from iTunes Library."
nil # suppress output