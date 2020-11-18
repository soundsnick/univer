# Input and init
print "Type in your n: "
@n = gets.chomp.to_f
@deltaX = 1.0/@n 

# Functions
@x = ->(i, deltaX) { i * deltaX }
@deltaR = ->(x, deltaX) { (
        ((-12)*Math.sin(4*x)) - 
        (
            (3*Math.cos(4*(x+deltaX)) - 
            (3*Math.cos(4*x))
        )/deltaX)
    ).abs }
@deltaL = ->(x, deltaX) { (
        ((-12)*Math.sin(4*x)) -
        (
            (3*Math.cos(4*x)) - 
            (3*Math.cos(4*(x-deltaX)))
        )/deltaX
    ).abs }

# Calculating MR and ML iteratively
@mr = (0..@n-1).inject(0.0) { 
    |accumulator, n| 
        accumulator + @deltaR.call(
                    @x.call(n, @deltaX), 
                    @deltaX)/@n 
    }
@ml = (1..@n).inject(0.0) { 
    |accumulator, m| 
        accumulator + @deltaL.call(
                    @x.call(m, @deltaX), 
                    @deltaX)/@n
    }

puts "ML: #{@ml}", "MR: #{@mr}"
