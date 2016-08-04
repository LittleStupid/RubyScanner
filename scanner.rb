require 'socket'

def open_port(host, port)
  sock = Socket.new(:INET, :STREAM)
  raw = Socket.sockaddr_in( port, host.to_s)
begin
  puts "#{port} alive." if sock.connect(raw)
rescue => e
  #puts "error: #{e}"
end
end

def main( host, start_port, end_port )
  port = start_port
  until port == end_port
    open_port(host, port)
    port += 1
  end
end

main ARGV[0],ARGV[1].to_i,ARGV[2].to_i
