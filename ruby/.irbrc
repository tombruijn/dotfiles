require "irb/completion"
require "irb/ext/save-history"

IRB.conf[:SAVE_HISTORY] = 100_000
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb-save-history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
