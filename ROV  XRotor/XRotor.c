/*
                ---- MikroROV ---


  * autor Milos Petakovic
  * 
  * Test konfiguracija:
              * MCU: STM32F407VG
               * Dev.Board: Clicker2 for STM32
                * Oscillator: PLL_25_to_150 MHz
                * 3xXROTOR-ESC,W.DZ.PC modifikovan gamepad

  * SW: MikroC PRO for ARM v5.1.0

*Ovo je NAJRANIJA verzija programa

 *Omogucava upravljanje i pracenje parametara upravljanja.
	

//**************************************************************************
  **************************************************************************
  **************************************************************************/

  #define  INIT  0x993
  #define  NAPRED  2650

  #define  NAZAD  2310
  #define LEVO    2650

  #define DESNO   2310
  #define  ZARON  2650

  #define  IZRON  2310
  #define  STOP   0X995



//****************************************************************************

   unsigned int LEVI,pwm_period,Y;
   
   unsigned int DESNI,X;
   
   unsigned int THRUSTER,SW,SW2;

//******************************************************************************
//********************************FUNKCIJE*************************************

//******************************************************************************
  
  //3x PWM za MOTORE (Levi,Desni,Thruster)
  
  //4x ADC za X,Y,SW,SW2 dzojstika
  
  //UART za monitoring PWM i ADC vrednosti




//******************************************************************************


//--------------------------------LEVI------------------------------------------


void init_LEVI()
{
     pwm_period = PWM_TIM4_Init(50);
     PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);

}

//--------------------------------DESNI-----------------------------------------


void init_DESNI()
{
     pwm_period = PWM_TIM3_Init(50);
     PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PB0);

}

//--------------------------------THRUSTER--------------------------------------


void init_THRUSTER()
{
     pwm_period = PWM_TIM4_Init(50);
     PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);

}

//-------------------------------UART-------------------------------------------

void init_UART()
{
     UART4_Init_Advanced(9600,_UART_8_BIT_DATA,
     _UART_NOPARITY,
     _UART_ONE_STOPBIT,
     &_GPIO_MODULE_UART4_PA01);
             Delay_ms(100);
}

//------------------------------------ADC---------------------------------------

void init_ADC()
{
    ADC_Set_Input_Channel(_ADC_CHANNEL_10|
                          _ADC_CHANNEL_11|
                          _ADC_CHANNEL_12|
                          _ADC_CHANNEL_13);

     ADC1_Init();
}





//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//******************** G L A V N I   P R O G R A M *****************************
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>


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




//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

init_LEVI();
PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL4);
                    Delay_ms(2000);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

init_DESNI();
PWM_TIM3_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
                   Delay_ms(2000);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

init_THRUSTER();
PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
                    Delay_ms(2000);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


init_ADC();
init_UART();
Delay_ms(100);


 while(1){


       Y= ADC1_Get_Sample(11);
       X= ADC1_Get_Sample(10);
       
       SW = ADC1_Get_Sample(12);
       SW2 = ADC1_Get_Sample(13);



//==============================================================================
//==============================================================================


     if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW<=3000 )&&(SW2<=3000))
     {

                 // --- NAPRED ---

                 LEVI=NAPRED;
                 
                 DESNI=NAPRED;
                 
                 THRUSTER=STOP;


     }

//==============================================================================

     else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2<=3000))
     {

                 // --- NAZAD ---

                 LEVI=NAZAD;
                 
                 DESNI=NAZAD;
                 
                 THRUSTER=STOP;



     }

//==============================================================================

     else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW<=3000)&&(SW2<=3000))
     {

               // --- LEVO ---

                 LEVI=LEVO;
                 
                 DESNI=DESNO;
                 
                 THRUSTER=STOP;

     }

//==============================================================================

     else if((Y>=301&&Y<=2600)&&(X>=2401&&X<=4095)&&(SW<=3000)&&(SW2<=3000))
     {

                 // --- DESNO ---

                 LEVI=DESNO;
                 
                 DESNI=LEVO;
                 
                 THRUSTER=STOP;

     }

//==============================================================================

     else if((Y>=301&&Y<=2600)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
     {

                 // --- ZARON ---

                 LEVI=STOP;
                 
                 DESNI=STOP;
                 
                 THRUSTER=ZARON;

     }

//==============================================================================

     else if((Y>=301&&Y<=2600)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
     {

                  // --- IZRON ---

                  LEVI=STOP;
                  
                  DESNI=STOP;
                  
                  THRUSTER=IZRON;

     }

//==============================================================================

     else if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
     {

                  // --- ZARNO NAPRED ---

                  LEVI=NAPRED;
                  
                  DESNI=NAPRED;
                  
                  THRUSTER=ZARON;

     }

//==============================================================================

     else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW>=3000)&&(SW2<=3000))
     {

                 // --- ZARON NAZAD ---

                 LEVI=NAZAD;
                 
                 DESNI=NAZAD;
                 
                 THRUSTER=ZARON;

     }

//==============================================================================

     else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW>=3000)&&(SW2<=3000))
     {

                  // --- ZARON LEVO ---

                  LEVI=LEVO;
                  
                  DESNI=DESNO;
                 
                  THRUSTER=ZARON;

     }

//==============================================================================

     else if((Y>=301&&Y<=2600)&&(X>=2401&&X<=4095)&&(SW>=3000)&&(SW2<=3000))
     {

                   // --- ZARON DESNO ---

                   LEVI=DESNO;
                   
                   DESNI=LEVO;
                   
                   THRUSTER=ZARON;

     }

//==============================================================================

     else if((Y>=0&&Y<=300)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
     {

                   // --- IZRON NAPRED ---

                   LEVI=NAPRED;
                   
                   DESNI=NAPRED;
                   
                   THRUSTER=IZRON;

     }

//==============================================================================

     else if((Y>=2601&&Y<=4095)&&(X>=301&&X<=2400)&&(SW<=3000)&&(SW2>=3000))
     {

                   // --- IZRON NAZAD ---

                   LEVI=NAZAD;
                   
                   DESNI=NAZAD;
                   
                   THRUSTER=IZRON;

     }

//==============================================================================
     else if((Y>=301&&Y<=2600)&&(X>=0&&X<=300)&&(SW<=3000)&&(SW2>=3000))
     {

                   // --- IZRON LEVO ---

                   LEVI=LEVO;
                   
                   DESNI=DESNO;
                   
                   THRUSTER=IZRON;

     }

     else if((Y>=0&&Y<=300)&&(X>=2401&&X<=4096)&&(SW<=3000)&&(SW2>=3000))
     {

                   // --- IZRON DESNO ---

                   LEVI=DESNO;
                   
                   DESNI=LEVO;
                  
                   THRUSTER=IZRON;

     }

      else  {

                   // --- STOP ---

                   LEVI=STOP;
                   
                   DESNI=STOP;
                   
                   THRUSTER=STOP;

              }

//==============================================================================



//---------------------- UPIS PWM VREDNOSTI ------------------------------------


       PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

       PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);





//==============================================================================

//                              PRACENJE STANJA

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//--------------------------------KONVERZIJA------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//               - Konverzija za ispis na  [ U A R T ]8bit -

//                *ADC  12-bit ( 0-4095 )
//                *PWM je 16-bit  ( 0-65535)

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



      WordToStr(Y,adc_Y);//Y-gamepad

      WordToStr(X,adc_X);//X-gamepad

      WordToStr(SW,adc_SW);//SW-gamepad button

      WordToStr(SW2,adc_SW2);//SW2-gamepad button




     WordToStr(LEVI,pwm_LEVI);// levi motor

     WordToStr(DESNI,pwm_DESNI);// desni motor

     WordToStr(THRUSTER,pwm_THRUSTER);// thruster



//******************************************************************************




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

//..............................................................................

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

////////////////////////////////////////////////////////////////////////////////
//
//                           - K R A J -
//
////////////////////////////////////////////////////////////////////////////////