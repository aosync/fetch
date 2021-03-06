user, term, shell = ENV.values_at("USER", "TERM", "SHELL")
host = File.read("/etc/hostname").strip
kernel = File.read("/proc/version").split[2]
tasks = Dir.entries("/proc").count { |x| x.to_i != 0 }

mem = File.read("/proc/meminfo").lines.first 3
total, _, avail = mem.map { |x| x.split[1].to_i / 1000 }

uptime = File.read("/proc/uptime").split(".")[0].to_i
d = uptime / 60 / 60 / 24
h = uptime / 60 / 60 % 24
m = uptime / 60 % 60

print "#{user}@#{host}
kernel\t#{kernel}
term\t#{term}
shell\t#{shell}
tasks\t#{tasks}
mem\t#{avail}m / #{total}m
uptime\t#{d}d #{h}h #{m}m"
