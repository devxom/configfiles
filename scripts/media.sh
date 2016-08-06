#!/usr/sbin/bash

# Copyright (C) 2014 Julien Bonjean <julien@bonjean.info>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# feedback = Vahid.Maani@gmail.com


mpc_output() {
    current_song=$(mpc current --format "[%artist%] - [%title%]")
    # mpc stopped
    if [[ -z $current_song ]]; then
  echo " "
  echo " "
    else
  # mpc not stopped && now playing length over than 30 chars.
  if [[ ${#current_song} -gt 25 ]]; then
      current_song=${current_song:0:30}"... "
  fi
  is_paused=$(mpc | grep -i paused)
  # mpc paused
  if [[ -z $is_paused ]]; then
      song_duration=$(mpc | grep -i playing | awk '{print $3}')
      current_song=$current_song" [$song_duration]"
  else
      paused="PAUSED"
      current_song=$current_song" [$paused]"
  fi
  echo "Tocando:  $current_song"
  echo "Tocando:  $current_song"
  echo "FFFF00"
    fi
}

if [[ $((BLOCK_BUTTON)) == 1 ]]; then
    mpc_output
    mpc toggle
    mpc_output
elif [[ $((BLOCK_BUTTON)) == 3 ]]; then
    mpc_output
    mpc stop
    mpc_output
elif [[ $((BLOCK_BUTTON)) == 2 ]]; then
    mpc_output
    mpc next
    mpc_output
elif [[ $((BLOCK_BUTTON)) == 4 ]]; then
    mpc_output
    mpc seek +00:00:10
    mpc_output
elif [[ $((BLOCK_BUTTON)) == 5 ]]; then
    mpc_output
    mpc seek -00:00:10
    mpc_output
else
    mpc_output
fi
