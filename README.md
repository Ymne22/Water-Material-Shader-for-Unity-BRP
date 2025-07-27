# Water Shader for Unity

A water shader made for Unity, featuring physically-inspired light interaction, screen-space reflections, foam, Gerstner waves, and more.  

<div align="center">
  <img src="Screenshots/Screenshot_1.gif" alt="Water Shader Preview" width="800"/>
</div>

---

## Features

- Depth-based color blending (shallow/deep)
- Realistic refraction with chromatic aberration & blur
- Screen Space Reflections (SSR) + fallback to cubemap
- Customizable caustics (up to 3 dynamic layers)
- Gerstner waves for animated water surface
- Flow mapping support
- Subsurface scattering (SSS)
- Detailed foam behavior (edge + crest)
- Surface noise & oily sheen for stylization
- Intersection rim + ripple effects
- Global ripple simulation
- Dithering for transparency fadeout
- Supports both specular and roughness control

---

## Getting Started

1. **Import the shader** into your Unity project  
2. Assign the `YmneShader/WaterShader` to a material  
3. Apply the material to a water mesh (e.g., plane or custom mesh)  
4. (Optional) Open the `SampleScenes` folder to explore setup and parameter examples  

---

## Included

- `Shaders/`: Main water shader file  
- `Materials/`: Example materials using the shader  
- `SampleScenes/`: Sample scenes with lighting, reflections, and interaction  

---

## Shader Parameters

### Water Color & Refraction

| Property              | Description                           | Type       | Default             |
|-----------------------|---------------------------------------|------------|---------------------|
| `_ShallowColor`       | Water color in shallow regions        | Color      | (0.2, 0.6, 0.8, 0.5) |
| `_DeepColor`          | Water color in deep regions           | Color      | (0.05, 0.2, 0.3, 1)  |
| `_DepthFalloff`       | Depth blending speed                  | Range      | 0.45                |
| `_RefractionStrength` | Surface distortion strength           | Range      | 0.035               |
| `_RefractionBlur`     | Blur amount based on normals          | Range      | 3                   |
| `_ChromaticAberration`| Color shift between channels          | Range      | 0.015               |

---

### Surface Noise & Distortion

| Property                    | Description                         | Type    | Default   |
|-----------------------------|-------------------------------------|---------|-----------|
| `_UseSurfaceNoise`          | Enable animated distortion          | Toggle  | On        |
| `_SurfaceNoiseTex`          | Surface noise texture               | Texture | -      |
| `_NoiseTiling`              | Tiling factor for noise             | Float   | 10        |
| `_NoiseSpeed`               | Noise scroll speed                  | Float   | 0.2       |
| `_NoiseStrength`            | Normal distortion from noise        | Range   | 0.1       |
| `_ChromaticAberrationNoise` | CA effect on noise                  | Range   | 1         |

---

### Surface Normals & Lighting

| Property            | Description                            | Type    | Default     |
|---------------------|----------------------------------------|---------|-------------|
| `_UseNormalMaps`    | Enable detail/macro normals            | Toggle  | On          |
| `_NormalMap`        | Detail normal map                      | Texture | -        |
| `_NormalMap2`       | Macro normal map                       | Texture | -        |
| `_NormalTiling`     | Tiling for detail normal               | Float   | 0.15        |
| `_NormalTiling2`    | Tiling for macro normal                | Float   | 0.25        |
| `_NormalSpeed1`     | Speed for detail map (XY)              | Vector  | (0.02, 0.01)|
| `_NormalSpeed2`     | Speed for macro map (XY)               | Vector  | (-0.01, -0.02) |
| `_NormalStrength`   | Influence of normals                   | Range   | 0.25        |
| `_Roughness`        | Surface roughness                      | Range   | 0.1         |
| `_SpecularIntensity`| Specular intensity                     | Range   | 1.0         |
| `_ReflectionIntensity`| Cubemap/SSR blend amount             | Range   | 0.5         |
| `_FresnelPower`     | Reflectivity curve via view angle      | Range   | 5.0         |

---

### Oily Sheen

| Property         | Description               | Type    | Default  |
|------------------|---------------------------|---------|----------|
| `_UseOilySheen`  | Enable rainbow sheen       | Toggle  | Off      |
| `_OilNoiseScale` | Sheen noise size           | Float   | 1        |
| `_OilNoiseSpeed` | Scroll speed               | Float   | 0.1      |
| `_OilStrength`   | Intensity of sheen         | Range   | 0.125    |

---

### Flow Mapping

| Property         | Description               | Type    | Default  |
|------------------|---------------------------|---------|----------|
| `_UseFlowMap`    | Enable flow map            | Toggle  | Off      |
| `_FlowMap`       | Flow direction RG texture  | Texture | -     |
| `_FlowTiling`    | Tiling of flow map         | Float   | 1.0      |
| `_FlowStrength`  | Distortion amount          | Range   | 0.1      |
| `_FlowSpeed`     | Flow speed                 | Float   | 1.0      |

---

### Subsurface Scattering

| Property             | Description                  | Type    | Default         |
|----------------------|------------------------------|---------|-----------------|
| `_UseSubsurface`     | Enable backlight simulation  | Toggle  | On              |
| `_SubsurfaceColor`   | Color of scattered light     | Color   | (0.1, 0.3, 0.4) |
| `_SubsurfaceIntensity`| Intensity of SSS           | Range   | 1.0             |

---

### Gerstner Waves

| Property         | Description                | Type    | Default    |
|------------------|----------------------------|---------|------------|
| `_WaveAmplitude` | Height of waves            | Float   | 0.1        |
| `_WaveFrequency` | Frequency of waves         | Float   | 1.0        |
| `_WaveSteepness` | Steepness (shape)          | Range   | 0.8        |
| `_WaveSpeed`     | Speed of wave motion       | Float   | 1.0        |
| `_WaveDirectionX`| Direction vectors          | Vector  | 0.7, 0.3, 0, 0 |

---

### Global Ripples

| Property               | Description                | Type   | Default     |
|------------------------|----------------------------|--------|-------------|
| `_UseGlobalRipples`    | Enable ripples             | Toggle | On          |
| `_GlobalRippleStrength`| Ripple amount              | Range  | 0.015       |
| `_GlobalRippleScale`   | Scale of pattern           | Float  | 2.5         |
| `_GlobalRippleSpeed`   | Speed of ripple motion     | Float  | 1.5         |
| `_GlobalRippleDirection`| Flow direction vector     | Vector | (0.7, 0.3)  |

---

### Foam

| Property              | Description                    | Type    | Default       |
|-----------------------|--------------------------------|---------|---------------|
| `_UseFoam`            | Enable shoreline/crest foam     | Toggle  | On            |
| `_FoamTex`            | Foam pattern                    | Texture | -         |
| `_FoamTiling`         | Pattern tiling                  | Float   | 0.2           |
| `_FoamSpeed`          | Scroll speed                    | Vector  | (0.05, 0.05)  |
| `_FoamDepthFalloff`   | Dissolve by depth               | Range   | 2.0           |
| `_FoamCrestThreshold` | Threshold for wave crests       | Range   | 0.6           |
| `_FoamDissolveSpeed`  | Noise dissolve animation speed  | Range   | 4.0           |
| `_FoamIntensity`      | Final foam brightness           | Range   | 1.5           |

---

### Caustics

| Property               | Description                   | Type   | Default             |
|------------------------|-------------------------------|--------|---------------------|
| `_UseCaustics`         | Enable underwater light        | Toggle | On                  |
| `_CausticsIntensityX`  | Intensity per layer            | Range  | 0.125 / 0.05 / 0.025|
| `_CausticsScaleX`      | Tiling per layer               | Float  | 1.0–4.0             |
| `_CausticsSpeedX`      | Speed per layer                | Float  | 3.0–5.0             |
| `_CausticsContrastX`   | Light contrast                 | Range  | 4.0                 |
| `_CausticsWarpStrengthX`| Warp amount                  | Range  | 0.04–0.5            |
| `_CausticsWarpScaleX`  | Warp frequency                 | Float  | 0.1–4.0             |

---

### Intersection Effects

| Property                 | Description                 | Type    | Default       |
|--------------------------|-----------------------------|---------|---------------|
| `_UseIntersectionRim`    | Enable rim fade             | Toggle  | On            |
| `_RimColor`              | Rim color                   | Color   | (0.8,0.9,1.0) |
| `_RimWidth`              | Fade distance               | Range   | 0.5           |
| `_RimPower`              | Rim falloff sharpness       | Range   | 3.0           |
| `_RimIntensity`          | Final rim brightness        | Range   | 1.5           |
| `_UseIntersectionRipples`| Enable splash ripples       | Toggle  | On            |
| `_RippleStrength`        | Distortion amount           | Range   | 0.01          |
| `_RippleScale`           | Ripple detail scale         | Float   | 10.0          |
| `_RippleSpeed`           | Speed of ripple animation   | Float   | 2.0           |
| `_RippleFalloff`         | Depth falloff range         | Range   | 2.0           |

---

### Screen Space Reflections (SSR)

| Property              | Description                     | Type    | Default |
|------------------------|----------------------------------|---------|---------|
| `_UseSSR`              | Enable SSR                      | Toggle  | On      |
| `_Checkerboard`        | Optimization toggle              | Toggle  | On      |
| `_SSR_Resolution`      | SSR resolution scale             | Range   | 0.25    |
| `_SSR_Intensity`       | Intensity of reflection          | Range   | 1.0     |
| `_SSR_MaxDistance`     | Max ray distance                 | Float   | 8.0     |
| `_SSR_StepSize`        | Raymarching step length          | Float   | 1.0     |
| `_SSR_Samples`         | Steps for SSR                    | Int     | 4       |
| `_SSR_RefinementSamples`| Refinement quality              | Int     | 2       |
| `_SSR_EdgeFalloff`     | Screen-edge fade                 | Range   | 0.5     |
| `_SSR_AngleFalloff`    | View angle fade                  | Range   | 8.0     |

---

### Extra Effects

| Property         | Description              | Type    | Default |
|------------------|--------------------------|---------|---------|
| `_UseDithering`  | Enable alpha dithering   | Toggle  | On      |
| `_DitherStrength`| Dither amount            | Range   | 0.1     |

---

## Compatibility

- ✅ Unity 6 (Built-in Render Pipeline)  
- ⚠️ Not compatible with URP or HDRP.
- 💡 Optimized for **Forward Rendering**, compatible with **Deferred**

---

## License

MIT License  
Free to use, modify, and distribute.  
Attribution is appreciated but not required.
