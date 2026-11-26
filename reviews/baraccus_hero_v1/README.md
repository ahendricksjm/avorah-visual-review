# Baraccus gameplay review

Main: `4bff62968f7b752291f01bc59a67d1d1cf22b939` (includes merged #532 after #535).
Candidate source and model hashes: [comparison.json](comparison.json).
Godot 4.7.2, GTX 960, Vulkan Forward+, actual Helm world and lighting.
Camera: 16 m / 45 degrees / FOV 40, 1920x1080. Crops enlarge original pixels equally.

- [A — purple coat](a_purple_coat.png)
- [B — coat flare and hair value, front/back greyscale](b_silhouette_values.png)
- [C — three Gold Bolt sends, Nova, Receiving Line catch/return, Hold](c_key_poses.png)
- [Identity beside Close-camera turntable](identity_close_turntable.png)

| Runtime model | Main | Candidate |
| --- | ---: | ---: |
| Triangles | 27,742 | 28,199 |
| GLB bytes | 2,721,252 | 2,161,416 |
| Materials | 12 | 3 |
| Bones / maximum influences | 57 / 4 | 57 / 4 |

The two raw frame folders retain full native screenshots and exact source/model hashes.
Pose sheets seek the real view to existing Sim phase markers: release 0.45, recover 0.75.
Receiving catch is sampled at anticipation 0.49 (normalized clip time 0.2205).
Damage, cooldowns, costs, hitboxes and Sim timing are unchanged.
Native validator, parse, duplicate guard, capture lifetime and coat-motion receipts are alongside the images.
Source: `source/3d/baraccus/baraccus.blend` plus editable `motions.json`; selected v32c provenance is in the canonical asset folder.

Alex's three decisions:
1. Keep this purple coat value under Helm lighting?
2. Keep the flared tails and lighter swept hair mass as the silhouette?
3. Keep these send, ground-release, catch-return and chest-height guard poses?

Still weak in Close views: uniform hairline, angular fingers and satchel. Ready for Alex's review.
