@a, @b, dlt, err = 1.0, 2.0, 100.0, 10.pow(-3)

print "Enter your N: "
n = gets.chomp.to_f

# Start execution time
@from = Time.now

# Define functions
@dltx = ->n { (@b-@a)/n }
@x = ->(i, dltx) { @a + (i*dltx) }
@y = ->x { 3*Math.cos(4*x) }
@yd = ->x { (-12)*Math.sin(4*x) }
@dlt = ->(yd, dy) { (yd - dy).abs }
@dy_first = ->(dltx, x) {
    (
        (3*Math.cos(
            4*(x+dltx))
        ) - (3*Math.cos(
            4*(x-dltx))
            )
    )/(2*dltx)
}
@dy_second = ->(dltx, x, y) { 
    (   
        (3*Math.cos(
            4*(x-(2*dltx))
            )
        ) - (12*Math.cos(
                4*(x-dltx))
            ) + (3 * y)
    )/(2 * dltx) 
}
@dy_third = ->(dltx, x, y) {
    (
        (3*Math.cos(
            4*(x-(2*dltx)))
            ) - (24*Math.cos(
                4*(x-dltx))
                ) + (24*Math.cos(
                    4*(x+dltx))
                    ) - (3*Math.cos(
                        4*(x+(2*dltx)))
                        )
    )/(12 * dltx)
}

tmp_n = n 
loop do 
    1.upto(n-1).each do |i|
        dlt = @dlt.(@yd.(@x.(i, @dltx.(n))), 
                    @dy_first.(@dltx.(n), @x.(i, @dltx.(n)))
                    )
    end
    if dlt < err 
        puts "First N: #{n}"
        break
    end
    break unless dlt >= err
    n = n + 1
end

n = tmp_n 
dlt = 100
loop do 
    2.upto(n).each do |i|
        dlt = @dlt.(@yd.(@x.(i, @dltx.(n))), 
                    @dy_second.(@dltx.(n), @x.(i, @dltx.(n)), @y.(@x.(i, @dltx.(n))))
                    )
    end
    if dlt < err 
        puts "Second N: #{n}"
        break
    end
    break unless dlt >= err
    n = n + 1
end

n = tmp_n 
dlt = 100
loop do 
    2.upto(n-2).each do |i|
        dlt = @dlt.(@yd.(@x.(i, @dltx.(n))), 
                    @dy_third.(@dltx.(n), @x.(i, @dltx.(n)), @y.(@x.(i, @dltx.(n))))
                    )
    end
    if dlt < err 
        puts "Third N: #{n}"
        break
    end
    break unless dlt >= err
    n = n + 1
end

# Finish execution
@to = Time.now 
puts "Execution time: #{@to-@from} seconds"