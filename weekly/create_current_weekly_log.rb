require "date"
today = Date.today
week_start = today - (today.wday - 1)
week_end = week_start + 6
week_start_str = week_start.strftime("%Y%m%d")
week_end_str = week_end.strftime("%Y%m%d")

fname = week_start_str + ".md"
p "create #{fname}"

text = <<EOS
# weekly
## #{week_start_str}-#{week_end_str}

# daily
#{
(0..6).to_a.map do |idx|
    "## #{(week_start+idx).strftime("%Y%m%d")}\n"
end.join("\n")
}
EOS

File.open(fname, "w") do |f|
    f.puts text
end

