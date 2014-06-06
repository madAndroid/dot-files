require 'irb/completion'
require 'irb/ext/save-history'
#History configuration
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

@working_directory = Dir.pwd
@local_irbrc = File.join(@working_directory, '.irbrc')

if @working_directory != ENV['HOME']
  load @local_irbrc if File.exists?(@local_irbrc)
end

remove_instance_variable(:@working_directory)
remove_instance_variable(:@local_irbrc)
