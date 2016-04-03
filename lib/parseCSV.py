import csv
import datetime
from tqdm import *

def trycast(x):
    try:
        return float(x)
    except:
        try:
            return int(x)
        except:
            return x

cols = ['product_productid', 'review_userid', 'review_profilename', 
        'review_helpfulness', 'review_score', 'review_date', 'review_time']

f = open('../../movies2.csv', 'wb')
w = csv.writer(f)
w.writerow(cols)

doc =  {}

with open('../../movies.txt') as infile:
    for line in tqdm(infile):
        line = line.strip()
        if line=="":
            w.writerow([doc.get(col) for col in cols])
            doc = {}
        else:
            idx = line.find(':')
            key, value = tuple([line[:idx], line[idx+1:]])
            key = key.strip().replace("/", "_").lower()
            value = value.strip()
            if key=="review_time":
                review_date = datetime.datetime.fromtimestamp(int(value)).strftime('%m/%d/%Y %H:%M:%S')
                idx = review_date.find(' ')
                rdate, rtime = tuple([review_date[:idx], review_date[idx+1:]])
                doc['review_date'] = trycast(rdate)
                doc['review_time'] = trycast(rtime)
            doc[key] = trycast(value)
    f.close()