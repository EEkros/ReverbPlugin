FreqScope.new;
Window.new

	Server.default = Server.internal;
	s = Server.default;
	s.boot;


(
  SynthDef ( "dreyblattcord", { arg freq = 440;
	var osc;
	osc = SinOsc.ar ( freq, 0, 0.1 ); // 800 Hz sine oscillator
	Out.ar ( 0, osc ); // send output to audio bus zero.
}).add;
)

	s.scope; // scope so you can see the effect
	x = Synth.new("dreyblattcord");
	x.set("freq", 660);
	x.set("freq", 880, "out", 1);
	x.free;




// 1) =========  LFO  ==========


// Tremolo - variations in amplitude
(
// LFO (Low Frequency Oscillator) synthesis

// LFO (Low Frequency Oscillator) synthesis

// mouseX is the frequency of the tremolo
{
  var modulator, carrier;
  modulator = SinOsc.kr ( MouseX.kr ( 2, 4000 ), 0, 0.4);
  carrier = SinOsc.ar(333, 0, modulator);
  carrier!2 // the output
}.play
)
-------------------------------------
// Vibrato - variation in pitch

(
// LFO (Low Frequency Oscillator) synthesis

// mouseX is the power of the vibrato
// mouseY is the frequency of the vibrato
{
  var modulator, carrier;
  modulator = SinOsc.ar(MouseY.kr(40, 5), 0, MouseX.kr(5, 20));
  carrier = SinOsc.ar(440 + modulator, 0, 1);
  carrier!2 // the output
  }.play
)


// let's make a Theremin:

(
{
var freq;
	freq = MouseY.kr(4000, 200, 'exponential', 0.8);
	SinOsc.ar(freq+(freq*SinOsc.ar(7,0,0.02)), 0, MouseX.kr(0, 0.9)
	)!2
}.play
)


// there are special Low Frequency Oscillators (LFOs)

// LFSaw
{ SinOsc.ar(LFSaw.kr(4, 0, 200, 400), 0, 0.7) }.play

// LFTri
{ SinOsc.ar(LFTri.kr(4, 0, 200, 400), 0, 0.7) }.play
{ Saw.ar(LFTri.kr(4, 0, 200, 400), 0.7) }.play

// LFPar
{ SinOsc.ar(LFPar.kr(0.2, 0, 400,800),0, 0.7) }.play

// LFCub
{ SinOsc.ar(LFCub.kr(0.2, 0, 400,800),0, 0.7) }.play

// LFPulse
{ SinOsc.ar(LFPulse.kr(3, 1, 0.3, 200, 200),0, 0.7) }.play
{ SinOsc.ar(LFPulse.kr(3, 1, 0.3, 2000, 200),0, 0.7) }.play


// LFOs can also perform at audio rate
{ LFPulse.ar(LFPulse.kr(3, 1, 0.3, 200, 200),0, 0.7) }.play
{ LFSaw.ar(LFSaw.kr(4, 0, 200, 400), 0, 0.7) }.play
{ LFTri.ar(LFTri.kr(4, 0, 200, 400), 0, 0.7) }.play
{ LFTri.ar(LFSaw.kr(4, 0, 200, 800), 0, 0.7) }.play


