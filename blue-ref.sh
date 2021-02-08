#!/bin/bash
btID=$(bluetoothctl info | grep Device | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
#VARIABLE ---> EXECUTE
xdotool key XF86AudioPlay
service bluetooth restart
systemctl is-active --quiet bluetooth && echo Service has restarted
while true; do #Inf. loop. Executes BT connect command via if statement.
   if [[ $(bluetoothctl connect $btID) == *"yes"* ]]; then
      echo "Connected"
      xdotool key XF86AudioPlay
      break #break will break out of the loop cycle
   else
      echo "Retrying..."
      continue #Continue will Continue to next loop cycle, before if sta.
   fi
done
