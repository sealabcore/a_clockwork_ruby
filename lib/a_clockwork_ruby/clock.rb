class Clock
  include Comparable
  attr_accessor :hour, :min, :sec, :usec
  
  def initialize(hour = nil, min = nil, sec = nil, usec = nil)
    if hour.nil?
      time = Time.now
      @hour = time.hour
      @min = time.min
      @sec = time.sec
      @usec = time.usec
    else
      @hour = hour
      @min = min || 0
      @sec = sec || 0
      @usec = usec || 0
    end
  end
  
  def self.now
    self.new
  end
  
  def self.from_i seconds
    self.new(seconds / 60**2 % 60**2, seconds / 60 % 60, seconds % 60)
  end
  
  def hour= hour
    raise ArgumentError if hour < 0 or hour > 23
    @hour = hour
  end
  
  def min= min
    raise ArgumentError if min < 0 or min > 59
    @min = min
  end
  
  def sec= sec
    raise ArgumentError if sec < 0 or sec > 59
    @sec = sec
  end
  
  def usec= usec
    raise ArgumentError if usec < 0 or usec > 999999
    @usec = usec
  end
  
  def strfclock format
    to_time.strftime(format)
  end
  
  def to_time
    to_time_helper(Time.now)
  end

  def to_s
    strfclock("%l:%M %p")
  end
  
  def inspect
    strfclock("%l:%M %p")
  end
  
  def to_i
    @sec + (@min * 60) + (@hour * 60**2)
  end
  
  def == other
    time = Time.now
    to_time_helper(time) == other.send(:to_time_helper, time)
  end
  
  def <=> other
    time = Time.now
    to_time_helper(time) <=> other.send(:to_time_helper, time)
  end
  
  private
  
  def to_time_helper(time)
    Time.mktime(time.year, time.month, time.day, @hour, @min, @sec, @usec)
  end
end
