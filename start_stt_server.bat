@echo off
echo Starting RealtimeSTT Server with maximum speed optimization...
echo This configuration prioritizes lowest possible latency for real-time transcription.

stt-server --device cuda --compute_type int8_float16 --realtime_processing_pause 0.001 --init_realtime_after_seconds 0.05 --early_transcription_on_silence 0.02 --handle_buffer_overflow --allowed_latency_limit 20 --realtime_batch_size 4 --silero_use_onnx --min_length_of_recording 0.3
 
pause 