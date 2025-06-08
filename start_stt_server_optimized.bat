@echo off
echo Starting RealtimeSTT Server with optimized settings for faster sentence completion...
echo This configuration uses both Silero VAD and faster_whisper_vad_filter for optimal speech detection.

set OMP_NUM_THREADS=4
set MKL_NUM_THREADS=4
set NUMEXPR_MAX_THREADS=4

stt-server ^
  --model tiny.en ^
  --language en ^
  --compute_type int8 ^
  --device cpu ^
  --batch_size 1 ^
  --realtime_batch_size 1 ^
  --allowed_latency_limit 100 ^
  --silero_sensitivity 0.4 ^
  --silero_deactivity_detection ^
  --silero_use_onnx ^
  --min_length_of_recording 0.15 ^
  --min_gap_between_recordings 0.05 ^
  --end_of_sentence_detection_pause 0.4 ^
  --mid_sentence_detection_pause 0.4 ^
  --unknown_sentence_detection_pause 0.4 ^
  --realtime_processing_pause 0.005 ^
  --init_realtime_after_seconds 0.05 ^
  --webrtc_sensitivity 2 ^
  --early_transcription_on_silence 0.1 ^
  --enable_realtime_transcription ^
  --handle_buffer_overflow ^
  --beam_size 1 ^
  --beam_size_realtime 1 ^
  --faster_whisper_vad_filter

pause 