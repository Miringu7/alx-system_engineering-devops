#!/usr/bin/env ruby
# expression must be only matching: capital letters

puts(ARGV[0].scan(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/).join(','))
