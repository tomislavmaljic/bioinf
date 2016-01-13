#initialization
input = ARGV[0]
w = int(ARGV[1])
k = int(ARGV[2])


#main
start = Time.now
inputFile = File.read(input).gsub("\n","").gsub("\r","")
