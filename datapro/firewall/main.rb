require_relative './core.rb'

def main
    packets = Core.parseIpPackets
    rules = Core.parseRules
    puts Core.stats(packets, rules)
end
main 