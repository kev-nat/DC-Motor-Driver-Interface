# DC Motor Driver Interface

### Things You Need
- <a href="https://www.xilinx.com/publications/products/cpld/coolrunnerii-product-brief.pdf"> CoolRunner-II CPLD </a>
- <a href="https://digilent.com/reference/pmod/pmodhb5/reference-manual?redirect=1"> Pmod HB5 </a>
- <a href="https://digilent.com/shop/dc-motor-gearbox-1-19-gear-ratio-custom-12v-motor-designed-for-digilent-robot-kits/"> 12V DC Motor </a>

### Objectives
Drive a DC motor using a H-bridge circuit to vary the speed or torque of the motor using PWM signal with 16 different levels of duty cycle (levels are controlled from external switches).

### Problems�
Before the advent of Pulse Width Modulation (PWM), potentiometers were commonly used to regulate the speed of Direct Current (DC) motors. However, these potentiometers had three main drawbacks:

- Dynamic Range: The system could be adversely affected by leakage when the wiper was turned.

- High Sensitivity: Analog circuits are often extremely sensitive, reacting significantly to even minor changes.

- Corrosion: Rust can disrupt the signal entering the system or circuit, causing further complications.

### Solution
People now started using digital circuits to handle Pulse Width Modulation (PWM). For what is altered, there will be the duty cycle, and as for the output, the speed will depend on the various levels depending on its voltage output, which will be affected depending on the duty cycle.

![Animation](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/58d82f5f-f5f7-4bea-85d6-762e97fb357e)

## How to Control the Duty Cycle
![image](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/1115b11c-30ee-4467-af3b-52cdcea37e06)

<details>
<summary> 1. Buttons </summary>
  There will be 2 buttons of which will be used in the CoolRunner-II CPLD to change the PWM of the DC motor. One of the buttons will allow the speed to accelerate, and the other will reset the system.

  ![image](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/80056a4f-db29-4b28-9306-704853b2eb92)
  
</details>

<details>
<summary> 2. Bistable Buttons </summary>
On the bistable button, there are 3 inputs from the button, a clock divider output, and a reset. The output button will then be used to control the PWM for the DC motor. In this bistable button there are two states where the button is pressed and the button is not pressed. If the button is pressed, there will be output 1, if not pressed, the output will be 0. The output of the bistable button will be connected to the clock enable input on counter A.

![image](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/2df596d0-19fe-4c8e-9b6a-72c9eecbd977)
  
</details>

<details>
<summary> 3. Clock Divider </summary>
Clock Divider has 2 inputs, namely the MHz clock taken from CoolRunner-II CPLD and Reset. And ClockDivOut works to divide the clock signal. The clock divider will divide the clock from the input so that the
output of the clock is not speed and will be around 2KHz to drive the DC motor. Within the Clock divider, 2 signals are created, the counter as integers 1 to 4000 inside the counter, and the tmp signal which is coupled to the ClockDivOut output. In the Clock Divider process, the clock that gets the input from will make the counter inside the Clock divider go up to 2000, where then the output will give a high signal until the counter is at 4000, reset to 1, and at the same time make the output low.

![image](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/6d107d64-1a21-44c6-b79c-7592f6af0c23)
  
</details>

<details>
<summary> 4. Counter </summary>
  
  Counter A:
  Each time Counter A gets from the pressed button, the signal connected to the output will add 1 bit up to 1111. If the output is 1111 and the button is pressed, the output will return to 0000. But, if the     reset button is pressed, the counter will return to 0000.
  
  Counter B
  Each time Counter B gets input from the clock divider, the output signal will add 1 bit up to 1111. Once the output reaches 1111, the counter will then flip to 0000 and repeat as long as there is an input clock. If the reset button is pressed, the counter will return to 0000.

![image](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/94218d8d-ddf0-4c8a-80e5-564235a9e957)

</details>

<details>
<summary> 5. Comparator </summary>
The comparator compares the output of Counter A and Counter B to get the PWM. Inside, the process is that if the output of Counter A is greater than Counter B, it means that the comparator will give a high output, otherwise the output will be low. The comparator can compare the 2 comparators because both counters A and B are connected to the same clock divider, and the 2 output counters will give the same output every second. Since both counters are 4 bit equal, there will be 16 different speed levels.

![image](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/8aeb00d4-dd62-48a0-a684-e0c0c2b4729a)
  
</details>

## Setup
First we have to upload the VHDL program into the CPLD board. Then, we install the motor driver (as shown in figure) to the channel that we have programmed in the ucf file. Because this DC motor requires 12V to operate, we need an external power supply which we can provide via the blue terminal available on the motor driver.

![image](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/3d5bba2f-3c62-4fa6-8b05-2a55a8e6b15a)

### Simulation
![Screenshot (10297)](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/1ba625bb-fea6-4161-9da8-c6bd34eded3d)
![Screenshot (10299)](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/e2ca6250-2e20-4e2e-bbc7-2c427e4ed9fc)
![Screenshot (10301)](https://github.com/kev-nat/DC-Motor-Driver-Interface/assets/97384711/335935bb-daba-47e7-bca7-6612559091fe)

## Documentation
- <a href="https://youtube.com/shorts/nYx9Fdc90hw"> Demo </a>
- <a href="https://youtube.com/shorts/EZm1UH0z-bI"> Installation </a>
