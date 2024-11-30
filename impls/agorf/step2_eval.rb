require './reader'
require './printer'

def READ(expr)
  Reader.read_str(expr)
end

def EVAL(ast, env)
  if ast.is_a?(Symbol)
    env[ast] || (raise "'#{ast}' not found")
  elsif ast.is_a?(Array) && !ast.empty?
    first, *rest = ast.map { EVAL(_1, env) }
    first.call(*rest)
  else
    ast
  end
end

def PRINT(value)
  Printer.pr_str(value)
end

def rep(expr)
  env = {
    :+ => ->(a, b) { a + b },
    :- => ->(a, b) { a - b },
    :* => ->(a, b) { a * b },
    :/ => ->(a, b) { a / b }
  }
  PRINT(EVAL(READ(expr), env))
end

loop do
  print 'user> '

  input = gets

  break if input.nil?

  puts rep(input)
end
