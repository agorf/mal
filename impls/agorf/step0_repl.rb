def READ(expr)
  expr
end

def EVAL(expr)
  expr
end

def PRINT(expr)
  expr
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
