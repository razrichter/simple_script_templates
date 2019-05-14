#!/usr/bin/env python
# encoding: utf-8
# -*- mode: python; coding: utf-8 -*-
# vim: set fileencoding=utf-8:encoding=utf-8:syntax=python
from __future__ import division, absolute_import, print_function, unicode_literals  # as python3 as possible
import sys
import errno


def main():
    return(0)  # success

# ---------------
if __name__ == '__main__':
    # trap Ctrl-C and sigpipe to block tracebacks
    try:
        retval = main()
    except KeyboardInterrupt:
        sys.exit(1)
    except IOError as e:
        if e.errno == errno.EPIPE:
            sys.exit(1)
        else:
            raise
    else:
        sys.exit(retval)
