require 'pry'

a, b, c, tmax = 1.0, 3.0, 0.8, 5.0
nt, nx = 30, 30

@fx = ->(x) { (Math::E**x)*Math::sin(3*x) }
@deltax = ->(a, b, nx) { (b-a)/nx }
@deltat = ->(tmax, nt) { tmax/nt }

uapp_first = Array.new(nx) { Array.new(nx) { 0 } }
uapp_second = Array.new(nx) { Array.new(nx) { 0 } }
uapp_third = Array.new(nx) { Array.new(nx) { 0 } }
uapp_fourth = Array.new(nx) { Array.new(nx) { 0 } }

sum_first, sum_second, sum_third, sum_fourth = 0, 0, 0, 0

uex = Array.new(100) { Array.new(100) { 0 } }
x, t = Array.new(100) { 0 }, Array.new(100) { 0 }

0.upto(nx-1) do |i|
    x[i] = a+(i*@deltax.(a, b, nx))
    t[i] = i*@deltat.(tmax, nt)
    0.upto(nx) do |j|
        uex[i][j] = @fx.(x[i]-c*t[j])
    end

    uapp_first[i][0] = @fx.(x[i])
    uapp_second[i][0] = @fx.(x[i])
    uapp_third[i][0] = @fx.(x[i])
    uapp_fourth[i][0] = @fx.(x[i])

    if i > nx-2
        sum_first += (uex[i][1] - uapp_first[i][1]).abs
        sum_second += (uex[i][1] - uapp_second[i][1]).abs
        sum_third += (uex[i][1] - uapp_third[i][1]).abs
        sum_fourth += (uex[i][1] - uapp_fourth[i][1]).abs
    end
end

ma_first = sum_first/nx
ma_second = sum_second/nx
ma_third = sum_third/nx
ma_fourth = sum_fourth/nx

puts "Math. expectation for 1st method: #{ma_first}"
puts "Math. expectation for 2nd method: #{ma_second}"
puts "Math. expectation for 3rd method: #{ma_third}"
puts "Math. expectation for 4th method: #{ma_fourth}"