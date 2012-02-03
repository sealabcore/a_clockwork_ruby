require 'helper'
require 'a_clockwork_ruby'
require 'timecop'

class ClockTest < Test::Unit::TestCase

  context ".new" do
    should "return a clock using the current time when no args are passed" do
      Timecop.freeze do 
        time = Time.now
        clock = Clock.new
        assert_equal time.hour, clock.hour
        assert_equal time.min, clock.min
        assert_equal time.sec, clock.sec
        assert_equal time.usec, clock.usec
      end
    end
    
    should "allow clocky arguments" do
      clock = Clock.new(1, 2, 3, 4)
      assert_equal 1, clock.hour
      assert_equal 2, clock.min
      assert_equal 3, clock.sec
      assert_equal 4, clock.usec
    end

    should "allow optional clocky arguments" do
      clock = Clock.new(1)
      assert_equal 1, clock.hour
      assert_equal 0, clock.min
      assert_equal 0, clock.sec
      assert_equal 0, clock.usec
    end
  end
  
  context ".strfclock" do
    should "allow formatting using strftime args" do
      clock = Clock.new(14, 2, 3)
      assert_equal " 2:02:03 PM", clock.strfclock("%l:%M:%S %p")
    end
  end
  
  context ".to_s" do
    should "return clock as hours:minutes" do
      clock = Clock.new(13, 20)
      assert_equal " 1:20 PM", clock.to_s
    end
  end
  
  context ".==" do
    should "check equality" do
      assert Clock.new(3, 24) == Clock.new(3, 24)
      assert Clock.new(3, 24) != Clock.new(3, 23)
    end
  end
  
  context ".<=>" do
    should "compare clocks" do
      assert Clock.new(3, 23) < Clock.new(3, 24)
      assert Clock.new(3, 24) > Clock.new(3, 23)
    end
  end
  
  context ".to_i" do
    should "return the number of seconds" do
      clock = Clock.new(1, 2, 3, 4)
      assert_equal 3 + (2 * 60) + (1 * 60**2), clock.to_i
    end
  end
  
  context ".from_i" do
    should "create a clock from the number of seconds" do
      seconds = 3 + (2 * 60) + (1 * 60**2)
      clock = Clock.from_i(seconds)
      assert_equal 3, clock.sec
      assert_equal 2, clock.min
      assert_equal 1, clock.hour
    end
  end
  
  context ".now" do
    should "return a clock using the current time" do
      Timecop.freeze do 
        time = Time.now
        clock = Clock.now
        assert_equal time.hour, clock.hour
        assert_equal time.min, clock.min
        assert_equal time.sec, clock.sec
        assert_equal time.usec, clock.usec
      end
    end
  end
  
  context "setters" do
    setup do
      @clock = Clock.new
    end
    
    should "set the hour" do
      @clock.hour = 14
      assert_equal 14, @clock.hour
    end
    
    should "raise when hour is set to value out of range" do
      assert_raise(ArgumentError) { @clock.hour = 24 }
      assert_raise(ArgumentError) { @clock.hour = -1 }
    end
    
    should "set the min" do
      @clock.min = 14
      assert_equal 14, @clock.min
    end
    
    should "raise when minute is set to value out of range" do
      assert_raise(ArgumentError) { @clock.min = 60 }
      assert_raise(ArgumentError) { @clock.min = -1 }
    end
    
    should "set the sec" do
      @clock.sec = 14
      assert_equal 14, @clock.sec
    end
    
    should "raise when seconds is set to value out of range" do
      assert_raise(ArgumentError) { @clock.sec = 60 }
      assert_raise(ArgumentError) { @clock.sec = -1 }
    end
    
    should "set the usec" do
      @clock.usec = 14
      assert_equal 14, @clock.usec
    end
    
    should "raise when usec is set to value out of range" do
      assert_raise(ArgumentError) { @clock.sec = 1000000 }
      assert_raise(ArgumentError) { @clock.sec = -1 }
    end
  end
end
