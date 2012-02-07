# A Clockwork Ruby - A clock class for use with time of day.

```ruby

clock = Clock.now
=>  5:28 PM

other_clock = Clock.new(13,3)
=>  1:03 PM

clock.hour
=> 17 
clock.min
=> 30 
clock.sec
=> 21 
clock.usec
=> 266631

clock.hour = 23
=> 23

Clock.from_i(12345)
=>  3:25 AM

Clock.now.to_i
=> 63393

clock == other_clock
=> false

clock > other_clock
=> true

# Takes same arguments as strftime
clock.strfclock('%H:%M:%S')
=> "17:30:21"

```


# Credits

A Clockwork Ruby is maintained by [Mike Taylor](http://github.com/sealabcore) and is funded by [BookRenter.com](http://www.bookrenter.com "BookRenter.com"). Help provided by [Michael Pearce](http://github.com/michaelgpearce), and [Miguel Huibonhoa](http://github.com/phuibonhoa).

![BookRenter.com Logo](http://assets0.bookrenter.com/images/header/bookrenter_logo.gif "BookRenter.com")


# Copyright

Copyright (c) 2012 Bookrenter.com. See LICENSE.txt for further details.

