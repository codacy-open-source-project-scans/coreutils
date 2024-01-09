#!/bin/sh
# On GNU, 'id' must fail for processes with zero UIDs.

# Copyright (C) 2011-2024 Free Software Foundation, Inc.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
print_ver_ id

require_gnu_

sush - true || skip_ "the 'sush' command does not work"

# Run 'id' with zero UIDs.  It should exit with a non-zero status.
returns_ 1 sush - id > out || fail=1

Exit $fail
