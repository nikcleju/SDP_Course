import time
import threading

keepAlive = True

def threadHandler():
    print('thread started')
    sleepfor = 290   # seconds
    sleepmax = 30  # 30 * 290 seconds = 30 * 5 min = 150 mins
    sleepcount = 0
    while keepAlive and sleepcount < sleepmax:
        print(f"(Keep alive {sleepcount+1}/{sleepmax}, sleep for {sleepfor} seconds)")
        time.sleep(sleepfor)
        sleepcount = sleepcount + 1
    print("(Keep alive finished")

tt = threading.Thread(name='SomeThread',target=threadHandler)
tt.setDaemon(True)
tt.start()