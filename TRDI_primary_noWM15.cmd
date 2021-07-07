;======================================================================
;                    T R D I _ P R I M A R Y _ N O W M 1 5 . C M D 
;                    doc: Tue Mar  9 17:32:02 2021
;                    dlm: Thu Mar 25 10:17:45 2021
;                    (c) 2021 A.M. Thurnherr
;                    uE-Info: 11 39 NIL 0 0 72 2 2 4 NIL ofnI
;======================================================================

; TRDI Workhorse LADCP Instrument Setup
;	- primary instrument (sending trigger pulses)
;	- LADCP firmware NOT installed (no WM15)

; HISTORY:
;	Mar  9, 2021: - created
;	Mar 19, 2021: - updated docu
;	Mar 24, 2021: - adapted to ADCP w/o LADCP mode (no WM15)
;	Mar 25, 2021: - BUG: typo: WW1 instead of WB1 

RN${ID_STR}			; deployment name: 5-char string, e.g. 013DL

TC2					; ensembles per burst
WP1					; pings per ensemble
TB 00:00:02.80		; time per burst
TE 00:00:01.30		; time per ensemble
TP 00:00.00			; time between pings

WN25				; number of depth cells
WS0800				; bin size [cm]
WF0					; blank after transmit [cm]

WB1					; narrow bandwidth 
WV400				; ambiguity velocity [cm/s]

SM1					; send sync pulses
SA011				; ... before each ensemble
SB0					; disable hardware-break detection on Channel B (see ICN118)
SW5500				; wait .5500 s after sending sync pulse to give sync receiver time to ping
SI0					; # of ensembles to wait before sending sync pulse

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
