# MyoMapper #
MyoMapper, is a tool to convert and rescale raw data from the Myo and to send them to musical applications (Eg. [Integra Live](http://www.integralive.org), [Pd](https://puredata.info), [Max/MSP](https://cycling74.com/products/max/)) through OSC and/or MIDI protocol.

It has been developed by [Balandino Di Donato](http://www.balandinodidonato.com) at [Integra Lab](http://www.integra.io/lab).

MyoMapper demos are available [here](https://vimeo.com/album/3313801). 
## Requirements ##

- [Processing 3.0](https://processing.org/download/)
- Libraries for Processing:
  - [The midibus](http://www.smallbutdigital.com/themidibus.php)
  - [ControlP5](http://www.sojamo.de/libraries/controlP5/)
  - [oscP5](http://www.sojamo.de/libraries/oscP5/)
  - [Myo For Processing](https://github.com/nok/myo-processing)

##Build System##
Create a folder called MyoMapper.

Open a Terminal and change your directory to the MyoMapper Folder

`cd <path>/<to>/MyoMapper`

Clone the repository

`git clone https://github.com/balandinodidonato/MyoMapper`

Open the MyoMapper.pde file

`open MyoMapper/MyoMapper.pde`

Once the Processing Sketch came up

Navigate to the top bar and select `File -> Export Application`

- Select the Platform which you will be working on
- Click on `Export`

##How to use it##

- Launch [Myo Connect](https://developer.thalmic.com/downloads)
- Install `unlock.myo`  script (`path/to/MyoMapper/script/unlock.myo`) to do so:
`Myo Connect -> Application Manager -> +Add -> Select unlock.myo`
- Connect your Myo armband
- Verify that the connection is stable and Myo Connect is receiving data
- Launch MyoMapper

### How to change the OSC Port ###
Unfortunately there is no GUI command yet, (I promised to myself to insert this feature in) however it is still possible to do it. All you need to do is:

Open the osc.pde file
`open <path>/<to>/MyoMapper/MyoMapper/osc.pde`

Edit the IP and Port address with the one you need.
Save the osc.pde file
Build again MyoMapper. It is advisable to run it first from Processing using the top right corner button in order to check the OSC communication.

### How to Change MIDI  channel and cc value###
In order to change **MIDI channel** to which send MIDI data it is easily doable through the GUI.

To change **cc value** of the single Myo value, you need to open the relative pde file and edit the parameters of the functions which send MIDI data.

Eg.

To change cc values of Myo acceleration values you have to open the `myoAcceleration.pde` file

`open <path>/<to>/MyoMapper/MyoMapper/myoAcceleration.pde`

and then edit the function to send MIDI data at the line 19.

                            |MIDI ch| cc | value  |
                            |       |    |        |
    myBus.sendControllerChange(chMIDI, 4, rollMIDI);
    myBus.sendControllerChange(chMIDI, 5, pitchMIDI);
    myBus.sendControllerChange(chMIDI, 6, yawMIDI);
    

## License ##
Copyright (c)  2015 - Balandino Di Donato

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
