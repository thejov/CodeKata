class Figlet

  def initialize(font = 'standard')
    @figlet_chars = parse_font_file(font)
  end

  def write(text)
    return 'Text should only contain ASCII characters.' unless text.ascii_only?

    text_as_figlet_chars = text.chars.map { |char| @figlet_chars[char] }
    concat_figlet_chars(text_as_figlet_chars)
  end

  def hardblank
    @hardblank
  end

  def height
    @height
  end

  def comment_line_count
    @comment_line_count
  end

  private

  def parse_font_file(font)
    font_filepath = "#{File.dirname(__FILE__)}/fonts/#{font}.flf"
    raise "Font '#{font}' could not be found." unless (File.exist?(font_filepath))

    lines = File.readlines(font_filepath)
    parse_header_line(lines.first)

    font_lines = skip_header_and_comment_lines(lines)
    @endmark = font_lines.first.strip.chars.last

    figlet_chars = {}
    remaining_font_lines = font_lines
    ascii_chars.each do |ascii_char|
      figlet_char = remaining_font_lines.take(height)

      figlet_chars[ascii_char] = remove_metacharacters(figlet_char)

      remaining_font_lines = remaining_font_lines.drop(height)
    end

    figlet_chars
  end

  def remove_metacharacters(figlet_char)
    figlet_char.map { |line| line.delete(@endmark).gsub(hardblank, ' ').gsub("\n", '') }
  end

  def concat_figlet_chars(text_as_figlet_chars)
    lines = []
    height.times do |line_number|
      lines << take_nth_line_of_all_figlet_chars(line_number, text_as_figlet_chars)
    end

    lines.join("\n")
  end

  def take_nth_line_of_all_figlet_chars(line_number, text_as_figlet_chars)
    line = text_as_figlet_chars.map { |figlet_char| figlet_char[line_number] }
    line.join
  end

  def skip_header_and_comment_lines(lines)
    lines.drop(comment_line_count + 1)
  end

=begin
Header line specification from: http://www.jave.de/docs/figfont.txt

The header line gives information about the FIGfont.  Here is an example
showing the names of all parameters:

          flf2a$ 6 5 20 15 3 0 143 229    NOTE: The first five characters in
            |  | | | |  |  | |  |   |     the entire file must be "flf2a".
           /  /  | | |  |  | |  |   \
  Signature  /  /  | |  |  | |   \   Codetag_Count
    Hardblank  /  /  |  |  |  \   Full_Layout*
         Height  /   |  |   \  Print_Direction
         Baseline   /    \   Comment_Lines
          Max_Length      Old_Layout*
=end
  def parse_header_line(header_line)
    header_line_params = header_line.split

    @hardblank = header_line_params[0][-1]
    @height = header_line_params[1].to_i
    @comment_line_count = header_line_params[5].to_i
  end

  def ascii_chars
    [' ',
     '!',
     '"',
     '#',
     '$',
     '%',
     '&',
     '\'',
     '(',
     ')',
     '*',
     '+',
     ',',
     '-',
     '.',
     '/',
     '0',
     '1',
     '2',
     '3',
     '4',
     '5',
     '6',
     '7',
     '8',
     '9',
     ':',
     ';',
     '<',
     '=',
     '>',
     '?',
     '@',
     'A',
     'B',
     'C',
     'D',
     'E',
     'F',
     'G',
     'H',
     'I',
     'J',
     'K',
     'L',
     'M',
     'N',
     'O',
     'P',
     'Q',
     'R',
     'S',
     'T',
     'U',
     'V',
     'W',
     'X',
     'Y',
     'Z',
     '[',
     '\\',
     ']',
     '^',
     '_',
     '`',
     'a',
     'b',
     'c',
     'd',
     'e',
     'f',
     'g',
     'h',
     'i',
     'j',
     'k',
     'l',
     'm',
     'n',
     'o',
     'p',
     'q',
     'r',
     's',
     't',
     'u',
     'v',
     'w',
     'x',
     'y',
     'z',
     '{',
     '|',
     '}',
     '~']
  end

end