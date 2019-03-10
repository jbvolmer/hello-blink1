#! /usr/local/bin/python3

import argparse
import time
from blink1.blink1 import blink1

def flash_light(time_in_seconds=10, R=255, G=255, B=255, interval=1000):
    end=time.time()+time_in_seconds
    with blink1() as b1:
        while 1 and time.time() < end:
            b1.fade_to_rgb(interval, 255, 255, 255)
            time.sleep(interval/1000)
            b1.fade_to_rgb(interval, 0, 0, 0)
            time.sleep(interval/1000)

def shine_light(time_in_seconds, R=255, G=255, B=255, interval=1000):
    with blink1() as b1:
        b1.fade_to_rgb(interval, R, G, B)
        time.sleep(time_in_seconds)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-r', '--red', type=int, help='red', required=True)
    parser.add_argument('-g', '--green', type=int,  help='green', required=True)
    parser.add_argument('-b', '--blue', type=int,  help='blue', required=True)        
    parser.add_argument('-t', '--time', type=int, help='total time', required=True)
    parser.add_argument('-f', '--flash', action='store_true', help='flash mode')
    args = parser.parse_args()

    if args.flash:
        flash_light(args.time,args.red,args.green,args.blue)
    else:
        shine_light(args.time,args.red,args.green,args.blue)

if __name__ == '__main__':
    main()

