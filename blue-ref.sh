#!/bin/bash
btID=14:C1:4E:78:6A:CA
#VARIABLE ---> EXECUTE
amixer set Master mute
xdotool key XF86AudioPlay
service bluetooth restart
systemctl is-active --quiet bluetooth && echo Service has restarted
while true; do #Inf. loop. Executes BT connect command via if statement.
   if [[ $(bluetoothctl connect $btID) == *"yes"* ]]; then
      echo "Connected"
      amixer set Master unmute
      xdotool key XF86AudioPlay
      break #break will break out of the loop cycle
   else
      echo "Retrying..."
      continue #Continue will Continue to next loop cycle, before if sta.
   fi
done
