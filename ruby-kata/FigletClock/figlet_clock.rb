require_relative '../Figlet/figlet'
require_relative '../VerbalTime/verbal_time'

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

          Thread.new { say_verbal_time if os_is_mac? }

          sleep 1
        end

      end
    end
  end

  private

  def os_is_mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def say_verbal_time
    if (round_quartely_time?)
      verbal_time_phrase = VerbalTime.new.verbal_time(Time.now.strftime('%I:%M'))
      system "osascript -e 'say \"#{verbal_time_phrase}\"'"
    end
  end

  def round_quartely_time?
    seconds_now = Time.now.strftime('%S').to_i
    minutes_now = Time.now.strftime('%M').to_i

    seconds_now == 0 && (minutes_now == 00 || minutes_now == 15 || minutes_now == 30 || minutes_now == 45)
  end

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