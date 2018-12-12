# Author: Roman Schmidt, Daniel Osterholz

class Foo
  BAR = '1'

  def bar
    puts BAR
  end
end

class Bar < Foo
  BAR = '2'

  def bar
    super
    puts BAR
  end
end

bar1 = Bar.new
bar2 = Bar.new

BAR = 'foo' # sonst raise in puts BAR dadrunter

def bar1.bar
  super
  puts BAR
end

class << bar2
  #BAR = '3' # redefine const

  def bar
    super
    puts BAR
  end
end

bar3 = Bar.new

bar1.bar
puts '____________'
bar2.bar
puts '____________'
bar3.bar