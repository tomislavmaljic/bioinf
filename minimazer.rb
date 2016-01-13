
def remove_duplicates(array)
  dup_array = []
  for str in array
    if (dup_array.length == 0 or dup_array[-1] != str)
      dup_array.push(str)
    end
  end
  return dup_array
end

def left_end(str, k, l)
  array = []
  (k..l).each do |i|
    array.push(min_substring(str[0..i], k))
  end
  return array
end

def right_end(str, k, l)
  array = []
  (0..(l-k)).each do |i|
    array.push(min_substring(str[i..l], k))
  end
  return array
end

def min_substring (str, k)
  array = []
  (0..(str.length-k+1)).each do |i|
    array.push(str[i..(i+k)])
  end
  array.sort
  return array[0]
end

#main
#initialization
input_name = ARGV[0]
w = ARGV[1].to_i
k = ARGV[2].to_i
l = w + k - 1
start = Time.now
inputFile = File.open(input_name, "r")
input = inputFile.read.gsub("\n","").gsub("\r","")
inputFile.close

minimazers = []



for str in left_end(input[0..l], k, l)
  minimazers.push(str)
end

(0..(input.length-l+1)).each do |m|
  minimazers.push(min_substring(input[m..(m+l)], k))
end

for str in right_end(input[(input.length-l+1)..(input.length+1)], k, l)
  minimazers.push(str)
end

minimazers = remove_duplicates(minimazers)

outputFile = File.open("output.txt", "w")
  minimazers.each do |m|
	   outputFile.puts m
  end
outputFile.close

finish = Time.now

total_time = finish - start
puts "Total time elapsed: " + total_time.to_s + " seconds"

total_memory = `ps -o rss -p #{$$}`.strip.split.last.to_i
puts "Total memory usage: " + total_memory.to_s + "KB."
