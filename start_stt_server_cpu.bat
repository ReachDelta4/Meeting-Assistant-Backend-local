@echo off
echo Starting RealtimeSTT Server optimized for Intel i5-8250U...
echo This configuration is tuned for your specific CPU.

set OMP_NUM_THREADS=4
set MKL_NUM_THREADS=4
set NUMEXPR_MAX_THREADS=4

stt-server ^
  --model tiny.en ^
  --rt-model tiny.en ^
  --compute_type int8 ^
  --device cpu ^
  --realtime_processing_pause 0.003 ^
  --realtime_batch_size 1 ^
  --batch 2 ^
  --silero_use_onnx ^
  --min_length_of_recording 0.25 ^
  --early_transcription_on_silence 0.03 ^
  --handle_buffer_overflow ^
  --allowed_latency_limit 15 ^
  --silero_sensitivity 0.15 ^
  --silero_deactivity_detection ^
  --end_of_sentence_detection_pause 0.3 ^
  --unknown_sentence_detection_pause 0.5 ^
  --mid_sentence_detection_pause 1.5 ^
  --beam_size 1 ^
  --beam_size_realtime 1 ^
  --faster_whisper_vad_filter

pause 