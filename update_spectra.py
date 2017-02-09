import epics
import numpy
import time

def update_spectra():
	simple_x = epics.PV("TE:NDW1695:SIMPLE:SPEC:1:1:X")
	simple_y = epics.PV("TE:NDW1695:SIMPLE:SPEC:1:1:Y")
	simple_len = epics.PV("TE:NDW1695:SIMPLE:LENGTH")
	i = 0
	while True:
	    i += 1
            array_length = simple_len.get()
	    try:
		    simple_x.put(100*numpy.random.rand(array_length))
		    simple_y.put(100*numpy.random.rand(array_length))
	            print "Updated: " + str(i) + ", " + str(array_length)
	    except:
		    print "Unable to update: " + str(i)
	    time.sleep(1)