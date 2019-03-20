import csv

with open('new.csv', 'w') as f:
    writer = csv.writer(f)
    foo = [[1,2,3],[4,5,6]]
    writer.writerows(foo)
