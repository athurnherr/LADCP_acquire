;======================================================================
;                    T R D I _ P R I M A R Y . C M D 
;                    doc: Tue Mar  9 17:32:02 2021
;                    dlm: Wed Jul  7 15:54:28 2021
;                    (c) 2021 A.M. Thurnherr
;                    uE-Info: 63 0 NIL 0 0 72 2 2 4 NIL ofnI
;======================================================================

; TRDI Workhorse LADCP Instrument Setup
;	- primary instrument (sending trigger pulses)
;	- LADCP firmware installed (WM15)

; HISTORY:
;	Mar  9, 2021: 	- created
;	Mar 19, 2021:	- updated docu
;	Jul  7, 2021: 	- made ready for release

RN${ID_STR}			; deployment name: 5-char string, e.g. 013DL

WM15				; water mode 15 (LADCP)

TC2					; ensembles per burst
LP1					; pings per ensemble
TB 00:00:02.80		; time per burst
TE 00:00:01.30		; time per ensemble
TP 00:00.00			; time between pings

LN25				; number of depth cells
LS0800				; bin size [cm]
LF0					; blank after transmit [cm]

LW1					; narrow bandwidth 
LV400				; ambiguity velocity [cm/s]

SM1					; send sync pulses
SA011				; ... before each ensemble
SB0					; disable hardware-break detection on Channel B (see ICN118)
SW5500				; wait .5500 s after sending sync pulse to give sync receiver time to ping
SI0					; # of ensembles to wait before sending sync pulse

EZ0011101			; Sensor source (7 bits):
					;	0: manual speed of sound (EC); bits 2, 6 & 7 ignored for sound speed
					;	0: manual depth of transducer
					;	1: measured heading (EH)
					;	1: measured pitch (EP)
					;	1: measured roll (ER)
					;	0: manual salinity (ES = 35 [psu])
					;	1: measured temperature (ET)

EX00100				; coordinate transformation (5 bits):
					;	00: radial beam coordinates (2 bits)
					;	 1: use pitch/roll (not used for beam coords?)
					;	 0: no 3-beam solutions
					;	 0: bin mapping disabled

CF11101				; Flow control (5 bits):
					;	1: automatic ensemble cycling (next ens when ready)
					;	1: automatic ping cycling (ping when ready)
					;	1: binary data output
					;	0: serial output disabled
					;	1: data recorder enabled

CK					; keep params as user defaults (across power failures)
CS					; start pinging
