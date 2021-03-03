#!/usr/bin/env python
import matplotlib.pyplot as plt
from collections import Counter
import sys
import re

if len(sys.argv) != 2:
    raise Exception("Invalid arguments")

HISTFILE = sys.argv[1]
commands = []
for line in open(HISTFILE, encoding="ISO-8859-1"):
    command = line.split(" ")[0]
    command = re.sub("\n", "", command)
    commands.append(command)

top = 10
counter = Counter(commands).most_common(top)
labels, command_count = zip(*counter)

p, tx, autotexts = plt.pie(
    command_count,
    labels=labels,
    autopct="",
    radius=2
)

for i, a in enumerate(autotexts):
    a.set_text(str(command_count[i]))

plt.axis("equal")
plt.show()

