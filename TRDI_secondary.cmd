;======================================================================
;                    T R D I _ S E C O N D A R Y . C M D 
;                    doc: Tue Mar  9 17:32:02 2021
;                    dlm: Wed Jul  7 15:55:23 2021
;                    (c) 2021 A.M. Thurnherr
;                    uE-Info: 59 0 NIL 0 0 72 2 2 4 NIL ofnI
;======================================================================

; TRDI Workhorse LADCP Instrument Setup
;	- secondary instrument (receiving trigger pulses)
;	- LADCP firmware installed (WM15)

; HISTORY:
;	Mar 19, 2021: 	- created from [TRDI_primary.cmd]
;	Jul  7, 2021: 	- made ready for release

RN${ID_STR}			; deployment name: 5-char string, e.g. 013DL

WM15				; water mode 15 (LADCP)

TC2					; ensembles per burst
LP1					; pings per ensemble
TE 00:00:00.00		; time per ensemble
TP 00:00.00			; time between pings

LN25				; number of depth cells
LS0800				; bin size [cm]
LF0					; blank after transmit [cm]

LW1					; narrow bandwidth 
LV400				; ambiguity velocity [cm/s]

SM2         		; receive trigger pulses
SA011           	; wait for pulse before ensemble
SB0         		; disable hardware-break detection on Channel B (ICN118)

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
