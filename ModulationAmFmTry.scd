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


