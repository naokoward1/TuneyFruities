def main():
    vals = open("positions.txt", "r")
    startTime = vals.readline().strip()
    keys = []
    first = (vals.readline().strip().split(', '))
    firstNum = int(first[1])
    keys.append([first[0], firstNum - 14923])
    idx = 0
    for line in vals:
        curr = (keys[idx])
        next = vals.readline().strip().split(', ')
        currNum = int(curr[1])
        nextNum = int(next[1]) - 14923
        print("Curr num: " + str(currNum))
        print("Next Num: " + str(nextNum))

        if(next[0] != curr[0] and nextNum - currNum > 500):
            keys.append([next[0], nextNum])
            idx += 1


    updated = open("positions_updated.txt", "w")
    updated.write(str(startTime) + "\n")
    for item in keys:
        updated.write(str(item[0]) + ', ' + str(item[1]) + "\n")


main()
