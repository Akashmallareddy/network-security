s = input('enther the data-->')
count = 0
stuffed = ''
destuffed = ''
for i in s:
    if count == 5 :
        stuffed += '0'
        count = 0
    if i == '1':
        count += 1
    else:
        count = 0
    stuffed += i
count = 0
for i in stuffed:
    if count == 5:
        count = 0
        continue
    else:
        if i == '1':
            count += 1
        else:
            count = 0
        destuffed += i
print(stuffed,destuffed)