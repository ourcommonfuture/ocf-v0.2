class Schedule < ActiveRecord::Base
	def getStart (clean = true)
		getString(self.start, clean)
	end

	def getEnd (clean = true)
		getString(self.end, clean)
	end

	def getSchedule
		return self.start.strftime("%B %d") + ' - ' + self.end.strftime("%B %d, %Y")
	end

	def started?(now = nil)
		now = DateTime.now if !now
    milliSecsLeft = self.start.to_i - now.to_i

    # If the course already started
    if milliSecsLeft < 0
      return true
    else
    	return false
    end
  end

	def getCounter(now = nil)
		now = DateTime.now if !now
    milliSecsLeft = self.start.to_i - now.to_i

    # If the course already started
    if milliSecsLeft < 0
      return ''
    end

	  oneDay = 60 * 60 * 24
    allDays = (milliSecsLeft / oneDay)

		if allDays > 365
			return 'more than a year'
		else
			if self.start.year > now.year
				months = 12 - now.month
				months += self.start.month
			else
				months = self.start.month - now.month
			end

			if self.start.day > now.day
				days = self.start.day - now.day
			else
				months -= 1
				days = Time.days_in_month(now.month) - now.day + self.start.day
			end

			counter = ''
			if months > 0
				counter += months.to_s + ' month' 
				counter += 's' if months > 1
			end
			counter += ' and ' if (months > 0 && days > 0)
			if days > 0
				counter += days.to_s + ' day'
				counter += 's' if days > 1
			end

	    return counter
	  end
	end

	def getTotalWeeks
    milliSecs = self.end.to_i - self.start.to_i

	  oneDay = 60 * 60 * 24
    days = (milliSecs / oneDay)

		return days / 7
	end

  private
		def getString (time, clean)
			if clean
				return time.strftime("%B %d, %Y")
			else
				year = time.year.to_s
		    month = time.month.to_s
		    month = '0'+month if time.month<10
				day = time.day.to_s
				day = '0'+day if time.day<10
		    return year + '-' + month + '-' + day
			end
		end
end
