require "irb/completion"
require "irb/ext/save-history"

IRB.conf[:SAVE_HISTORY] = 100_000
IRB.conf[:HISTORY_FILE] = "#{ENV["HOME"]}/.irb-save-history"

IRB.conf[:PROMPT][:CUSTOM] = IRB.conf[:PROMPT][:SIMPLE]

if defined? Rails
  env_prefix =
    if Rails.env.production?
      "\e[41;97;1m prod \e[0m "
    else
      "\033[32m#{Rails.env}\033[0m "
    end

  IRB.conf[:PROMPT][:CUSTOM] = IRB.conf[:PROMPT][:CUSTOM].merge(
    :PROMPT_I => env_prefix + IRB.conf[:PROMPT][:CUSTOM][:PROMPT_I]
  )
end

IRB.conf[:PROMPT_MODE] = :CUSTOM
