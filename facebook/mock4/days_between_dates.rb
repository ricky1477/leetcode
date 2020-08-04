
require "test/unit"


# Write a program to count the number of days between two dates.

# The two dates are given as strings, their format is YYYY-MM-DD as shown in the examples.

 

# Example 1:

# Input: date1 = "2019-06-29", date2 = "2019-06-30"
# Output: 1
# Example 2:

# Input: date1 = "2020-01-15", date2 = "2019-12-31"
# Output: 15
 

# Constraints:

# The given dates are valid dates between the years 1971 and 2100.


# Best approach is to add days from 1971-01-01 to both dates
# res = |f(date1) - f(date2)|.

# @param {String} date1
# @param {String} date2
# @return {Integer}
def days_between_dates(date1, date2)
  return 0 if date1 == date2

  max_date, min_date = get_max_min_date(date1, date2)
  min_year, min_month, min_day = split_date(min_date)
  max_year, max_month, max_day = split_date(max_date)

  days_diff = 0

  p 'years'
  while(min_year != max_year)
    isLeap(min_year) ? days_diff += 366 : days_diff += 365
    min_year += 1
  end
  p days_diff

  p 'months'
  p days_diff
  while(min_month != max_month)
    days_diff += 31 if min_month == 1
    days_diff += 29 if min_month == 2 && isLeap(min_year)
    days_diff += 28 if min_month == 2 && !isLeap(min_year)
    days_diff += 31 if min_month == 3 
    days_diff += 30 if min_month == 4
    days_diff += 31 if min_month == 5
    days_diff += 30 if min_month == 6
    days_diff += 31 if min_month == 7
    days_diff += 31 if min_month == 8
    days_diff += 30 if min_month == 9
    days_diff += 31 if min_month == 10
    days_diff += 30 if min_month == 11
    days_diff += 31 if min_month == 12
    min_month += 1
  end

  p 'days'
  p days_diff
  p max_day
  p min_day

  if(min_day < max_day)
    days_diff += max_day - min_day
  else
    days_diff -= min_day - max_day
  end

  return days_diff   
end

def split_date(date)
  return date.split('-').map(&:to_i)
end

def get_max_min_date(date1, date2)
  y1, m1, d1 = split_date(date1)
  y2, m2, d2 = split_date(date2)

  # p d1, m1, y1
  # p '---'
  # p d2, m2, y2

  if y2 > y1
    return date2, date1 
  elsif y1 > y2
    return date1, date2 
  end

  if m2 > m1
    return date2, date1 
  elsif m1 > m2
    return date1, date2 
  end

  if d2 > d1
    return date2, date1 
  elsif d1 > d2
    return date1, date2 
  end
end

def isLeap(year)
  if(year % 4 == 0)
    if(year % 100 == 0)
        if (year % 400 == 0)
          isLeap = true
        else
          isLeap = false
        end
    else
      isLeap = true
    end
  else
    isLeap = false
  end

end

class TestSimpleNumber < Test::Unit::TestCase
  def test_simple
    assert_equal(true, isLeap(2020))
    assert_equal(false, isLeap(2019))
    assert_equal(["2019-06-30", "2019-06-29"], get_max_min_date("2019-06-29", "2019-06-30"))

    #assert_equal(1, days_between_dates("2019-06-29", "2019-06-30"))
    assert_equal(15, days_between_dates("2020-01-15", "2019-12-31"))
  end 
end