class Core 
    require 'json'

    def self.parseIpPackets
        JSON.parse(File.read('./store/database.json'))
    end

    def self.parseRules
        JSON.parse(File.read('./store/rules.json'))
    end

    def self.checkPacket(packet, rule)
        passed = true
        rule.keys.each do |n|
            next if rule[n] === "any" or packet[n].nil?
            if ['source_port', 'destination_port'].include?(n)
                begin
                    port = Integer(rule[n])
                    passed = (Integer(packet[n]) == port)
                    break if(!passed)
                rescue
                    passed = eval("#{packet[n]}#{rule[n]}")
                    break if(!passed)
                end
            else
                passed = (rule[n] == packet[n]) 
                break if(!passed)
            end
        end
        passed
    end

    def self.stats(packets, rules)
        rules.each_with_index.inject("ID ACTION PACKETS\n_________________\n") do |accumulator, (n, i)|
            "#{accumulator}\n#{i}  #{n['action'].upcase}  #{(packets.select { |m| checkPacket(m, n) }).length}"
        end
    end
end