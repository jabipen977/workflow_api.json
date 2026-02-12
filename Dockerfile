# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# Force ComfyUI to see models from Network Volume via symlinks
# (This is needed because base image doesn't scan /runpod-volume by default)
RUN mkdir -p /comfyui/models/checkpoints \
    && ln -sfn /runpod-volume/models/checkpoints/* /comfyui/models/checkpoints/ 2>/dev/null || true \
    && ln -sfn /runpod-volume/models/loras/* /comfyui/models/loras/ 2>/dev/null || true \
    && ln -sfn /runpod-volume/models/vae/* /comfyui/models/vae/ 2>/dev/null || true \
    && ln -sfn /runpod-volume/models/unet/* /comfyui/models/unet/ 2>/dev/null || true \
    && echo "Symlinks created - models from volume should now be visible"

# Optional: If you prefer yaml over symlinks (or both), copy it explicitly
# COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
# But symlinks are usually more foolproof in worker images

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes to install.
# Unknown registry nodes could not be resolved automatically (no aux_id provided):
# - CheckpointLoaderSimple    -> skipped (no aux_id / GitHub repo provided)
# - CLIPSetLastLayer         -> skipped (no aux_id / GitHub repo provided)

# download models into comfyui
# RUN # Could not find URL for verisimilisPhotoreal_v10.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
