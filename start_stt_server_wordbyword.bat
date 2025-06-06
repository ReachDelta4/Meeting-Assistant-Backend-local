@echo off
echo Starting RealtimeSTT Server in WORD-BY-WORD mode...
echo This configuration sends immediate transcriptions without waiting for full sentences.

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
  --min_length_of_recording 0.05 ^
  --early_transcription_on_silence 0.01 ^
  --handle_buffer_overflow ^
  --allowed_latency_limit 30 ^
  --silero_sensitivity 0.4 ^
  --end_of_sentence_detection_pause 2.0 ^
  --unknown_sentence_detection_pause 2.0 ^
  --mid_sentence_detection_pause 2.0 ^
  --beam_size 1 ^
  --beam_size_realtime 1 ^
  --faster_whisper_vad_filter ^
  --initial_prompt "Output words immediately as they are heard." ^
  --initial_prompt_realtime "Transcribe each word immediately, don't wait for full sentences."

pause 