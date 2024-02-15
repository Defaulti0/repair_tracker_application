file_name = open("Repair-Copy.csv", 'r')
file_out = open("Repair-Copy-NoDupes.csv", 'w')

listLines=[]

for line in file_name:
    if line in listLines:
        continue
    else:
        file_out.write(line)
        listLines.append(line)