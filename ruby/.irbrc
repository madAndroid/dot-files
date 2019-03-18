#!/usr/bin/ruby 
require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
require 'pp'

#begin
#  require 'wirble'
#  require 'hirb'
#rescue LoadError
#  puts 'ignoring wirble and hirb, load error'
#end

if defined? Wirble
  Wirble.init
  Wirble.colorize
end

if defined? Hirb
  Hirb::View.enable
end

#History configuration
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:EVAL_HISTORY] = 200

@working_directory = Dir.pwd
@local_irbrc = File.join(@working_directory, '.irbrc')

if @working_directory != ENV['HOME']
  load @local_irbrc if File.exists?(@local_irbrc)
end

remove_instance_variable(:@working_directory)
remove_instance_variable(:@local_irbrc)
