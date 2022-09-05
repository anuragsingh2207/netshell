#!/bin/sh                  
input="list.txt"
	while IFS=read -r line
	do
	    echo ${line} 
        sshpass -f ~/password ssh -T rgupta_v@${line}
        if show version node 0 | match model | grep -q srx550m  && show version node 0 | match Junos: | grep -q 15.1X49-D130.6; then
        exit
        sshpass -f "~/password" scp /Users/rachitgupta/Desktop/19.4R3-S1.zip rgupta_v@${line}:/var/tmp     
        elif show version node 0 | match model | grep -q srx550m  && show version node 0 | match Junos: | grep -q 19.4R3-S1; then
        exit
        sshpass -f "~/password" scp /Users/rachitgupta/Desktop/20.2R3.zip rgupta_v@${line}:/var/tmp        
        elif show version node 0 | match model | grep -q srx550m  && show version node 0 | match Junos: | grep -q 20.2R3; then
        exit
        sshpass -f "~/password" scp /Users/rachitgupta/Desktop/21.4R1-S2.3.zip rgupta_v@${line}:/var/tmp   
        else
        echo "Version did not match"
        fi
done < "$input"


++++++++++++
Test below command in the JunOS sh shell 

#!/bin/sh
 if show version node 0 | match model | grep -q srx550m  && show version node 0 | match Junos: | grep -q 15.1X49-D130.6
 echo "Matching Model & Version"
 else
 echo "Either of Model & Version not matching"


+++++++++++
For Secure Password Setup

brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
vi ~/password => Enter Password
sshpass -f "~/password" scp -r user@example.com:/some/remote/path /some/local/path