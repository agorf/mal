module Printer
  def self.pr_str(object)
    case object
    when Symbol, Integer
      object.to_s
    when Array
      "(#{object.map { |o| pr_str(o) }.join(' ')})"
    end
  end
end
