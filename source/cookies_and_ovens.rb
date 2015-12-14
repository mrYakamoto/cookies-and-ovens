class Cookie
  attr_reader :status, :type

  def initialize(type)
    @type = type
    @status = { :raw => 2,
                :doughy => 6,
                :almost_done => 8,
                :done => 10,
                :burned => 12
              }
  end
  def check_status(minutes)
    minutes = minutes.to_i
    if minutes < status[:raw]
      return "raw"
    elsif minutes < status[:doughy]
      return "doughy"
    elsif minutes < status[:almost_done]
      return "almost done"
    elsif minutes < status[:burned]
      return "done"
    else
      return "burned"
    end
  end

end

class CookieTray
  attr_reader :tray

  def initialize(type)
    @tray = []
    12.times {tray << Cookie.new(type)}
  end
end

class Oven
  attr_accessor :empty, :contents, :timer

  def initialize()
  @empty = :true
  @contents = []
  @timer = nil
  end

  def bake(cookie_batch)
    insert_cookies(cookie_batch)
    start_timer
  end

  def check_cookies
    return "There's nothing in the oven" if empty == :true
    time_passed = timer.check_timer
    minutes_passed = time_passed.split(":")[0]
    contents[0].tray[0].check_status(minutes_passed)
  end

  def start_timer
    @timer = Timer.new
  end

  def insert_cookies(cookie_batch)
    return "There's already cookies in the oven" if @empty == :false
    @empty = :false
    contents << cookie_batch
  end

  def remove_cookies
    empty = :true
    contents.shift()
  end

end


class Timer
  attr_reader :start_time, :duration
  def initialize
    @start_time = Time.now
  end

  def check_timer
    seconds_passed = (Time.now - start_time).to_i.abs
    convert_from_seconds(seconds_passed)
  end

  def convert_from_seconds(seconds)
    minutes = seconds / 60
    seconds -= minutes * 60
    return "#{minutes.to_s.rjust(2,'0')}:#{seconds.to_s.rjust(2,'0')}"
  end
end