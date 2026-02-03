\# PLC Traffic Light Control - Exercise (Systems Security)



\## Objective

Design and implement a two-traffic light intersection control system using a PLC.  

The system controls two traffic lights: \*\*North-South (NS)\*\* and \*\*East-West (EW)\*\*.



\## Project Description

\- Each traffic light has \*\*Red, Yellow, Green\*\* LEDs.

\- Timers cycle the lights:

&nbsp; - \*\*Green:\*\* 10 seconds

&nbsp; - \*\*Yellow:\*\* 5 seconds

&nbsp; - \*\*Red:\*\* 15 seconds

\- North-South Red is ON when East-West Green or Yellow are ON, and vice versa.

\- Safety logic prevents conflicting green lights from turning ON simultaneously.



\## Project Structure

PLC-Traffic-Light-Control/

├─ st/ # Structured Text (ST) code for the PLC

│ ├─ TrafficLight\_NS\_EW.st # Main traffic light logic

│ └─ moteur.st # Auxiliary code (if any)

├─ src/ # Project XML files for OpenPLC/Beremiz

│ ├─ beremiz.xml

│ └─ plc.xml

├─ config/ # PLC configuration

│ └─ arduino\_settings.json # Arduino/OpenPLC settings





\## Steps Taken (Lab Workflow)

1\. Built the \*\*Structured Text program\*\* for the traffic lights.

2\. Added \*\*timers and safety logic\*\* to ensure correct sequencing.

3\. Created \*\*OpenPLC/Beremiz project files\*\* (`beremiz.xml` and `plc.xml`).

4\. Configured \*\*Arduino/OpenPLC settings\*\* for potential deployment.

5\. Cleaned extra files and organized folder structure.

6\. Verified logic correctness in code (hardware not available for testing).



\## HMI \& Simulation

\- HMI designed to display \*\*each LED state\*\* and \*\*countdown timers\*\*.

\- Background image represents the intersection layout.

\- Traffic light logic simulated in ST to verify correct sequencing (no hardware used).



\## Modbus Mapping

\- `%QX100.5` → \*\*Coil (Output)\*\*

\- `%MW103` → \*\*Holding Register (Integer)\*\*

\- OpenPLC memory map follows separate \*\*Coil\*\* and \*\*Holding Register\*\* regions; addresses do not overlap.



\## Safety Logic

\- A light can turn \*\*green\*\* only if the \*\*opposite red\*\* is ON.

\- \*\*Yellow lights\*\* follow the same rule to prevent collisions.

\- Ensures \*\*safe transitions\*\* between traffic signals.



\## How to Run

1\. Open the project in \*\*OpenPLC Editor\*\* or \*\*Beremiz\*\*.

2\. Deploy to PLC or simulator.

3\. Observe the traffic light sequencing.



> \*\*Note:\*\* Hardware was not available, so code logic has been verified but not physically tested.  



\## References

\- CPE 459/559 Systems Security Lab

\- OpenPLC and Beremiz documentation



