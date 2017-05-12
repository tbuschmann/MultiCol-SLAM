import os
import sys

def createExifFile():
    file = open('images_and_timestamps.txt', 'w')

    with os.scandir('imgs') as it:
        num_cams = len(list(it))
        print(num_cams)
        for i in range(0, num_cams):
            with os.scandir('imgs/cam' + str(i)) as it:
                files = sorted(list(it), key=_getmtime)
                i = 2277000
                for d in files:
                    file.write(str(i) + " imgs/cam0/" + str(d.name) + " imgs/cam1/" + str(d.name)  + "\n")
                    i += 20
    file.close()

def _getmtime(x):
    state = os.stat(x)
    return state.st_mtime_ns

if __name__ == '__main__':
    createExifFile()
