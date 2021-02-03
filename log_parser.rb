class LogParser
  def initialize(file_path)
    @file = File.open(file_path)
    @paths = {}
  end

  attr_reader :file, :paths

  def parse
    file.each do |line|
      line_splitted = line.split(' ')
      path = line_splitted.first
      ip = line_splitted.last
      
      if paths.keys.include?(path)
        key = paths[path]
        key[:visits] += 1
        unless key[:ips].include?(ip)
          key[:ips] << ip
        end
      else
        paths[path] = { visits: 1, ips: [ip] }
      end
    end
  end

  def paths_sorted_by_visits
    sorted_by_visits = paths.sort_by { |_key, value| value[:visits] }.reverse
    sorted_by_visits.map { |element| "#{element[0]} #{element[1][:visits]} visits" }
  end

  def paths_sorted_by_unique_visits
    sorted_by_ip_count = paths.sort_by { |_key, value| value[:ips].length }.reverse
    sorted_by_ip_count.map { |element| "#{element[0]} #{element[1][:ips].length} unique visits"}
  end
end
