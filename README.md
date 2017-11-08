# enable-rightbutton
This will enable right button in linux synaptic drive like arch linux


just run like this
bash enable-rightbutton.sh "DLLC6AE:00 06CB:75BF Touchpad"

here "DLLC6AE:00 06CB:75BF Touchpad" is my touchpad name you can find by just typing xinput in terminal and find your touchpad and then just type above command to enable this feature 
to bebug 

xinput list-props "DLLC6AE:00 06CB:75BF Touchpad" | grep Capabilities 

just type this command to debug and thats it. your touchpad will work like heaven.
