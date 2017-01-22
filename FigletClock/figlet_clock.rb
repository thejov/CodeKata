require_relative '../Figlet/figlet'

class FigletClock

  def start_clock_switch_theme_after(seconds)
    while true do

      color = GREEN

      fonts.each do |font|

        color = color == GREEN ? RED : GREEN

        figlet_clock = FigletTime.new(font)
        good_heavens = figlet_clock.good_heavens

        seconds.times do
          system 'clear' or system 'cls'

          output = good_heavens + figlet_clock.time
          puts colorize(output, color)

          sleep 1
        end

      end
    end
  end

  private

  def fonts
    Dir["#{File.dirname(__FILE__)}/../Figlet/fonts/*.flf"].map { |path| File.basename(path, '.flf') }
  end

  RED = 31
  GREEN = 32

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

end

class FigletTime

  def initialize(font)
    @figlet = Figlet.new(font)
  end

  def time
    @figlet.write(Time.now.strftime('%H:%M:%S'))
  end

  def good_heavens
    @figlet.write('Good Heavens,') + "\n" + @figlet.write('Just Look At The Time!') + "\n"
  end

end

require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: figlet_clock.rb [options]'

  opts.on('-s', '--seconds seconds', 'Number of seconds between switching figlet theme.') do |seconds|
    options[:seconds] = seconds.nil? ? 5 : seconds.to_i
  end
end.parse!

FigletClock.new.start_clock_switch_theme_after(options[:seconds])