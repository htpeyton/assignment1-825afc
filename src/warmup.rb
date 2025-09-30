def fib(n)
    return [] if n <= 0
    return [0] if n == 1
    
    result = [0, 1]
    (2...n).each do |i|
        result << result[i-1] + result[i-2]
    end
    result
end

def isPalindrome(n)
    n.to_s == n.to_s.reverse
end

def nthmax(n, a)
    return nil if n < 0 || n >= a.length
    a.sort.reverse[n]
end

def freq(s)
    return "" if s.empty?
    
    char_count = Hash.new(0)
    s.each_char { |char| char_count[char] += 1 }
    
    char_count.max_by { |char, count| count }[0]
end

def zipHash(arr1, arr2)
    return nil if arr1.length != arr2.length
    arr1.zip(arr2).to_h
end

def hashToArray(hash)
    hash.to_a
end
