user, term, shell = ENV.to_h.select("USER", "TERM", "SHELL").values
host = System.hostname
kernel = File.read("/proc/version").split[2]
tasks = Dir.entries("/proc").count { |x| x.to_i? }

mem = File.read("/proc/meminfo").lines.first 3
total, _, avail = mem.map { |x| x.split[1].to_i // 1000 }

uptime = File.read("/proc/uptime").split[0].to_f
d = (uptime / 60 / 60 / 24).to_i
h = (uptime / 60 / 60 % 24).to_i
m = (uptime / 60 % 60).to_i

puts "#{user}@#{host}
kernel\t#{kernel}
term\t#{term}
shell\t#{shell}
tasks\t#{tasks}
mem\t#{avail}m / #{total}m
uptime\t#{d}d #{h}h #{m}m"
