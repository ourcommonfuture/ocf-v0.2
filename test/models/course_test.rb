require 'test_helper'

class CourseTest < ActiveSupport::TestCase

	# ---------------------------------------------------------------
	# 				Schedule related tests
	# ---------------------------------------------------------------

	test "getCounter same month 1 day" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-03-10', end: '2015-02-09', desc: 'bla'}).getCounter(DateTime.new(2015,3,9))
    assert s, '1 day'
  end

  test "getCounter same month 5 days" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-03-10', end: '2015-02-09', desc: 'bla'}).getCounter(DateTime.new(2015,3,5))
    assert s, '5 days'
  end
  
  test "getCounter same month 10 days" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-03-20', end: '2015-02-09', desc: 'bla'}).getCounter(DateTime.new(2015,3,1))
    assert s, '20 days'
  end
  
  test "getCounter 1 month, actual day before" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-03-10', end: '2015-02-09', desc: 'bla'}).getCounter(DateTime.new(2015,2,5))
    assert s, '1 month and 5 days'
  end
  
  test "getCounter 1 month, actual day after" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-03-10', end: '2015-02-09', desc: 'bla'}).getCounter(DateTime.new(2015,2,15))
    assert s, '15 days'
  end
  
  test "getCounter 2 months, actual day before" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-03-10', end: '2015-02-09', desc: 'bla'}).getCounter(DateTime.new(2015,1,5))
    assert s, '2 months and 5 days'
  end
  
  test "getCounter 2 months, actual day after" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-03-10', end: '2015-02-09', desc: 'bla'}).getCounter(DateTime.new(2015,2,15))
    assert s, '1 month 15 days'
  end
  
  test "getCounter different year 5 days" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-01-05', end: '2015-02-09', desc: 'bla'}).getCounter(DateTime.new(2014,12,31))
    assert s, '5 days'
  end
  
  test "getCounter different year 3 months actual day before" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-01-10', end: '2015-02-09', desc: 'bla'}).getCounter(DateTime.new(2014,10,05))
    assert s, '3 months and 5 days'
  end
  
  test "started? yes" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-01-10', end: '2015-02-09', desc: 'bla'}).started?(DateTime.new(2015,1,15))
    assert s
  end
  
  test "started? no" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-01-10', end: '2015-02-09', desc: 'bla'}).started?(DateTime.new(2014,1,05))
    assert_not s
  end
  
  test "getStart with < 10" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-01-09', end: '2015-02-09', desc: 'bla'}).getStart(false)
    assert s, '2015-01-09'
  end
  
  test "getStart with > 10" do
  	s = Schedule.new({name: 'test', title: 'test', description: 'test', start: '2015-10-15', end: '2015-02-09', desc: 'bla'}).getStart(false)
    assert s, '2015-10-15'
  end
end
