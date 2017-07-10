_init_LEVI:
;XRotor.c,65 :: 		void init_LEVI()
STR	LR, [SP, #0]
;XRotor.c,67 :: 		pwm_period = PWM_TIM4_Init(50);
MOVS	R0, #50
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;XRotor.c,68 :: 		PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PB9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PB9+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;XRotor.c,70 :: 		}
L_end_init_LEVI:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_LEVI
_init_DESNI:
;XRotor.c,75 :: 		void init_DESNI()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;XRotor.c,77 :: 		pwm_period = PWM_TIM3_Init(50);
MOVS	R0, #50
BL	_PWM_TIM3_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;XRotor.c,78 :: 		PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PB0);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM3_CH3_PB0+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM3_CH3_PB0+0)
MOVS	R0, #2
BL	_PWM_TIM3_Start+0
;XRotor.c,80 :: 		}
L_end_init_DESNI:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_DESNI
_init_THRUSTER:
;XRotor.c,85 :: 		void init_THRUSTER()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;XRotor.c,87 :: 		pwm_period = PWM_TIM4_Init(50);
MOVS	R0, #50
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;XRotor.c,88 :: 		PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PB8+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PB8+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;XRotor.c,90 :: 		}
L_end_init_THRUSTER:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_THRUSTER
_init_UART:
;XRotor.c,94 :: 		void init_UART()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;XRotor.c,99 :: 		&_GPIO_MODULE_UART4_PA01);
MOVW	R0, #lo_addr(__GPIO_MODULE_UART4_PA01+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_UART4_PA01+0)
PUSH	(R0)
;XRotor.c,98 :: 		_UART_ONE_STOPBIT,
MOVW	R3, #0
;XRotor.c,97 :: 		_UART_NOPARITY,
MOVW	R2, #0
;XRotor.c,96 :: 		UART4_Init_Advanced(9600,_UART_8_BIT_DATA,
MOVW	R1, #0
MOVW	R0, #9600
;XRotor.c,99 :: 		&_GPIO_MODULE_UART4_PA01);
BL	_UART4_Init_Advanced+0
ADD	SP, SP, #4
;XRotor.c,100 :: 		Delay_ms(100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_init_UART0:
SUBS	R7, R7, #1
BNE	L_init_UART0
NOP
NOP
NOP
;XRotor.c,101 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_ADC:
;XRotor.c,105 :: 		void init_ADC()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;XRotor.c,110 :: 		_ADC_CHANNEL_13);
MOVW	R0, #15360
BL	_ADC_Set_Input_Channel+0
;XRotor.c,112 :: 		ADC1_Init();
BL	_ADC1_Init+0
;XRotor.c,113 :: 		}
L_end_init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_ADC
_main:
;XRotor.c,128 :: 		void main(){
SUB	SP, SP, #76
;XRotor.c,142 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;XRotor.c,144 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;XRotor.c,146 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;XRotor.c,155 :: 		init_LEVI();
BL	_init_LEVI+0
;XRotor.c,156 :: 		PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
MOVW	R0, #2451
BL	_PWM_TIM4_Set_Duty+0
;XRotor.c,157 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;XRotor.c,160 :: 		init_DESNI();
BL	_init_DESNI+0
;XRotor.c,161 :: 		PWM_TIM3_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
MOVW	R0, #2451
BL	_PWM_TIM3_Set_Duty+0
;XRotor.c,162 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;XRotor.c,166 :: 		init_THRUSTER();
BL	_init_THRUSTER+0
;XRotor.c,167 :: 		PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
MOVW	R0, #2451
BL	_PWM_TIM4_Set_Duty+0
;XRotor.c,168 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;XRotor.c,173 :: 		init_ADC();
BL	_init_ADC+0
;XRotor.c,174 :: 		init_UART();
BL	_init_UART+0
;XRotor.c,175 :: 		Delay_ms(100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;XRotor.c,178 :: 		while(1){
L_main10:
;XRotor.c,181 :: 		Y= ADC1_Get_Sample(11);
MOVS	R0, #11
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_Y+0)
MOVT	R1, #hi_addr(_Y+0)
STR	R1, [SP, #72]
STRH	R0, [R1, #0]
;XRotor.c,182 :: 		X= ADC1_Get_Sample(10);
MOVS	R0, #10
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_X+0)
MOVT	R1, #hi_addr(_X+0)
STRH	R0, [R1, #0]
;XRotor.c,184 :: 		SW = ADC1_Get_Sample(12);
MOVS	R0, #12
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_SW+0)
MOVT	R1, #hi_addr(_SW+0)
STRH	R0, [R1, #0]
;XRotor.c,185 :: 		SW2 = ADC1_Get_Sample(13);
MOVS	R0, #13
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_SW2+0)
MOVT	R1, #hi_addr(_SW2+0)
STRH	R0, [R1, #0]
;XRotor.c,193 :: 		if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW<=3000 )&&(SW2<=3000))
LDR	R0, [SP, #72]
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__main173
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	HI
BHI	L__main172
L__main167:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main171
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #2400
IT	HI
BHI	L__main170
L__main166:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main169
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main168
L__main165:
;XRotor.c,198 :: 		LEVI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,200 :: 		DESNI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,202 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,205 :: 		}
IT	AL
BAL	L_main19
;XRotor.c,193 :: 		if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW<=3000 )&&(SW2<=3000))
L__main173:
L__main172:
L__main171:
L__main170:
L__main169:
L__main168:
;XRotor.c,209 :: 		else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2<=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2601
CMP	R1, R0
IT	CC
BCC	L__main179
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #4095
CMP	R1, R0
IT	HI
BHI	L__main178
L__main164:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main177
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #2400
IT	HI
BHI	L__main176
L__main163:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main175
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main174
L__main162:
;XRotor.c,214 :: 		LEVI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,216 :: 		DESNI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,218 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,222 :: 		}
IT	AL
BAL	L_main27
;XRotor.c,209 :: 		else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2<=3000))
L__main179:
L__main178:
L__main177:
L__main176:
L__main175:
L__main174:
;XRotor.c,226 :: 		else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW<=3000)&&(SW2<=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main185
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2600
CMP	R1, R0
IT	HI
BHI	L__main184
L__main161:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__main183
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	HI
BHI	L__main182
L__main160:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main181
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main180
L__main159:
;XRotor.c,231 :: 		LEVI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,233 :: 		DESNI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,235 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,237 :: 		}
IT	AL
BAL	L_main35
;XRotor.c,226 :: 		else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW<=3000)&&(SW2<=3000))
L__main185:
L__main184:
L__main183:
L__main182:
L__main181:
L__main180:
;XRotor.c,241 :: 		else if((Y>=301&&Y<=2600)&&(X>=2401&&X<=4095)&&(SW<=3000)&&(SW2<=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main191
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2600
CMP	R1, R0
IT	HI
BHI	L__main190
L__main158:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2401
CMP	R1, R0
IT	CC
BCC	L__main189
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #4095
CMP	R1, R0
IT	HI
BHI	L__main188
L__main157:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main187
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main186
L__main156:
;XRotor.c,246 :: 		LEVI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,248 :: 		DESNI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,250 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,252 :: 		}
IT	AL
BAL	L_main43
;XRotor.c,241 :: 		else if((Y>=301&&Y<=2600)&&(X>=2401&&X<=4095)&&(SW<=3000)&&(SW2<=3000))
L__main191:
L__main190:
L__main189:
L__main188:
L__main187:
L__main186:
;XRotor.c,256 :: 		else if((Y>=301&&Y<=2600)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main197
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2600
CMP	R1, R0
IT	HI
BHI	L__main196
L__main155:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main195
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #2400
IT	HI
BHI	L__main194
L__main154:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main193
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main192
L__main153:
;XRotor.c,261 :: 		LEVI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,263 :: 		DESNI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,265 :: 		THRUSTER=ZARON;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,267 :: 		}
IT	AL
BAL	L_main51
;XRotor.c,256 :: 		else if((Y>=301&&Y<=2600)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
L__main197:
L__main196:
L__main195:
L__main194:
L__main193:
L__main192:
;XRotor.c,271 :: 		else if((Y>=301&&Y<=2600)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main203
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2600
CMP	R1, R0
IT	HI
BHI	L__main202
L__main152:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main201
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #2400
IT	HI
BHI	L__main200
L__main151:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main199
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main198
L__main150:
;XRotor.c,276 :: 		LEVI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,278 :: 		DESNI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,280 :: 		THRUSTER=IZRON;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,282 :: 		}
IT	AL
BAL	L_main59
;XRotor.c,271 :: 		else if((Y>=301&&Y<=2600)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
L__main203:
L__main202:
L__main201:
L__main200:
L__main199:
L__main198:
;XRotor.c,286 :: 		else if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__main209
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	HI
BHI	L__main208
L__main149:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main207
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #2400
IT	HI
BHI	L__main206
L__main148:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main205
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main204
L__main147:
;XRotor.c,291 :: 		LEVI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,293 :: 		DESNI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,295 :: 		THRUSTER=ZARON;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,297 :: 		}
IT	AL
BAL	L_main67
;XRotor.c,286 :: 		else if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
L__main209:
L__main208:
L__main207:
L__main206:
L__main205:
L__main204:
;XRotor.c,301 :: 		else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2601
CMP	R1, R0
IT	CC
BCC	L__main215
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #4095
CMP	R1, R0
IT	HI
BHI	L__main214
L__main146:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main213
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #2400
IT	HI
BHI	L__main212
L__main145:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main211
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main210
L__main144:
;XRotor.c,306 :: 		LEVI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,308 :: 		DESNI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,310 :: 		THRUSTER=ZARON;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,312 :: 		}
IT	AL
BAL	L_main75
;XRotor.c,301 :: 		else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
L__main215:
L__main214:
L__main213:
L__main212:
L__main211:
L__main210:
;XRotor.c,316 :: 		else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW>=3000)&&(SW2<=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main221
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2600
CMP	R1, R0
IT	HI
BHI	L__main220
L__main143:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__main219
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	HI
BHI	L__main218
L__main142:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main217
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main216
L__main141:
;XRotor.c,321 :: 		LEVI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,323 :: 		DESNI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,325 :: 		THRUSTER=ZARON;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,327 :: 		}
IT	AL
BAL	L_main83
;XRotor.c,316 :: 		else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW>=3000)&&(SW2<=3000))
L__main221:
L__main220:
L__main219:
L__main218:
L__main217:
L__main216:
;XRotor.c,331 :: 		else if((Y>=301&&Y<=2600)&&(X>=2401&&X<=4095)&&(SW>=3000)&&(SW2<=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main227
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2600
CMP	R1, R0
IT	HI
BHI	L__main226
L__main140:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2401
CMP	R1, R0
IT	CC
BCC	L__main225
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #4095
CMP	R1, R0
IT	HI
BHI	L__main224
L__main139:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main223
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main222
L__main138:
;XRotor.c,336 :: 		LEVI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,338 :: 		DESNI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,340 :: 		THRUSTER=ZARON;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,342 :: 		}
IT	AL
BAL	L_main91
;XRotor.c,331 :: 		else if((Y>=301&&Y<=2600)&&(X>=2401&&X<=4095)&&(SW>=3000)&&(SW2<=3000))
L__main227:
L__main226:
L__main225:
L__main224:
L__main223:
L__main222:
;XRotor.c,346 :: 		else if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__main233
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	HI
BHI	L__main232
L__main137:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main231
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #2400
IT	HI
BHI	L__main230
L__main136:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main229
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main228
L__main135:
;XRotor.c,351 :: 		LEVI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,353 :: 		DESNI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,355 :: 		THRUSTER=IZRON;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,357 :: 		}
IT	AL
BAL	L_main99
;XRotor.c,346 :: 		else if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
L__main233:
L__main232:
L__main231:
L__main230:
L__main229:
L__main228:
;XRotor.c,361 :: 		else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2601
CMP	R1, R0
IT	CC
BCC	L__main239
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #4095
CMP	R1, R0
IT	HI
BHI	L__main238
L__main134:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main237
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #2400
IT	HI
BHI	L__main236
L__main133:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main235
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main234
L__main132:
;XRotor.c,366 :: 		LEVI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,368 :: 		DESNI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,370 :: 		THRUSTER=IZRON;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,372 :: 		}
IT	AL
BAL	L_main107
;XRotor.c,361 :: 		else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
L__main239:
L__main238:
L__main237:
L__main236:
L__main235:
L__main234:
;XRotor.c,375 :: 		else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW<=3000)&&(SW2>=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #301
CMP	R1, R0
IT	CC
BCC	L__main245
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2600
CMP	R1, R0
IT	HI
BHI	L__main244
L__main131:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__main243
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	HI
BHI	L__main242
L__main130:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main241
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main240
L__main129:
;XRotor.c,380 :: 		LEVI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,382 :: 		DESNI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,384 :: 		THRUSTER=IZRON;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,386 :: 		}
IT	AL
BAL	L_main115
;XRotor.c,375 :: 		else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW<=3000)&&(SW2>=3000))
L__main245:
L__main244:
L__main243:
L__main242:
L__main241:
L__main240:
;XRotor.c,388 :: 		else if((Y>=0&&Y<=300)&&(X>=2401&&X<=4096)&&(SW<=3000)&&(SW2>=3000))
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	CC
BCC	L__main251
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	HI
BHI	L__main250
L__main128:
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R1, [R0, #0]
MOVW	R0, #2401
CMP	R1, R0
IT	CC
BCC	L__main249
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
CMP	R0, #4096
IT	HI
BHI	L__main248
L__main127:
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	HI
BHI	L__main247
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #3000
CMP	R1, R0
IT	CC
BCC	L__main246
L__main126:
;XRotor.c,393 :: 		LEVI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,395 :: 		DESNI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,397 :: 		THRUSTER=IZRON;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,399 :: 		}
IT	AL
BAL	L_main123
;XRotor.c,388 :: 		else if((Y>=0&&Y<=300)&&(X>=2401&&X<=4096)&&(SW<=3000)&&(SW2>=3000))
L__main251:
L__main250:
L__main249:
L__main248:
L__main247:
L__main246:
;XRotor.c,405 :: 		LEVI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;XRotor.c,407 :: 		DESNI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;XRotor.c,409 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;XRotor.c,411 :: 		}
L_main123:
L_main115:
L_main107:
L_main99:
L_main91:
L_main83:
L_main75:
L_main67:
L_main59:
L_main51:
L_main43:
L_main35:
L_main27:
L_main19:
;XRotor.c,420 :: 		PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;XRotor.c,422 :: 		PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;XRotor.c,424 :: 		PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;XRotor.c,449 :: 		WordToStr(Y,adc_Y);//Y-gamepad
ADD	R1, SP, #10
MOVW	R0, #lo_addr(_Y+0)
MOVT	R0, #hi_addr(_Y+0)
LDRH	R0, [R0, #0]
BL	_WordToStr+0
;XRotor.c,451 :: 		WordToStr(X,adc_X);//X-gamepad
ADD	R1, SP, #0
MOVW	R0, #lo_addr(_X+0)
MOVT	R0, #hi_addr(_X+0)
LDRH	R0, [R0, #0]
BL	_WordToStr+0
;XRotor.c,453 :: 		WordToStr(SW,adc_SW);//SW-gamepad button
ADD	R1, SP, #20
MOVW	R0, #lo_addr(_SW+0)
MOVT	R0, #hi_addr(_SW+0)
LDRH	R0, [R0, #0]
BL	_WordToStr+0
;XRotor.c,455 :: 		WordToStr(SW2,adc_SW2);//SW2-gamepad button
ADD	R1, SP, #30
MOVW	R0, #lo_addr(_SW2+0)
MOVT	R0, #hi_addr(_SW2+0)
LDRH	R0, [R0, #0]
BL	_WordToStr+0
;XRotor.c,460 :: 		WordToStr(LEVI,pwm_LEVI);// levi motor
ADD	R1, SP, #40
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
LDRH	R0, [R0, #0]
BL	_WordToStr+0
;XRotor.c,462 :: 		WordToStr(DESNI,pwm_DESNI);// desni motor
ADD	R1, SP, #50
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
BL	_WordToStr+0
;XRotor.c,464 :: 		WordToStr(THRUSTER,pwm_THRUSTER);// thruster
ADD	R1, SP, #60
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
BL	_WordToStr+0
;XRotor.c,475 :: 		UART4_Write_Text("\tY:");
MOVW	R0, #lo_addr(?lstr1_XRotor+0)
MOVT	R0, #hi_addr(?lstr1_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,476 :: 		UART4_Write_Text(adc_Y);
ADD	R0, SP, #10
BL	_UART4_Write_Text+0
;XRotor.c,477 :: 		UART4_Write_Text("\n");
MOVW	R0, #lo_addr(?lstr2_XRotor+0)
MOVT	R0, #hi_addr(?lstr2_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,479 :: 		UART4_Write_Text("\tX:");
MOVW	R0, #lo_addr(?lstr3_XRotor+0)
MOVT	R0, #hi_addr(?lstr3_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,480 :: 		UART4_Write_Text(adc_X);
ADD	R0, SP, #0
BL	_UART4_Write_Text+0
;XRotor.c,481 :: 		UART4_Write_Text("\n");
MOVW	R0, #lo_addr(?lstr4_XRotor+0)
MOVT	R0, #hi_addr(?lstr4_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,483 :: 		UART4_Write_Text("\tSW:");
MOVW	R0, #lo_addr(?lstr5_XRotor+0)
MOVT	R0, #hi_addr(?lstr5_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,484 :: 		UART4_Write_Text(adc_SW);
ADD	R0, SP, #20
BL	_UART4_Write_Text+0
;XRotor.c,485 :: 		UART4_Write_Text("\n");
MOVW	R0, #lo_addr(?lstr6_XRotor+0)
MOVT	R0, #hi_addr(?lstr6_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,487 :: 		UART4_Write_Text("\tSW2:");
MOVW	R0, #lo_addr(?lstr7_XRotor+0)
MOVT	R0, #hi_addr(?lstr7_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,488 :: 		UART4_Write_Text(adc_SW2);
ADD	R0, SP, #30
BL	_UART4_Write_Text+0
;XRotor.c,489 :: 		UART4_Write_Text("\n\n");
MOVW	R0, #lo_addr(?lstr8_XRotor+0)
MOVT	R0, #hi_addr(?lstr8_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,493 :: 		UART4_Write_Text("\tLEVI:");
MOVW	R0, #lo_addr(?lstr9_XRotor+0)
MOVT	R0, #hi_addr(?lstr9_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,494 :: 		UART4_Write_Text(pwm_LEVI);
ADD	R0, SP, #40
BL	_UART4_Write_Text+0
;XRotor.c,495 :: 		UART4_Write_Text("\n");
MOVW	R0, #lo_addr(?lstr10_XRotor+0)
MOVT	R0, #hi_addr(?lstr10_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,497 :: 		UART4_Write_Text("\tDESNI:");
MOVW	R0, #lo_addr(?lstr11_XRotor+0)
MOVT	R0, #hi_addr(?lstr11_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,498 :: 		UART4_Write_Text(pwm_DESNI);
ADD	R0, SP, #50
BL	_UART4_Write_Text+0
;XRotor.c,499 :: 		UART4_Write_Text("\n");
MOVW	R0, #lo_addr(?lstr12_XRotor+0)
MOVT	R0, #hi_addr(?lstr12_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,501 :: 		UART4_Write_Text("\tTHRUSTER:");
MOVW	R0, #lo_addr(?lstr13_XRotor+0)
MOVT	R0, #hi_addr(?lstr13_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,502 :: 		UART4_Write_Text(pwm_THRUSTER);
ADD	R0, SP, #60
BL	_UART4_Write_Text+0
;XRotor.c,503 :: 		UART4_Write_Text("\n\n");
MOVW	R0, #lo_addr(?lstr14_XRotor+0)
MOVT	R0, #hi_addr(?lstr14_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,505 :: 		UART4_Write_Text("---------------P O D M O R N I C A---------------");
MOVW	R0, #lo_addr(?lstr15_XRotor+0)
MOVT	R0, #hi_addr(?lstr15_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,506 :: 		UART4_Write_Text("\n\n");
MOVW	R0, #lo_addr(?lstr16_XRotor+0)
MOVT	R0, #hi_addr(?lstr16_XRotor+0)
BL	_UART4_Write_Text+0
;XRotor.c,508 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main124:
SUBS	R7, R7, #1
BNE	L_main124
NOP
NOP
NOP
;XRotor.c,513 :: 		}
IT	AL
BAL	L_main10
;XRotor.c,514 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
