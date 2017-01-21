require_relative 'figlet'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: figlets.rb [options] text'

  opts.on('-f', '--font FONT_NAME', 'Font name. The default font is "standard". ' +
      'All fonts should be in the "Figlet/fonts" folder') do |font|
    options[:font] = font
  end
end.parse!

figlet = options[:font].nil? ? Figlet.new : Figlet.new(options[:font])

puts figlet.write(ARGV.join(' '))
