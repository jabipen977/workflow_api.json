# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes to install.
# Unknown registry nodes could not be resolved automatically (no aux_id provided):
# - CheckpointLoaderSimple    -> skipped (no aux_id / GitHub repo provided)
# - CLIPSetLastLayer         -> skipped (no aux_id / GitHub repo provided)

# download models into comfyui
# RUN # Could not find URL for verisimilisPhotoreal_v10.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
