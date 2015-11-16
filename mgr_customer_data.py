import signal
import sys
import logging


logging.basicConfig(level=logging.DEBUG)


def term_handler(signal, frame):
    logging.info("get TERM singal, start to backup customer's data")
    # implement your data backup here
    sys.exit(0)


signal.signal(signal.SIGTERM, term_handler)
logging.info('programmer starting, to download customer data...')
signal.pause()
