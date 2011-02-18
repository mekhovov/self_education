from math import sqrt

def calc (**abc):
  "Quadratic Equation Calculator"
  for k, v in abc.iteritems():
    try:
      abc[k] = float(v.replace(',', '.')) if v else 0
    except (ValueError):
      return 'Error: %s is not a number ' % (k)
  d = abc['b']**2 - 4*abc['a']*abc['c']
  x = "(%s%d + sqrt(%d)) / (2 * %d)" % ('%s', abc['b'], d, abc['a'])
  print "D = %d" % (d)
  if d > 0 and (abc['a'] != 0):
    return 'x1 = %d \n   x2 = %d' % ( eval(x % '-'), eval(x % '+') )
  elif d == 0 and (abc['a'] != 0):
    return 'x1 = x2 = %d' % ( eval(x % '-') )
  else:
    return 'No solutions'

print '*** Answer is: \n   %s' % ( calc (a=raw_input('Enter a: '), 
                                         b=raw_input('Enter b: '), 
                                         c=raw_input('Enter c: ')) )
