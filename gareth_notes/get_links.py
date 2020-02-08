#!/usr/bin/env python3

import re

with open("notes.html") as notes_file:
    for match in re.finditer('href=[\'"]([^\'"]*\\.pdf)[\'"]',
                             notes_file.read()):
        print("https://tartarus.org/gareth/maths/notes/{}".format(
              match.group(1)))
