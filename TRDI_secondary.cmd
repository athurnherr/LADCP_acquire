;======================================================================
;                    T R D I _ S E C O N D A R Y . C M D 
;                    doc: Tue Mar  9 17:32:02 2021
;                    dlm: Fri Mar 19 04:33:30 2021
;                    (c) 2021 A.M. Thurnherr
;                    uE-Info: 34 20 NIL 0 0 72 2 2 4 NIL ofnI
;======================================================================

; TRDI Workhorse LADCP Instrument Setup
;	- secondary instrument (receiving trigger pulses)
;	- LADCP firmware installed (WM15)

; HISTORY:
;	Mar 19, 2021: 	- created from [TRDI_primary.cmd]

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

EZ0011101			; Sensor source:
					;	- manual speed of sound (EC)
					;	- manual depth of transducer (ED = 0 [dm])
					;	- measured heading (EH)
					;	- measured pitch (EP)
					;	- measured roll (ER)
					;	- manual salinity (ES = 35 [psu])
					;	- measured temperature (ET)

EX00100				; coordinate transformation:
					;	- radial beam coordinates (2 bits)
					;	- use pitch/roll (not used for beam coords?)
					;	- no 3-beam solutions
					;	- no bin mapping

CF11101				; Flow control:
					;	- automatic ensemble cycling (next ens when ready)
					;	- automatic ping cycling (ping when ready)
					;	- binary data output
					;	- disable serial output
					;	- enable data recorder

CK					; keep params as user defaults (across power failures)
CS					; start pinging
