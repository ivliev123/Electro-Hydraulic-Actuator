import numpy as np 

lines = []

for x in range(1000):
    a = 5*np.pi*x/1000
    y = np.cos(a)
    # y = np.cos(a)
    out = int(y * 4095/2 + 4095/2)
    lines.append(out)
    print(out)

with open('cos_test_1000.txt', 'w') as f:
    for line in lines:
        f.write(str(line))
        f.write('\n')


# with open('cos_test.txt', 'w') as f:
#     for line in lines:
#         f.write(str(line))
#         f.write('\n')