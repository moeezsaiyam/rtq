import sys
import extract

string           = ' '.join(sys.argv[1:len(sys.argv)])
extractor        = extract.TermExtractor()
extractor.filter = extract.DefaultFilter()
output           = extractor(string)
ret              = ','.join([str(x[0]) for x in output])


sys.stdout.write(ret)
