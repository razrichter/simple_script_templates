#!/usr/bin/env python
# encoding: utf-8
# -*- mode: python; coding: utf-8 -*-
# vim: set fileencoding=utf-8:encoding=utf-8:syntax=python
import sys
import os
import errno

import argparse

from gzip import GzipFile
from bz2 import BZ2File
import io


def main(argv=None):
    args = _cmdline(argv=None)
    files = args.files
    if not files:
        files = "-"

    for f in files:
        with Util.open_any(f) as fh:
            # TODO process files
            for line in (l.rstrip("\n") for l in fh):  # remove line-ending
                print(line)
    return 0  # success


def _cmdline(argv=None):
    """Parse commandline arguments"""
    p = argparse.ArgumentParser()
    p.add_argument(
        "-v", "--verbose", default=False, action="store_true", help="Verbose Logging"
    )
    p.add_argument("files", metavar="file", nargs="*", help="File(s) to process")
    # TODO add options here

    return p.parse_args(argv)


def cli_wrap(argv=None, cmd=main):
    """
    Make sure to prevent exception tracebacksfor common signals
    like SIGABORT (^C) or SIGPIPE (e.g. cmd | head)
    """
    try:
        status = cmd(argv)
    except KeyboardInterrupt:
        status = 1
    except BrokenPipeError:
        devnull = os.open(os.devnull, os.O_WRONLY)
        os.dup2(devnull, sys.stdout.fileno())
        status = 1
    except IOError as e:
        if e.errno == errno.EPIPE:
            status = 1
        else:
            raise
    return status


class Util:
    @staticmethod
    def open_any(filename, mode="r"):
        """Opens uncompressed or compressed files, returning the file object,
        or, if passed a filename of '-', returns STDIN"""
        if filename == "-":
            fh = sys.stdin
        elif filename[-3:] == ".gz":
            fh = GzipFile(filename, mode)
            if mode == "r":
                fh = io.TextIOWrapper(fh)
        elif filename[-4:] == ".bz2":
            fh = BZ2File(filename, mode)
            if mode == "r":
                fh = io.TextIOWrapper(fh)
        else:
            fh = open(filename, mode)

        return fh


# ---------------
if __name__ == "__main__":
    raise SystemExit(cli_wrap())
