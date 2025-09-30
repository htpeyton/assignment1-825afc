require 'set'

class PhoneBook
    def initialize
        @entries = {}  # Hash mapping names to {number: string, is_listed: boolean}
        @listed_numbers = Set.new  # Set of numbers that are listed (for uniqueness check)
    end

    def add(name, number, is_listed)
        # Check if name already exists
        return false if @entries.key?(name)
        
        # Validate phone number format: NNN-NNN-NNNN
        return false unless number.match?(/^\d{3}-\d{3}-\d{4}$/)
        
        # Check if number is already listed and trying to add as listed
        if is_listed && @listed_numbers.include?(number)
            return false
        end
        
        # Add the entry
        @entries[name] = {number: number, is_listed: is_listed}
        
        # Track listed numbers for uniqueness
        if is_listed
            @listed_numbers.add(number)
        end
        
        true
    end

    def lookup(name)
        entry = @entries[name]
        return nil unless entry && entry[:is_listed]
        entry[:number]
    end

    def lookupByNum(number)
        @entries.each do |name, entry|
            if entry[:number] == number && entry[:is_listed]
                return name
            end
        end
        nil
    end

    def namesByAc(areacode)
        result = []
        @entries.each do |name, entry|
            if entry[:number].start_with?(areacode + "-")
                result << name
            end
        end
        result
    end
end
