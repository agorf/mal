class Reader
  TOKENS_RE = /[\s,]+|~@|[\[\]{}()'`~^@]|"(?:\\.|[^\\"])*"?|;.+|[^\s\[\]{}('"`,;)]+/.freeze

  def self.read_str(str)
    tokens = tokenize(str)
    reader = new(tokens)
    read_form(reader)
  end

  def self.tokenize(str)
    str.scan(TOKENS_RE).reject { |token| token =~ /\s+/ }
  end

  def self.read_form(reader)
    if reader.peek == '('
      read_list(reader)
    else
      read_atom(reader)
    end
  end

  def self.read_list(reader)
    reader.next # Consume ( that brought us here

    list = []

    loop do
      object = read_form(reader)

      break if object == ')' || object.nil?

      list << object
    end

    list
  end

  def self.read_atom(reader)
    case (token = reader.next)
    when /\A-?\d+\z/
      token.to_i
    when %r{\A[-+*>a-z0-9/]+\z}
      token.to_sym
    end
  end

  def initialize(tokens = [])
    @tokens = tokens
    @token_pos = 0
  end

  def peek
    @tokens[@token_pos]
  end

  def next
    peek.tap do
      @token_pos += 1
    end
  end
end
