@echo off
echo Starting RealtimeSTT Server optimized for quick response and shorter transcriptions...
echo This configuration reduces pause detection time and shortens transcription blocks.

set OMP_NUM_THREADS=4
set MKL_NUM_THREADS=4
set NUMEXPR_MAX_THREADS=4

stt-server ^
  --model tiny.en ^
  --rt-model tiny.en ^
  --compute_type int8 ^
  --device cpu ^
  --realtime_processing_pause 0.001 ^
  --init_realtime_after_seconds 0.0 ^
  --realtime_batch_size 1 ^
  --batch 1 ^
  --silero_use_onnx ^
  --min_length_of_recording 0.1 ^
  --early_transcription_on_silence 0.005 ^
  --handle_buffer_overflow ^
  --allowed_latency_limit 30 ^
  --silero_sensitivity 0.4 ^
  --end_of_sentence_detection_pause 0.1 ^
  --unknown_sentence_detection_pause 0.2 ^
  --mid_sentence_detection_pause 0.5 ^
  --beam_size 1 ^
  --beam_size_realtime 1 ^
  --faster_whisper_vad_filter ^
  --initial_prompt "Keep sentences short and transcribe exactly what is heard."

pause 