PROGRAM TrafficLight_NS_EW
  VAR
    NS_red AT %QX100.0 : BOOL;
    NS_yellow AT %QX100.1 : BOOL;
    NS_green AT %QX100.2 : BOOL;
    EW_red AT %QX0.0 : BOOL := true;
    EW_yellow AT %QX0.1 : BOOL;
    EW_green AT %QX0.2 : BOOL;
    Time_NS_green AT %MW0 : INT;
    Time_NS_yellow AT %MW1 : INT;
    Time_NS_red AT %MW2 : INT;
    Time_EW_green AT %MW3 : INT;
    Time_EW_yellow AT %MW4 : INT;
    Time_EW_red AT %MW5 : INT;
  END_VAR
  VAR
    TON0 : TON;
    TON1 : TON;
    TON2 : TON;
    TON3 : TON;
    _TMP_AND4_OUT : BOOL;
    _TMP_AND5_OUT : BOOL;
    _TMP_AND13_OUT : BOOL;
    _TMP_AND14_OUT : BOOL;
    _TMP_NOT27_OUT : BOOL;
    _TMP_AND17_OUT : BOOL;
    _TMP_OR22_OUT : BOOL;
    _TMP_OR7_OUT : BOOL;
    _TMP_TIME_TO_INT36_OUT : INT;
    _TMP_SUB37_OUT : INT;
    _TMP_TIME_TO_INT32_OUT : INT;
    _TMP_SUB33_OUT : INT;
    _TMP_AND43_OUT : BOOL;
    _TMP_AND44_OUT : BOOL;
    _TMP_AND52_OUT : BOOL;
    _TMP_AND53_OUT : BOOL;
    _TMP_NOT57_OUT : BOOL;
    _TMP_AND56_OUT : BOOL;
    _TMP_OR64_OUT : BOOL;
    _TMP_OR65_OUT : BOOL;
    _TMP_TIME_TO_INT73_OUT : INT;
    _TMP_SUB74_OUT : INT;
    _TMP_TIME_TO_INT70_OUT : INT;
    _TMP_SUB71_OUT : INT;
  END_VAR

  _TMP_AND4_OUT := AND(EW_red, NOT(EW_yellow));
  _TMP_AND5_OUT := AND(_TMP_AND4_OUT, NOT(NS_yellow));
  NS_green := _TMP_AND5_OUT;

  _TMP_AND13_OUT := AND(NOT(EW_green), NOT(EW_yellow));
  _TMP_AND14_OUT := AND(_TMP_AND13_OUT, EW_red);
  TON0(IN := _TMP_AND14_OUT, PT := T#10s);
  TON1(IN := TON0.Q, PT := T#5s);

  _TMP_NOT27_OUT := NOT(TON1.Q);
  _TMP_AND17_OUT := AND(_TMP_NOT27_OUT, TON0.Q);
  NS_yellow := _TMP_AND17_OUT;

  _TMP_OR22_OUT := OR(EW_green, EW_yellow);
  _TMP_OR7_OUT := OR(_TMP_OR22_OUT, TON1.Q);
  NS_red := _TMP_OR7_OUT;

  IF TON1.Q THEN
    EW_red := FALSE; (*reset*)
  END_IF;

  _TMP_TIME_TO_INT36_OUT := TIME_TO_INT(TON1.ET);
  _TMP_SUB37_OUT := SUB(5, _TMP_TIME_TO_INT36_OUT);
  Time_NS_red := _TMP_SUB37_OUT;

  _TMP_TIME_TO_INT32_OUT := TIME_TO_INT(TON0.ET);
  _TMP_SUB33_OUT := SUB(10, _TMP_TIME_TO_INT32_OUT);
  Time_NS_yellow := _TMP_SUB33_OUT;
  Time_EW_green := _TMP_SUB37_OUT;

  _TMP_AND43_OUT := AND(NS_red, NOT(NS_yellow));
  _TMP_AND44_OUT := AND(_TMP_AND43_OUT, NOT(EW_yellow));
  EW_green := _TMP_AND44_OUT;

  _TMP_AND52_OUT := AND(NOT(NS_green), NOT(NS_yellow));
  _TMP_AND53_OUT := AND(_TMP_AND52_OUT, EW_red);
  TON2(IN := _TMP_AND53_OUT, PT := T#10s);
  TON3(IN := TON2.Q, PT := T#5s);

  _TMP_NOT57_OUT := NOT(TON3.Q);
  _TMP_AND56_OUT := AND(_TMP_NOT57_OUT, TON2.Q);
  EW_yellow := _TMP_AND56_OUT;

  _TMP_OR64_OUT := OR(NS_green, NS_yellow);
  _TMP_OR65_OUT := OR(_TMP_OR64_OUT, TON3.Q);
  EW_red := _TMP_OR65_OUT;

  IF TON3.Q THEN
    NS_red := FALSE; (*reset*)
  END_IF;

  _TMP_TIME_TO_INT73_OUT := TIME_TO_INT(TON3.ET);
  _TMP_SUB74_OUT := SUB(5, _TMP_TIME_TO_INT73_OUT);
  Time_EW_red := _TMP_SUB74_OUT;

  _TMP_TIME_TO_INT70_OUT := TIME_TO_INT(TON2.ET);
  _TMP_SUB71_OUT := SUB(10, _TMP_TIME_TO_INT70_OUT);
  Time_EW_yellow := _TMP_SUB71_OUT;
  Time_NS_green := _TMP_SUB74_OUT;
END_PROGRAM


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : ex03;
  END_RESOURCE
END_CONFIGURATION
