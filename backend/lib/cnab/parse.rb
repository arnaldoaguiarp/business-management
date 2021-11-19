module Cnab
    class Parse
        def initialize(file)
            @line_reading = File.read(file).split("\n")
        end

        def to_atrributes
            @line_reading.map do |line_reading| {
                categorycode: line_reading.slice(0,1),
                occurrencetime: DateTime.parse(line_reading.slice(1,8) + line_reading.slice(42,6)),
                value: line_reading.slice(9,10).to_i / 100,
                recipient_attributes: {
                    individualregistration: line_reading.slice(62,19).strip(),
                    card: line_reading.slice(40,14).strip()
                }
                store_attributes: {
                    storename: line_reading.slice(62,19).strip()
                    storeowner: line_reading.slice(49,14).strip()
                }
            }
            end
        end
    end
end