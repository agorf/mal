require './reader'
require './printer'

def READ(expr)
  Reader.read_str(expr)
end

def EVAL(expr)
  expr
end

def PRINT(expr)
  Printer.pr_str(expr)
end

def rep(expr)
  PRINT(EVAL(READ(expr)))
end

loop do
  print 'user> '

  input = gets

  break if input.nil?

  puts rep(input)
end
