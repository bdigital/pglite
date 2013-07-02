#
#  Poor man's postgresql adapter which relies on presence of psql only
#
class Pglite

  #
  # Load connection parameters
  #
  def initialize(conf)
    raise 'psql binary not in path' unless `which psql`.length > 0
    raise 'estabilishing a connection requires keys: host, port, username, database' if conf['host'].nil? || conf['port'].nil? || conf['username'].nil? || conf['database'].nil?
    
    @opts = "-h #{conf['host']} -p #{conf['port']} -U #{conf['username']} -d #{conf['database']} -t"
  end
  
  #
  # Execute a query (please no concurrency here)
  #
  def execute(query, rowify = false)
    filename = '/tmp/pglite.sql'
    File.open(filename, 'wb') { |file| file.write(query) }
    execute_file(filename, rowify)
  end
  
  #
  # Executes an sql file for the connection
  #
  def execute_file(filename, rowify = false)
    results = `psql #{@opts} < "#{filename}"`.strip
    return results.split("\n").map {|i| i.strip} if rowify
    return results
  end
  
end
