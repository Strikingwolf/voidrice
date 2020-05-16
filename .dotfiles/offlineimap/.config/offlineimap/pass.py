#!/usr/bin/env python
#
#
import re, os, subprocess

def get_password_emacs(machine, login, port):
    s = "machine %s login %s port %s password ([^ ]*)\n" % (machine, login, port)
    p = re.compile(s)
    authinfo = os.popen("gpg -q --no-tty -d ~/.config/gpg-pass/email/authinfo.gpg").read()
    return p.search(authinfo).group(1)

def mailpasswd(acct):
  acct = os.path.basename(acct)
  path = "/home/faye/.config/gpg-pass/email/%s.gpg" % acct
  args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
  try:
    return subprocess.check_output(args).strip()
  except subprocess.CalledProcessError:
    return ""

def prime_gpg_agent():
  ret = False
  i = 1
  while not ret:
    ret = (mailpasswd("prime") == "prime")
    if i > 2:
      from offlineimap.ui import getglobalui
      sys.stderr.write("Error reading in passwords. Terminating.\n")
      getglobalui().terminate()
    i += 1
  return ret

prime_gpg_agent()
