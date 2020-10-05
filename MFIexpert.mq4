
input int sellstart = 80; //vorud sell
input int sellend = 30; //exit sell
input int buystart = 20; //vorud buy
input int buyend = 70; //exit buy
input double acceptedshib = 0;
input int MFI_Period = 20;

input double lotSize1 = 0.01;
input double lotSize2 = 0.02;
input double lotSize3 = 0.03;
input double lotSize4 = 0.04;
input double lotSize5 = 0.05;
input double lotSize6 = 0.06;
input double lotSize7 = 0.07;
input double lotSize8 = 0.08;

input int pipDiff2 = 200;
input int pipDiff3 = 300;
input int pipDiff4 = 400;
input int pipDiff5 = 500;
input int pipDiff6 = 600;
input int pipDiff7 = 600;
input int pipDiff8 = 600;

int b1 = 0;
int b2 = 0;
int b3 = 0;
int b4 = 0;
int b5 = 0;
int b6 = 0;
int b7 = 0;
int b8 = 0;

int s1 = 0;
int s2 = 0;
int s3 = 0;
int s4 = 0;
int s5 = 0;
int s6 = 0;
int s7 = 0;
int s8 = 0;



int OnInit()  { return(INIT_SUCCEEDED);}
void OnDeinit(const int reason) { }

//+------------------------------------------------------------------+
void OnTick()
  {

      if (buyCondition()) { enterbuys(); Alert("buy blue line" + getblueline()); Alert("buy previous blue line" + getPrevblueline()); }
      if (sellCondition()) { entersells(); Alert("sell blue line " + getblueline()); Alert("sell previous blue line " + getPrevblueline()); }
      if (exitbuycond()) { closebuys(); }
      if (exitsellcond()) { closesells(); }
      if (Counter("b") > 0) { buymartingle(); }
      if (Counter("s") > 0) { sellmartingle(); }
   
  }
//+------------------------------functions------------------------------------+

//+--------------------------------Counter------------------------------------+
int Counter(string Counted) {
      int buys = 0;
      int sells = 0;
      for (int i = OrdersTotal() -1 ; i>= 0 ; i--) {
            if (OrderSelect(i,SELECT_BY_POS)) {
                  if (OrderTicket() == b1) { buys++; }
                  else if (OrderTicket() == b2) { buys++; }
                  else if (OrderTicket() == b3) { buys++; }
                  else if (OrderTicket() == b4) { buys++; }
                  else if (OrderTicket() == b5) { buys++; }
                  else if (OrderTicket() == b6) { buys++; }
                  else if (OrderTicket() == b7) { buys++; }
                  else if (OrderTicket() == b8) { buys++; }
                  else if (OrderTicket() == s1) { sells++; }
                  else if (OrderTicket() == s2) { sells++; }
                  else if (OrderTicket() == s3) { sells++; }
                  else if (OrderTicket() == s4) { sells++; }
                  else if (OrderTicket() == s5) { sells++; }
                  else if (OrderTicket() == s6) { sells++; }
                  else if (OrderTicket() == s7) { sells++; }
                  else if (OrderTicket() == s8) { sells++; }
            }
      }
      if ( Counted == "b" ) { return buys; }
      else if (Counted == "s") { return sells; } 
      else { return 0; }

}
//+-------------------------------enter conditions-----------------------------------+
bool buyCondition() {
   if (((getblueline() - buystart < 0.2) && (getblueline() - buystart > -0.2) ) && Counter("b") == 0 && shib() > acceptedshib) { return true; } else { return false; }
}

bool sellCondition() {
   if (  ((getblueline() - sellstart < 0.2) && (getblueline() - sellstart > -0.2) ) && Counter("s") == 0 && shib() < -acceptedshib) { return true; } else { return false; }
}
//+-------------------------------exit conditions-----------------------------------+
bool exitbuycond() {
   if (getblueline() >= buyend && Counter("b") > 0) { return true; } else { return false; }
}
bool exitsellcond() {
   if (getblueline() <= sellend && Counter("s") > 0) { return true; } else { return false; }
}

//+-------------------------------calculations-----------------------------------+
double getblueline() {
      return iMFI(NULL,0,MFI_Period,0);
}

double getPrevblueline() {
      return iMFI(NULL,0,MFI_Period,1);
}


double shib() {
   return getblueline() - getPrevblueline();

}
//+---------------------------------entering---------------------------------+
void enterbuys() {
   b1 = OrderSend(NULL,0,lotSize1,Ask,0,0,0,NULL,0,0,clrGreen);
   if (b1 < 0) { Alert("OrderSend Error: " + GetLastError()); }
}

void entersells() {
   s1 = OrderSend(NULL,1,lotSize1,Bid,0,0,0,NULL,0,0,clrRed);
   if (s1 < 0 ) { Alert("OrderSend Error: " + GetLastError()); }
}
//+--------------------------------exiting ----------------------------------+
void closesells() {
   if (OrderSelect(s1,SELECT_BY_TICKET)) { if(!OrderClose(s1,lotSize1,Ask,0,clrRed)) { Alert("Order Close Error: " + GetLastError()); } else { s1 = 0; } }
   if (OrderSelect(s2,SELECT_BY_TICKET)) { if(!OrderClose(s2,lotSize2,Ask,0,clrRed)) { Alert("Order Close Error: " + GetLastError()); } else { s2 = 0; } }
   if (OrderSelect(s3,SELECT_BY_TICKET)) { if(!OrderClose(s3,lotSize3,Ask,0,clrRed)) { Alert("Order Close Error: " + GetLastError()); } else { s3 = 0; } }
   if (OrderSelect(s4,SELECT_BY_TICKET)) { if(!OrderClose(s4,lotSize4,Ask,0,clrRed)) { Alert("Order Close Error: " + GetLastError()); } else { s4 = 0; } }
   if (OrderSelect(s5,SELECT_BY_TICKET)) { if(!OrderClose(s5,lotSize5,Ask,0,clrRed)) { Alert("Order Close Error: " + GetLastError()); } else { s5 = 0; } }
   if (OrderSelect(s6,SELECT_BY_TICKET)) { if(!OrderClose(s6,lotSize6,Ask,0,clrRed)) { Alert("Order Close Error: " + GetLastError()); } else { s6 = 0; } }
   if (OrderSelect(s7,SELECT_BY_TICKET)) { if(!OrderClose(s7,lotSize7,Ask,0,clrRed)) { Alert("Order Close Error: " + GetLastError()); } else { s7 = 0; } }
   if (OrderSelect(s8,SELECT_BY_TICKET)) { if(!OrderClose(s8,lotSize8,Ask,0,clrRed)) { Alert("Order Close Error: " + GetLastError()); } else { s8 = 0; } }
}
void closebuys() {
   if (OrderSelect(b1,SELECT_BY_TICKET)) { if(!OrderClose(b1,lotSize1,Bid,0,clrGreen)) { Alert("Order Close Error: " + GetLastError()); } else { b1 = 0; } }
   if (OrderSelect(b2,SELECT_BY_TICKET)) { if(!OrderClose(b2,lotSize2,Bid,0,clrGreen)) { Alert("Order Close Error: " + GetLastError()); } else { b2 = 0; } }
   if (OrderSelect(b3,SELECT_BY_TICKET)) { if(!OrderClose(b3,lotSize3,Bid,0,clrGreen)) { Alert("Order Close Error: " + GetLastError()); } else { b3 = 0; } }
   if (OrderSelect(b4,SELECT_BY_TICKET)) { if(!OrderClose(b4,lotSize4,Bid,0,clrGreen)) { Alert("Order Close Error: " + GetLastError()); } else { b4 = 0; } }
   if (OrderSelect(b5,SELECT_BY_TICKET)) { if(!OrderClose(b5,lotSize5,Bid,0,clrGreen)) { Alert("Order Close Error: " + GetLastError()); } else { b5 = 0; } }
   if (OrderSelect(b6,SELECT_BY_TICKET)) { if(!OrderClose(b6,lotSize6,Bid,0,clrGreen)) { Alert("Order Close Error: " + GetLastError()); } else { b6 = 0; } }
   if (OrderSelect(b7,SELECT_BY_TICKET)) { if(!OrderClose(b7,lotSize7,Bid,0,clrGreen)) { Alert("Order Close Error: " + GetLastError()); } else { b7 = 0; } }
   if (OrderSelect(b8,SELECT_BY_TICKET)) { if(!OrderClose(b8,lotSize8,Bid,0,clrGreen)) { Alert("Order Close Error: " + GetLastError()); } else { b8 = 0; } }
}

//+--------------------------------martingle ----------------------------------+

void buymartingle() {
   switch (Counter("b")) {
   case 1: if(OrderSelect(b1,SELECT_BY_TICKET)) {if (OrderOpenPrice() - Ask >= pipDiff2 / 100) { b2 = OrderSend(NULL,0,lotSize2,Ask,0,0,0,NULL,0,0,clrGreen); }} 
   case 2: if(OrderSelect(b2,SELECT_BY_TICKET)) {if (OrderOpenPrice() - Ask >= pipDiff3 / 100) { b3 = OrderSend(NULL,0,lotSize3,Ask,0,0,0,NULL,0,0,clrGreen); }} 
   case 3: if(OrderSelect(b3,SELECT_BY_TICKET)) {if (OrderOpenPrice() - Ask >= pipDiff4 / 100) { b4 = OrderSend(NULL,0,lotSize4,Ask,0,0,0,NULL,0,0,clrGreen); }} 
   case 4: if(OrderSelect(b4,SELECT_BY_TICKET)) {if (OrderOpenPrice() - Ask >= pipDiff5 / 100) { b5 = OrderSend(NULL,0,lotSize5,Ask,0,0,0,NULL,0,0,clrGreen); }} 
   case 5: if(OrderSelect(b5,SELECT_BY_TICKET)) {if (OrderOpenPrice() - Ask >= pipDiff6 / 100) { b6 = OrderSend(NULL,0,lotSize6,Ask,0,0,0,NULL,0,0,clrGreen); }} 
   case 6: if(OrderSelect(b6,SELECT_BY_TICKET)) {if (OrderOpenPrice() - Ask >= pipDiff7 / 100) { b7 = OrderSend(NULL,0,lotSize7,Ask,0,0,0,NULL,0,0,clrGreen); }} 
   case 7: if(OrderSelect(b7,SELECT_BY_TICKET)) {if (OrderOpenPrice() - Ask >= pipDiff8 / 100) { b8 = OrderSend(NULL,0,lotSize8,Ask,0,0,0,NULL,0,0,clrGreen); }} 
   case 8: break;
   }
}

void sellmartingle() {
   switch (Counter("s")) {
   case 1: if(OrderSelect(s1,SELECT_BY_TICKET)) {if (Bid - OrderOpenPrice() >= pipDiff2 / 100) { s2 = OrderSend(NULL,1,lotSize2,Bid,0,0,0,NULL,0,0,clrRed); }} 
   case 2: if(OrderSelect(s2,SELECT_BY_TICKET)) {if (Bid - OrderOpenPrice() >= pipDiff3 / 100) { s3 = OrderSend(NULL,1,lotSize3,Bid,0,0,0,NULL,0,0,clrRed); }} 
   case 3: if(OrderSelect(s3,SELECT_BY_TICKET)) {if (Bid - OrderOpenPrice() >= pipDiff4 / 100) { s4 = OrderSend(NULL,1,lotSize4,Bid,0,0,0,NULL,0,0,clrRed); }} 
   case 4: if(OrderSelect(s4,SELECT_BY_TICKET)) {if (Bid - OrderOpenPrice() >= pipDiff5 / 100) { s5 = OrderSend(NULL,1,lotSize5,Bid,0,0,0,NULL,0,0,clrRed); }} 
   case 5: if(OrderSelect(s5,SELECT_BY_TICKET)) {if (Bid - OrderOpenPrice() >= pipDiff6 / 100) { s6 = OrderSend(NULL,1,lotSize6,Bid,0,0,0,NULL,0,0,clrRed); }} 
   case 6: if(OrderSelect(s6,SELECT_BY_TICKET)) {if (Bid - OrderOpenPrice() >= pipDiff7 / 100) { s7 = OrderSend(NULL,1,lotSize7,Bid,0,0,0,NULL,0,0,clrRed); }} 
   case 7: if(OrderSelect(s7,SELECT_BY_TICKET)) {if (Bid - OrderOpenPrice() >= pipDiff8 / 100) { s8 = OrderSend(NULL,1,lotSize8,Bid,0,0,0,NULL,0,0,clrRed); }} 
   case 8: break;
   }
}