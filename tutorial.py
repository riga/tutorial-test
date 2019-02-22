# coding: utf-8

"""
Helpful utilities for the LBN tutorial at the IML workshop 2019.
"""

import os
import sys

__all__ = ["has_eos"]


# check if we have access to /eos or not
eos_tut_dir = "/eos/user/m/mrieger/public/iml2019"
has_eos = os.access(eos_tut_dir, os.R_OK)

# if eos is accessible, amend the path to find shared software
# otherwise, software must be installed manually (or via requirements.txt on binder)
if has_eos:
    sys.path.insert(0, os.path.join(eos_tut_dir, "software/lbn/lib/python2.7/site-packages"))
