import csv
from mimesis import Generic


g = Generic()

with open('games.csv','w', newline='') as f:
    writer = csv.writer(f)
    header = ['Title', 'Platform', 'Rating', 'High Score']
    writer.writerow(header)
    for _ in range(100):
        row = [
            g.games.game(),
            g.games.gaming_platform(),
            g.games.pegi_rating(),
            g.games.score()
        ]
        writer.writerow(row)

