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
  
  def execute(query)
    `psql #{@opts} -c "#{query}"`.strip
  end
  
end