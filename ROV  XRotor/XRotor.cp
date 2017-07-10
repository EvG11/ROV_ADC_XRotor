#line 1 "C:/Users/Vukica/Desktop/ROV mikroC/ROV  XRotor/XRotor.c"
#line 39 "C:/Users/Vukica/Desktop/ROV mikroC/ROV  XRotor/XRotor.c"
 unsigned int LEVI,pwm_period,Y;

 unsigned int DESNI,X;

 unsigned int THRUSTER,SW,SW2;
#line 65 "C:/Users/Vukica/Desktop/ROV mikroC/ROV  XRotor/XRotor.c"
void init_LEVI()
{
 pwm_period = PWM_TIM4_Init(50);
 PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);

}




void init_DESNI()
{
 pwm_period = PWM_TIM3_Init(50);
 PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PB0);

}




void init_THRUSTER()
{
 pwm_period = PWM_TIM4_Init(50);
 PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);

}



void init_UART()
{
 UART4_Init_Advanced(9600,_UART_8_BIT_DATA,
 _UART_NOPARITY,
 _UART_ONE_STOPBIT,
 &_GPIO_MODULE_UART4_PA01);
 Delay_ms(100);
}



void init_ADC()
{
 ADC_Set_Input_Channel(_ADC_CHANNEL_10|
 _ADC_CHANNEL_11|
 _ADC_CHANNEL_12|
 _ADC_CHANNEL_13);

 ADC1_Init();
}
#line 128 "C:/Users/Vukica/Desktop/ROV mikroC/ROV  XRotor/XRotor.c"
void main(){

char adc_X[10];
char adc_Y[10];

char adc_SW[10];
char adc_SW2[10];

char pwm_LEVI[10];
char pwm_DESNI[10];
char pwm_THRUSTER[10];



GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);

GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);

GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_12);








init_LEVI();
PWM_TIM4_Set_Duty( 0x993 ,_PWM_NON_INVERTED, _PWM_CHANNEL4);
 Delay_ms(2000);


init_DESNI();
PWM_TIM3_Set_Duty( 0x993 ,_PWM_NON_INVERTED, _PWM_CHANNEL3);
 Delay_ms(2000);



init_THRUSTER();
PWM_TIM4_Set_Duty( 0x993 ,_PWM_NON_INVERTED, _PWM_CHANNEL3);
 Delay_ms(2000);




init_ADC();
init_UART();
Delay_ms(100);


 while(1){


 Y= ADC1_Get_Sample(11);
 X= ADC1_Get_Sample(10);

 SW = ADC1_Get_Sample(12);
 SW2 = ADC1_Get_Sample(13);







 if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW<=3000 )&&(SW2<=3000))
 {



 LEVI= 2650 ;

 DESNI= 2650 ;

 THRUSTER= 0X995 ;


 }



 else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2<=3000))
 {



 LEVI= 2310 ;

 DESNI= 2310 ;

 THRUSTER= 0X995 ;



 }



 else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW<=3000)&&(SW2<=3000))
 {



 LEVI= 2650 ;

 DESNI= 2310 ;

 THRUSTER= 0X995 ;

 }



 else if((Y>=301&&Y<=2600)&&(X>=2401&&X<=4095)&&(SW<=3000)&&(SW2<=3000))
 {



 LEVI= 2310 ;

 DESNI= 2650 ;

 THRUSTER= 0X995 ;

 }



 else if((Y>=301&&Y<=2600)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
 {



 LEVI= 0X995 ;

 DESNI= 0X995 ;

 THRUSTER= 2650 ;

 }



 else if((Y>=301&&Y<=2600)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
 {



 LEVI= 0X995 ;

 DESNI= 0X995 ;

 THRUSTER= 2310 ;

 }



 else if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
 {



 LEVI= 2650 ;

 DESNI= 2650 ;

 THRUSTER= 2650 ;

 }



 else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
 {



 LEVI= 2310 ;

 DESNI= 2310 ;

 THRUSTER= 2650 ;

 }



 else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW>=3000)&&(SW2<=3000))
 {



 LEVI= 2650 ;

 DESNI= 2310 ;

 THRUSTER= 2650 ;

 }



 else if((Y>=301&&Y<=2600)&&(X>=2401&&X<=4095)&&(SW>=3000)&&(SW2<=3000))
 {



 LEVI= 2310 ;

 DESNI= 2650 ;

 THRUSTER= 2650 ;

 }



 else if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
 {



 LEVI= 2650 ;

 DESNI= 2650 ;

 THRUSTER= 2310 ;

 }



 else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
 {



 LEVI= 2310 ;

 DESNI= 2310 ;

 THRUSTER= 2310 ;

 }


 else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW<=3000)&&(SW2>=3000))
 {



 LEVI= 2650 ;

 DESNI= 2310 ;

 THRUSTER= 2310 ;

 }

 else if((Y>=0&&Y<=300)&&(X>=2401&&X<=4096)&&(SW<=3000)&&(SW2>=3000))
 {



 LEVI= 2310 ;

 DESNI= 2650 ;

 THRUSTER= 2310 ;

 }

 else {



 LEVI= 0X995 ;

 DESNI= 0X995 ;

 THRUSTER= 0X995 ;

 }








 PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

 PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

 PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
#line 449 "C:/Users/Vukica/Desktop/ROV mikroC/ROV  XRotor/XRotor.c"
 WordToStr(Y,adc_Y);

 WordToStr(X,adc_X);

 WordToStr(SW,adc_SW);

 WordToStr(SW2,adc_SW2);




 WordToStr(LEVI,pwm_LEVI);

 WordToStr(DESNI,pwm_DESNI);

 WordToStr(THRUSTER,pwm_THRUSTER);










 UART4_Write_Text("\tY:");
 UART4_Write_Text(adc_Y);
 UART4_Write_Text("\n");

 UART4_Write_Text("\tX:");
 UART4_Write_Text(adc_X);
 UART4_Write_Text("\n");

 UART4_Write_Text("\tSW:");
 UART4_Write_Text(adc_SW);
 UART4_Write_Text("\n");

 UART4_Write_Text("\tSW2:");
 UART4_Write_Text(adc_SW2);
 UART4_Write_Text("\n\n");



 UART4_Write_Text("\tLEVI:");
 UART4_Write_Text(pwm_LEVI);
 UART4_Write_Text("\n");

 UART4_Write_Text("\tDESNI:");
 UART4_Write_Text(pwm_DESNI);
 UART4_Write_Text("\n");

 UART4_Write_Text("\tTHRUSTER:");
 UART4_Write_Text(pwm_THRUSTER);
 UART4_Write_Text("\n\n");

 UART4_Write_Text("---------------P O D M O R N I C A---------------");
 UART4_Write_Text("\n\n");

 Delay_ms(2000);




 }
}
