﻿//+------------------------------------------------------------------+
//|                                             PythonTestExpert.mq5 |
//|                                                 w_1 |     
//|                                                                  |
//+------------------------------------------------------------------+

#property version   "1.00"
#property strict

int handleInput;

double Stochastic0[];
double Stochastic1[];
double CCI_Open[];
double CCI_Low[];
double CCI_High[];
double Momentum_Open[];
double Momentum_Low[];
double Momentum_High[];
double RSI_Open[];
double RSI_Low[];
double RSI_High[];
double WPR[];
double MACD_Open[];
double MACD_Low[];
double MACD_High[];
double OsMA_Open[];
double OsMA_Low[];
double OsMA_High[];
double TriX_Open[];
double TriX_Low[];
double TriX_High[];
double BearsPower[];
double BullsPower[];
double ADX_MINUSDI[];
double ADX_PLUSDI[];
double StdDev_Open[];
double StdDev_Low[];
double StdDev_High[];
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   handleInput=FileOpen("EU50_2_10min.csv",FILE_CSV|FILE_WRITE|FILE_SHARE_READ|FILE_ANSI|FILE_COMMON,";");//Symbol()+
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   FileClose(handleInput);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   MqlDateTime stm;
   TimeToStruct(TimeCurrent(),stm);
//------ Дневной минимум
   int k=iBars(NULL,PERIOD_H1)-1;
//----------------------------------------------------
 int i = 0;                         
//MqlDateTime stm;
datetime tm=TimeCurrent(stm);
//--- вывод компонентов даты
Alert( "Год:         " + ( string ) stm.year);
Alert( "Месяц:       " + ( string ) stm.mon);
Alert( "Число:       " + ( string ) stm.day);
Alert( "Час:         " + ( string ) stm.hour);
Alert( "Минута:      " + ( string ) stm.min);
Alert( "Секунда:     " + ( string ) stm.sec);
Alert( "День недели: " + ( string ) stm.day_of_week);
Alert( "День года:   " + ( string ) stm.day_of_year);




   int Stochastic_handle=iStochastic(NULL,PERIOD_H1,5,3,3,MODE_SMA,STO_LOWHIGH);
   CopyBuffer(Stochastic_handle,0,0,k,Stochastic0);
   CopyBuffer(Stochastic_handle,1,0,k,Stochastic1);
   ArraySetAsSeries(Stochastic0,true);
   ArraySetAsSeries(Stochastic1,true);

   int CCI_Open_handle=iCCI(NULL,PERIOD_H1,14,PRICE_OPEN);
   CopyBuffer(CCI_Open_handle,0,0,k,CCI_Open);
   ArraySetAsSeries(CCI_Open,true);

   int CCI_Low_handle=iCCI(NULL,PERIOD_H1,14,PRICE_LOW);
   CopyBuffer(CCI_Low_handle,0,0,k,CCI_Low);
   ArraySetAsSeries(CCI_Low,true);

   int Momentum_Open_handle=iMomentum(NULL,PERIOD_H1,14,PRICE_OPEN);
   CopyBuffer(Momentum_Open_handle,0,0,k,Momentum_Open);
   ArraySetAsSeries(Momentum_Open,true);

   int Momentum_Low_handle=iMomentum(NULL,PERIOD_H1,14,PRICE_LOW);
   CopyBuffer(Momentum_Low_handle,0,0,k,Momentum_Low);
   ArraySetAsSeries(Momentum_Low,true);

   int RSI_Open_handle=iRSI(NULL,PERIOD_H1,14,PRICE_OPEN);
   CopyBuffer(RSI_Open_handle,0,0,k,RSI_Open);
   ArraySetAsSeries(RSI_Open,true);

   int RSI_Low_handle=iRSI(NULL,PERIOD_H1,14,PRICE_LOW);
   CopyBuffer(RSI_Low_handle,0,0,k,RSI_Low);
   ArraySetAsSeries(RSI_Low,true);

   int WPR_handle=iWPR(NULL,PERIOD_H1,14);
   CopyBuffer(WPR_handle,0,0,k,WPR);
   ArraySetAsSeries(WPR,true);

   int MACD_Open_handle=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_OPEN);
   CopyBuffer(MACD_Open_handle,0,0,k,MACD_Open);
   ArraySetAsSeries(MACD_Open,true);

   int MACD_Low_handle=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_LOW);
   CopyBuffer(MACD_Low_handle,0,0,k,MACD_Low);
   ArraySetAsSeries(MACD_Low,true);

   int OsMA_Open_handle=iOsMA(NULL,PERIOD_H1,12,26,9,PRICE_OPEN);
   CopyBuffer(OsMA_Open_handle,0,0,k,OsMA_Open);
   ArraySetAsSeries(OsMA_Open,true);

   int OsMA_Low_handle=iOsMA(NULL,PERIOD_H1,12,26,9,PRICE_LOW);
   CopyBuffer(OsMA_Low_handle,0,0,k,OsMA_Low);
   ArraySetAsSeries(OsMA_Low,true);

   int TriX_Open_handle=iTriX(NULL,PERIOD_H1,14,PRICE_OPEN);
   CopyBuffer(TriX_Open_handle,0,0,k,TriX_Open);
   ArraySetAsSeries(TriX_Open,true);

   int TriX_Low_handle=iTriX(NULL,PERIOD_H1,14,PRICE_LOW);
   CopyBuffer(TriX_Low_handle,0,0,k,TriX_Low);
   ArraySetAsSeries(TriX_Low,true);

   int BearsPower_handle=iBearsPower(NULL,PERIOD_H1,13);
   CopyBuffer(BearsPower_handle,0,0,k,BearsPower);
   ArraySetAsSeries(BearsPower,true);

   int ADX_MINUSDI_handle=iADX(NULL,PERIOD_H1,14);
   CopyBuffer(ADX_MINUSDI_handle,2,0,k,ADX_MINUSDI);
   ArraySetAsSeries(ADX_MINUSDI,true);

   int StdDev_Open_handle=iStdDev(NULL,PERIOD_H1,20,0,MODE_SMA,PRICE_OPEN);
   CopyBuffer(StdDev_Open_handle,0,0,k,StdDev_Open);
   ArraySetAsSeries(StdDev_Open,true);

   int StdDev_Low_handle=iStdDev(NULL,PERIOD_H1,20,0,MODE_SMA,PRICE_LOW);
   CopyBuffer(StdDev_Low_handle,0,0,k,StdDev_Low);
   ArraySetAsSeries(StdDev_Low,true);
   
     int CCI_High_handle=iCCI(NULL,PERIOD_H1,14,PRICE_HIGH);
   CopyBuffer(CCI_High_handle,0,0,k,CCI_High);
   ArraySetAsSeries(CCI_High,true);

   int Momentum_High_handle=iMomentum(NULL,PERIOD_H1,14,PRICE_HIGH);
   CopyBuffer(Momentum_High_handle,0,0,k,Momentum_High);
   ArraySetAsSeries(Momentum_High,true);

   int RSI_High_handle=iRSI(NULL,PERIOD_H1,14,PRICE_HIGH);
   CopyBuffer(RSI_High_handle,0,0,k,RSI_High);
   ArraySetAsSeries(RSI_High,true);

   int MACD_High_handle=iMACD(NULL,PERIOD_H1,12,26,9,PRICE_HIGH);
   CopyBuffer(MACD_High_handle,0,0,k,MACD_High);
   ArraySetAsSeries(MACD_High,true);

   int OsMA_High_handle=iOsMA(NULL,PERIOD_H1,12,26,9,PRICE_HIGH);
   CopyBuffer(OsMA_High_handle,0,0,k,OsMA_High);
   ArraySetAsSeries(OsMA_High,true);

   int TriX_High_handle=iTriX(NULL,PERIOD_H1,14,PRICE_HIGH);
   CopyBuffer(TriX_High_handle,0,0,k,TriX_High);
   ArraySetAsSeries(TriX_High,true);

   int BullsPower_handle=iBullsPower(NULL,PERIOD_H1,13);
   CopyBuffer(BullsPower_handle,0,0,k,BullsPower);
   ArraySetAsSeries(BullsPower,true);

   int ADX_PLUSDI_handle=iADX(NULL,PERIOD_H1,14);
   CopyBuffer(ADX_PLUSDI_handle,1,0,k,ADX_PLUSDI);
   ArraySetAsSeries(ADX_PLUSDI,true);

   int StdDev_High_handle=iStdDev(NULL,PERIOD_H1,20,0,MODE_SMA,PRICE_HIGH);
   CopyBuffer(StdDev_High_handle,0,0,k,StdDev_High);
   ArraySetAsSeries(StdDev_High,true);
                 
int wert =1;
{

if
(
((stm.min== 0 )  && ( stm.sec == 0))|| 
((stm.min== 10 ) && ( stm.sec == 0))||
((stm.min== 20 ) && ( stm.sec == 0))||
((stm.min== 30 ) && ( stm.sec == 0))||
((stm.min== 40 ) && ( stm.sec == 0))||
((stm.min== 50 ) && ( stm.sec == 0))
)

     FileWrite(handleInput
                          ,TimeCurrent() 
                          ,StdDev_Open[0]                  
                          ,iClose  (NULL,PERIOD_M10,0) 
                          ,Stochastic0[0]
                          ,Stochastic1[0]                                       
                          ,CCI_Open[0]
                          ,Momentum_Open[0]
                          ,RSI_Open[0]
                          ,WPR[0]
                          ,OsMA_Open[0]
                          ,TriX_Open[0]
                          ,BearsPower[0]                                                    
                          );
}// filewrite(handledate,timecurrent());timecurrent()
}
//+------------------------------------------------------------------+
