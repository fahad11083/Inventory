class Sherlock
  def initialize( logger )
    @logger = logger
  end

  def investigate
    with_logging( 'compute miles' ) do
      186000 * 60 * 60 * 24 * 365
    end
  end

  def with_logging(description)
    begin
      @logger.debug( "Starting #{description}" )
      return_value = yield
      @logger.debug( "Completed #{description}" )
      return_value
    rescue
      @logger.error( "#{description} failed!!" )
    end
  end
end