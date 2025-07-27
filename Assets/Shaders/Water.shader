Shader "YmneShader/WaterShader"
{
    Properties
    {
        // Water Appearance
        [Header(Water Appearance)]
        _ShallowColor("Shallow Color", Color) = (0.2, 0.6, 0.8, 0.5)
        _DeepColor("Deep Color", Color) = (0.05, 0.2, 0.3, 1)
        _DepthFalloff("Depth Falloff", Range(0.1, 5)) = 0.45
        _RefractionStrength("Refraction Strength", Range(0, 0.1)) = 0.035
        _RefractionBlur("Refraction Blur", Range(0, 10)) = 3
        _ChromaticAberration("Chromatic Aberration", Range(0, 0.1)) = 0.015

        // Surface Effects and Noise
        [Header(Surface Effects and Noise)]
        [Toggle(USE_SURFACE_NOISE)] _UseSurfaceNoise("Enable Surface Noise", Float) = 1
        _SurfaceNoiseTex("Surface Noise", 2D) = "gray" {}
        _NoiseTiling("Noise Tiling", Float) = 10
        _NoiseSpeed("Noise Speed", Float) = 0.2
        _NoiseStrength("Noise Strength", Range(0, 0.5)) = 0.1
        _ChromaticAberrationNoise("Noise Chromatic Aberration", Range(0, 1)) = 1

        // Surface and Lighting
        [Header(Surface and Lighting)]
        [Toggle(USE_NORMAL_MAPS)] _UseNormalMaps("Enable Normal Mapping", Float) = 1
        _NormalMap("Detail Normal Map (Ripples)", 2D) = "bump" {}
        _NormalTiling("Detail Normal Tiling", Float) = 0.15
        _NormalSpeed1("Detail Normal Speed (XY)", Vector) = (0.02, 0.01, 0, 0)
        _NormalMap2("Macro Normal Map (Swells)", 2D) = "bump" {}
        _NormalTiling2("Macro Normal Tiling", Float) = 0.25
        _NormalSpeed2("Macro Normal Speed (XY)", Vector) = (-0.01, -0.02, 0, 0)
        _NormalStrength("Normal Strength", Range(0, 3)) = 0.25
        _Roughness("Roughness", Range(0.01, 1)) = 0.1
        _ReflectionIntensity("Reflection Intensity", Range(0, 2)) = 0.5
        _SpecularIntensity("Specular Intensity", Range(0, 5)) = 1.0
        _FresnelPower("Fresnel Power", Range(1, 10)) = 5.0

        // Oily Sheen
        [Header(Oily Sheen)]
        [Toggle(USE_OILY_SHEEN)] _UseOilySheen("Enable Oily Sheen", Float) = 0
        _OilNoiseScale("Oil Noise Scale", Float) = 1
        _OilNoiseSpeed("Oil Noise Speed", Float) = 0.1
        _OilStrength("Oil Strength", Range(0, 1)) = 0.125

        // Flow Mapping
        [Header(Flow Mapping)]
        [Toggle(USE_FLOWMAP)] _UseFlowMap("Enable Flow Mapping", Float) = 0
        _FlowMap("Flow Map (RG)", 2D) = "gray" {}
        _FlowTiling("Flow Tiling", Float) = 1.0
        _FlowStrength("Flow Strength", Range(0, 1)) = 0.1
        _FlowSpeed("Flow Speed", Float) = 1.0

        // Subsurface Scattering
        [Header(Subsurface Scattering)]
        [Toggle(USE_SUBSURFACE_SCATTERING)] _UseSubsurface("Enable Subsurface Scattering", Float) = 1
        _SubsurfaceColor("Subsurface Color", Color) = (0.1, 0.3, 0.4, 1)
        _SubsurfaceIntensity("Subsurface Intensity", Range(0, 5)) = 1.0

        // Gerstner Waves
        [Header(Gerstner Waves)]
        _WaveAmplitude("Wave Amplitude", Float) = 0.1
        _WaveFrequency("Wave Frequency", Float) = 1.0
        _WaveSteepness("Wave Steepness", Range(0, 1)) = 0.8
        _WaveSpeed("Wave Speed", Float) = 1.0
        _WaveDirection1("Wave Direction 1", Vector) = (1.0, 0.2, 0, 0)
        _WaveDirection2("Wave Direction 2", Vector) = (-0.7, 0.7, 0, 0)
        _WaveDirection3("Wave Direction 3", Vector) = (0.3, -0.9, 0, 0)
        _WaveDirection4("Wave Direction 4 (Ripples)", Vector) = (0.8, 0.6, 0, 0)

        // Global Ripples
        [Header(Global Ripples)]
        [Toggle(USE_GLOBAL_RIPPLES)] _UseGlobalRipples("Enable Global Ripples", Float) = 1
        _GlobalRippleStrength("Global Ripple Strength", Range(0, 0.05)) = 0.015
        _GlobalRippleScale("Global Ripple Scale", Float) = 2.5
        _GlobalRippleSpeed("Global Ripple Speed", Float) = 1.5
        _GlobalRippleDirection("Global Ripple Direction", Vector) = (0.7, 0.3, 0, 0)

        // Foam
        [Header(Foam)]
        [Toggle(USE_FOAM)] _UseFoam("Enable Foam", Float) = 1
        _FoamTex("Foam Texture", 2D) = "white" {}
        _FoamTiling("Foam Tiling", Float) = 0.2
        _FoamSpeed("Foam Speed", Vector) = (0.05, 0.05, 0, 0)
        _FoamDepthFalloff("Foam Depth Falloff", Range(0, 5)) = 2
        _FoamCrestThreshold("Foam Crest Threshold", Range(0, 2)) = 0.6
        _FoamDissolveSpeed("Foam Dissolve Speed", Range(0, 10)) = 4.0
        _FoamIntensity("Foam Intensity", Range(0, 5)) = 1.5

        // Caustics
        [Header(Caustics)]
        [Toggle(USE_CAUSTICS)] _UseCaustics("Enable Caustics", Float) = 1
        [Header(Layer 1)] _CausticsIntensity1("Intensity", Range(0, 5)) = 0.125
        _CausticsScale1("Scale", Float) = 1.0
        _CausticsSpeed1("Speed", Float) = 5.0
        _CausticsContrast1("Contrast", Range(1, 20)) = 4.0
        _CausticsWarpStrength1("Warp Strength", Range(0, 0.5)) = 0.5
        _CausticsWarpScale1("Warp Scale", Float) = 0.1
        [Header(Layer 2)] _CausticsIntensity2("Intensity", Range(0, 5)) = 0.05
        _CausticsScale2("Scale", Float) = 2.0
        _CausticsSpeed2("Speed", Float) = 4.0
        _CausticsContrast2("Contrast", Range(1, 20)) = 4.0
        _CausticsWarpStrength2("Warp Strength", Range(0, 0.5)) = 0.5
        _CausticsWarpScale2("Warp Scale", Float) = 1.5
        [Header(Layer 3)] _CausticsIntensity3("Intensity", Range(0, 5)) = 0.025
        _CausticsScale3("Scale", Float) = 4.0
        _CausticsSpeed3("Speed", Float) = 3.0
        _CausticsContrast3("Contrast", Range(1, 20)) = 4.0
        _CausticsWarpStrength3("Warp Strength", Range(0, 0.5)) = 0.04
        _CausticsWarpScale3("Warp Scale", Float) = 4.0

        // Interaction Effects
        [Header(Interaction Effects)]
        [Toggle(USE_INTERSECTION_RIM)] _UseIntersectionRim("Enable Intersection Rim", Float) = 1
        _RimColor("Intersection Rim Color", Color) = (0.8, 0.9, 1.0, 1)
        _RimWidth("Intersection Rim Width", Range(0.01, 2.0)) = 0.5
        _RimPower("Intersection Rim Power", Range(1, 10)) = 3.0
        _RimIntensity("Intersection Rim Intensity", Range(0, 5)) = 1.5
        [Toggle(USE_INTERSECTION_RIPPLES)] _UseIntersectionRipples("Enable Intersection Ripples", Float) = 1
        _RippleStrength("Intersection Ripple Strength", Range(0, 0.1)) = 0.01
        _RippleScale("Intersection Ripple Scale", Float) = 10.0
        _RippleSpeed("Intersection Ripple Speed", Float) = 2.0
        _RippleFalloff("Intersection Ripple Falloff", Range(0.01, 5.0)) = 2.0

        // Screen Space Reflections
        [Header(Screen Space Reflections)]
        [Toggle(USE_SSR)] _UseSSR("Enable Screen Space Reflections", Float) = 1
        [Toggle(CHECKERBOARD_RENDER)] _Checkerboard("Enable Checkerboard for SSR", Float) = 1
        _SSR_Resolution("SSR Resolution Scale", Range(0.25, 1.0)) = 0.25
        _SSR_Intensity("SSR Intensity", Range(0, 1)) = 1.0
        _SSR_MaxDistance("SSR Max Distance", Float) = 8.0
        _SSR_StepSize("SSR Step Size", Float) = 1.0
        [IntRange] _SSR_Samples("SSR Samples", Range(1, 64)) = 4
        [IntRange] _SSR_RefinementSamples("SSR Refinement Samples", Range(1, 10)) = 2
        _SSR_EdgeFalloff("SSR Edge Falloff", Range(0, 1)) = 0.5
        _SSR_AngleFalloff("SSR Angle Falloff", Range(0, 10)) = 8.0

        // Effects
        [Header(Effects)]
        [Toggle(USE_DITHERING)] _UseDithering("Enable Depth Dithering", Float) = 1
        _DitherStrength("Depth Dither Strength", Range(0, 1)) = 0.1
    }

    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" "IgnoreProjector"="True" }
        LOD 300

        GrabPass { "_GrabTexture" }

        CGINCLUDE
        #pragma target 3.0

        #include "UnityCG.cginc"
        #include "Lighting.cginc"
        #include "AutoLight.cginc"

        struct appdata
        {
            float4 vertex   : POSITION;
            float3 normal   : NORMAL;
            float4 tangent  : TANGENT;
            float2 uv       : TEXCOORD0;
        };

        struct v2f
        {
            float4 pos          : SV_POSITION;
            float2 uv           : TEXCOORD0;
            float4 screenPos    : TEXCOORD1;
            float3 worldPos     : TEXCOORD2;
            float3 viewDir      : TEXCOORD3;
            float3 worldNormal  : TEXCOORD4;
            float3 worldTangent : TEXCOORD5;
            float3 worldBinormal: TEXCOORD6;
            float  foamCrest    : TEXCOORD7;
            UNITY_FOG_COORDS(8)
            float4 clipPos      : TEXCOORD9;
        };

        sampler2D _GrabTexture, _CameraDepthTexture, _FoamTex, _NormalMap, _NormalMap2, _SurfaceNoiseTex, _FlowMap;
        float4 _ShallowColor, _DeepColor, _WaveDirection1, _WaveDirection2, _WaveDirection3, _WaveDirection4, _FoamSpeed, _SubsurfaceColor, _NormalSpeed1, _NormalSpeed2, _RimColor, _GlobalRippleDirection;
        float _DepthFalloff, _RefractionStrength, _ChromaticAberration, _Roughness, _ReflectionIntensity, _SpecularIntensity, _NormalTiling, _NormalTiling2, _NormalStrength, _FresnelPower;
        float _WaveAmplitude, _WaveFrequency, _WaveSteepness, _WaveSpeed, _FoamTiling, _FoamDepthFalloff, _FoamCrestThreshold, _FoamDissolveSpeed, _FoamIntensity;
        float _DitherStrength, _RefractionBlur, _SubsurfaceIntensity;
        float _RimWidth, _RimPower, _RimIntensity, _RippleStrength, _RippleScale, _RippleSpeed, _RippleFalloff;
        float _GlobalRippleStrength, _GlobalRippleScale, _GlobalRippleSpeed;
        float _SSR_Intensity, _SSR_MaxDistance, _SSR_StepSize, _SSR_EdgeFalloff, _SSR_AngleFalloff, _SSR_Resolution;
        float _NoiseTiling, _NoiseSpeed, _NoiseStrength, _ChromaticAberrationNoise;
        float _FlowTiling, _FlowStrength, _FlowSpeed;
        float _OilNoiseScale, _OilNoiseSpeed, _OilStrength;
        int _SSR_Samples, _SSR_RefinementSamples;
        float _CausticsIntensity1, _CausticsScale1, _CausticsSpeed1, _CausticsContrast1, _CausticsWarpStrength1, _CausticsWarpScale1;
        float _CausticsIntensity2, _CausticsScale2, _CausticsSpeed2, _CausticsContrast2, _CausticsWarpStrength2, _CausticsWarpScale2;
        float _CausticsIntensity3, _CausticsScale3, _CausticsSpeed3, _CausticsContrast3, _CausticsWarpStrength3, _CausticsWarpScale3;
        float _Checkerboard;

        float2 hash(float2 p)
        {
            p = frac(p * float2(5.3983, 5.4427));
            p += dot(p.yx, p.xy + float2(21.5351, 14.3137));
            return frac(float2(p.x * p.y * 95.4337, p.x * p.y * 97.597));
        }

        float valueNoise(float2 p)
        {
            float2 i = floor(p);
            float2 f = frac(p);
            f = f * f * (3.0 - 2.0 * f);
            float v1 = lerp(hash(i).x, hash(i + float2(1, 0)).x, f.x);
            float v2 = lerp(hash(i + float2(0, 1)).x, hash(i + float2(1, 1)).x, f.x);
            return lerp(v1, v2, f.y);
        }

        #if USE_OILY_SHEEN
        float3 getOilySheen(float NdotV, float3 worldPos)
        {
            float time = _Time.y * _OilNoiseSpeed;
            float noise = valueNoise(worldPos.xz * _OilNoiseScale + time);
            float3 oil_color_1 = float3(1,0,0);
            float3 oil_color_2 = float3(0,1,0);
            float3 oil_color_3 = float3(0,0,1);
            float ramp = frac(NdotV * 5.0);
            float3 ramp_color = lerp(oil_color_1, oil_color_2, saturate(ramp * 2.0));
            ramp_color = lerp(ramp_color, oil_color_3, saturate(ramp * 2.0 - 1.0));
            return ramp_color * pow(noise, 2.0) * _OilStrength;
        }
        #endif

        float BayerDither(float2 screenPos) { const float BayerMatrix[16] = { 0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5 };
        int index = (int(screenPos.x) % 4) * 4 + (int(screenPos.y) % 4); return BayerMatrix[index] / 16.0;
        }
        
        void GerstnerWave(in float2 position, in float time, in float4 direction, float amp, float freq, float steep, float speed, out float3 displacement, out float3 normal) 
        {
            displacement = float3(0,0,0);
            normal = float3(0,1,0);
            float2 D = normalize(direction.xy); 
            float k = 2 * UNITY_PI * freq;
            float c = sqrt(9.8 / k) * speed; 
            float f = k * (dot(D, position) - c * time);
            float a = steep * amp; 
            displacement = float3(D.x * a * cos(f), a * sin(f), D.y * a * cos(f));
            normal = float3(-D.x * a * sin(f), 1 - (steep * a * cos(f)), -D.y * a * sin(f));
        }

        float3 CalculateSpecular(float3 normal, float3 viewDir, float3 lightDir, float roughness, float specIntensity)
        {
            float3 halfway = normalize(lightDir + viewDir);
            float NdotH = saturate(dot(normal, halfway));
            float NdotV = saturate(dot(normal, viewDir));
            float NdotL = saturate(dot(normal, lightDir));
            float alpha = roughness * roughness;
            float alphaSq = alpha * alpha;
            float D = alphaSq / (UNITY_PI * pow(NdotH * NdotH * (alphaSq - 1.0) + 1.0, 2.0));
            float k = pow(roughness + 1.0, 2.0) / 8.0;
            float G = (NdotV / (NdotV * (1.0 - k) + k)) * (NdotL / (NdotL * (1.0 - k) + k));
            float3 F0 = lerp(0.04, 1.0, specIntensity);
            float3 F = F0 + (1.0 - F0) * pow(1.0 - saturate(dot(viewDir, halfway)), 5.0);
            return (D * G * F) / max(0.001, 4.0 * NdotV * NdotL);
        }
        
        #if USE_CAUSTICS
        float worleyNoise(float2 uv, float time, float contrast) 
        { 
            float2 gv = frac(uv) - 0.5;
            float2 id = floor(uv); 
            float minDist1 = 1.0, minDist2 = 1.0;
            for (int y = -1; y <= 1; y++) { 
                for (int x = -1; x <= 1; x++) { 
                    float2 offs = float2(x, y);
                    float2 h = hash(id + offs); 
                    float2 r = offs - gv + (h * 0.5 + 0.25 * sin(time + h * 5.0));
                    float dist = dot(r, r); 
                    if (dist < minDist1) {minDist2 = minDist1; minDist1 = dist;} 
                    else if (dist < minDist2) {minDist2 = dist;} 
                } 
            } 
            return pow(saturate(1.0 - (sqrt(minDist2) - sqrt(minDist1))), contrast);
        }

        float getCausticsLayer(float2 worldPosXZ, float time, float scale, float speed, float contrast, float warpStrength, float warpScale) 
        { 
            float warpModulation = valueNoise(worldPosXZ * warpScale * 0.5 + time * 0.05) * 0.5 + 0.5;
            float2 warp_uv = worldPosXZ * warpScale + time * 0.1; 
            float2 warp_offset = float2(valueNoise(warp_uv), valueNoise(warp_uv + float2(5.2, 1.3)));
            float2 uv = worldPosXZ + (warp_offset * 2.0 - 1.0) * warpStrength * warpModulation;
            return worleyNoise(uv * scale, time * speed, contrast); 
        }
        #endif

        #if USE_SSR
        float3 RaymarchSSR(float3 viewPos, float3 viewReflect, inout float hit) 
        { 
            hit = 0;
            float3 finalColor = 0; 
            viewReflect = normalize(viewReflect); 
            float3 rayPos = viewPos; 
            float step = _SSR_StepSize;
            float2 scaledRes = _ScreenParams.xy * _SSR_Resolution;
            
            [loop] for (int s = 0; s < _SSR_Samples; s++) 
            { 
                rayPos += viewReflect * step;
                float4 projectedPos = mul(UNITY_MATRIX_P, float4(rayPos, 1.0)); 
                if (projectedPos.w <= 0) break;
                float2 screenUV = projectedPos.xy / projectedPos.w * 0.5 + 0.5;
                #if UNITY_UV_STARTS_AT_TOP 
                    screenUV.y = 1.0 - screenUV.y;
                #endif 
                float2 lookupUV = floor(screenUV * scaledRes) / scaledRes;
                float rayDistance = length(rayPos - viewPos);
                if (any(saturate(screenUV) != screenUV) || rayDistance > _SSR_MaxDistance) break; 
                float sceneDepth = LinearEyeDepth(tex2Dlod(_CameraDepthTexture, float4(lookupUV, 0, 0)).r); 
                float rayDepth = -rayPos.z;
                if (rayDepth > sceneDepth) { 
                    rayPos -= viewReflect * step;
                    step /= 2.0; 
                    [loop] for (int j = 0; j < _SSR_RefinementSamples; j++) { 
                        rayPos += viewReflect * step;
                        projectedPos = mul(UNITY_MATRIX_P, float4(rayPos, 1.0)); 
                        if (projectedPos.w <= 0) break; 
                        screenUV = projectedPos.xy / projectedPos.w * 0.5 + 0.5;
                        #if UNITY_UV_STARTS_AT_TOP 
                            screenUV.y = 1.0 - screenUV.y;
                        #endif 
                        lookupUV = floor(screenUV * scaledRes) / scaledRes;
                        sceneDepth = LinearEyeDepth(tex2Dlod(_CameraDepthTexture, float4(lookupUV, 0, 0)).r);
                        rayDepth = -rayPos.z; 
                        if (rayDepth > sceneDepth) rayPos -= viewReflect * step; 
                        step /= 2.0;
                    } 
                    projectedPos = mul(UNITY_MATRIX_P, float4(rayPos, 1.0));
                    if (projectedPos.w <= 0) { hit = 0; break; } 
                    screenUV = projectedPos.xy / projectedPos.w * 0.5 + 0.5;
                    #if UNITY_UV_STARTS_AT_TOP 
                        screenUV.y = 1.0 - screenUV.y;
                    #endif 
                    if (any(saturate(screenUV) != screenUV)) {hit = 0; break;} 
                    lookupUV = floor(screenUV * scaledRes) / scaledRes;
                    finalColor = tex2D(_GrabTexture, lookupUV).rgb;
                    float2 screenEdgeFadeVec = abs(screenUV * 2.0 - 1.0); 
                    float screenEdgeFade = saturate((1.0 - max(screenEdgeFadeVec.x, screenEdgeFadeVec.y)) / _SSR_EdgeFalloff); 
                    hit = screenEdgeFade;
                    break; 
                } 
            } 
            return finalColor;
        }
        #endif

        float3 ParallaxCorrectedReflectionVector(float3 worldPos, float3 reflectVec) 
        { 
            float3 probePos = unity_SpecCube0_ProbePosition;
            float3 boxMin = unity_SpecCube0_BoxMin.xyz; 
            float3 boxMax = unity_SpecCube0_BoxMax.xyz; 
            float3 firstPlane = (boxMax - worldPos) / reflectVec;
            float3 secondPlane = (boxMin - worldPos) / reflectVec; 
            float3 furthestPlane = max(firstPlane, secondPlane); 
            float distance = min(min(furthestPlane.x, furthestPlane.y), furthestPlane.z);
            return normalize(worldPos + reflectVec * distance - probePos); 
        }

        v2f vert(appdata v)
        {
            v2f o;
            float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
            float4 displacedVertex = v.vertex;
            float3 totalNormal = v.normal;
            
            float time = _Time.y;
            float3 d1, n1, d2, n2, d3, n3, d4, n4;
            GerstnerWave(worldPos.xz, time, _WaveDirection1, _WaveAmplitude, _WaveFrequency, _WaveSteepness, _WaveSpeed, d1, n1);
            GerstnerWave(worldPos.xz, time, _WaveDirection2, _WaveAmplitude * 0.7, _WaveFrequency * 1.2, _WaveSteepness, _WaveSpeed * 0.8, d2, n2);
            GerstnerWave(worldPos.xz, time, _WaveDirection3, _WaveAmplitude * 0.5, _WaveFrequency * 0.8, _WaveSteepness, _WaveSpeed * 1.3, d3, n3);
            GerstnerWave(worldPos.xz, time, _WaveDirection4, _WaveAmplitude * 0.2, _WaveFrequency * 3.1, _WaveSteepness * 0.9, _WaveSpeed * 2.2, d4, n4);
            float3 totalDisplacement = d1 + d2 + d3 + d4;
            totalNormal = normalize(n1 + n2 + n3 + n4);
            displacedVertex.xyz += totalDisplacement;
            o.foamCrest = saturate(totalDisplacement.y / _WaveAmplitude);

            o.worldPos = mul(unity_ObjectToWorld, displacedVertex).xyz;
            o.pos = UnityObjectToClipPos(displacedVertex);
            o.worldNormal = normalize(mul((float3x3)unity_ObjectToWorld, totalNormal));
            o.worldTangent = normalize(mul(unity_ObjectToWorld, v.tangent).xyz);
            o.worldBinormal = normalize(cross(o.worldNormal, o.worldTangent) * v.tangent.w);
            o.viewDir = normalize(UnityWorldSpaceViewDir(o.worldPos));
            o.screenPos = ComputeGrabScreenPos(o.pos);
            o.uv = v.uv;
            o.clipPos = o.pos; 
            UNITY_TRANSFER_FOG(o, o.pos);
            return o;
        }

        float3 getFinalNormal(v2f i)
        {
            float time = _Time.y;
            float2 totalDistortion = 0;

            #if USE_INTERSECTION_RIPPLES
                float depthDifference = LinearEyeDepth(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.screenPos)).r) - i.pos.w;
                float intersectionMask = 1.0 - saturate(depthDifference / _RippleFalloff);
                float intersectRippleNoise = valueNoise(i.worldPos.xz * _RippleScale + time * _RippleSpeed);
                float2 intersectRippleDistortion = float2(intersectRippleNoise, valueNoise(i.worldPos.yx * _RippleScale - time * _RippleSpeed)) * 2.0 - 1.0;
                totalDistortion += pow(intersectionMask, 2.0) * _RippleStrength * intersectRippleDistortion;
            #endif

            #if USE_GLOBAL_RIPPLES
                float2 rippleUV = i.worldPos.xz * _GlobalRippleScale + normalize(_GlobalRippleDirection.xy) * time * _GlobalRippleSpeed;
                float globalRippleNoise = valueNoise(rippleUV);
                float2 globalRippleDistortion = float2(globalRippleNoise, valueNoise(rippleUV.yx)) * 2.0 - 1.0;
                totalDistortion += _GlobalRippleStrength * globalRippleDistortion;
            #endif

            float2 flowOffset = 0;
            #if USE_FLOWMAP
                float2 flowVector = (tex2D(_FlowMap, i.worldPos.xz * _FlowTiling).xy * 2.0 - 1.0) * _FlowStrength;
                flowOffset = flowVector * _Time.y * _FlowSpeed;
            #endif

            float3 normal = i.worldNormal;
            #if USE_NORMAL_MAPS
                float2 uv1 = i.uv * _NormalTiling + _NormalSpeed1.xy * time + totalDistortion + flowOffset;
                float2 uv2 = i.uv * _NormalTiling2 + _NormalSpeed2.xy * time + flowOffset * 0.6;
                float3 tbnNormal1 = UnpackNormal(tex2D(_NormalMap, uv1));
                float3 tbnNormal2 = UnpackNormal(tex2D(_NormalMap2, uv2));
                float3 tbnNormal = normalize(tbnNormal1 + tbnNormal2);
                float3x3 TBN = float3x3(i.worldTangent, i.worldBinormal, i.worldNormal);
                float3 detailNormal = normalize(mul(tbnNormal, TBN));
                normal = normalize(i.worldNormal + (detailNormal - i.worldNormal) * _NormalStrength);
            #endif
            
            #if USE_SURFACE_NOISE
                float2 noiseUV = i.worldPos.xz * _NoiseTiling + float2(0, _Time.y * _NoiseSpeed);
                float2 offsetDir = normal.xz * _ChromaticAberrationNoise;
                float r = tex2D(_SurfaceNoiseTex, noiseUV - offsetDir).r;
                float g = tex2D(_SurfaceNoiseTex, noiseUV).g;
                float2 noiseOffset = (float2(r, g) * 2 - 1) * _NoiseStrength;
                normal.xz += noiseOffset;
            #endif

            return normalize(normal);
        }

        ENDCG

        // Forward rendering pass
        Pass
        {
            Tags { "LightMode"="ForwardBase" }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag_base
            #pragma multi_compile_fwdbase_nodirlightmap
            #pragma multi_compile_fog
            #pragma shader_feature USE_SURFACE_NOISE
            #pragma shader_feature USE_NORMAL_MAPS
            #pragma shader_feature USE_OILY_SHEEN
            #pragma shader_feature USE_FLOWMAP
            #pragma shader_feature USE_SUBSURFACE_SCATTERING
            #pragma shader_feature USE_GLOBAL_RIPPLES
            #pragma shader_feature USE_FOAM
            #pragma shader_feature USE_CAUSTICS
            #pragma shader_feature USE_INTERSECTION_RIM
            #pragma shader_feature USE_INTERSECTION_RIPPLES
            #pragma shader_feature USE_SSR
            #pragma shader_feature_local CHECKERBOARD_RENDER
            #pragma shader_feature USE_DITHERING
            
            half4 frag_base(v2f i) : SV_Target
            {
                float3 normal = getFinalNormal(i);
                float3 viewDir = i.viewDir;
                float3 lightDir = _WorldSpaceLightPos0.xyz;
                float3 lightColor = _LightColor0.rgb;
                float time = _Time.y;
                float sceneLinearEyeDepth = LinearEyeDepth(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.screenPos)).r);
                float depthDifference = sceneLinearEyeDepth - i.pos.w;
                float NdotV = saturate(dot(normal, viewDir));
                float fresnel = pow(1.0 - NdotV, _FresnelPower);

                float3 reflectionColor = 0;
                #if USE_SSR
                    float3 rawReflectionVec = reflect(-viewDir, normal);
                    float3 cubemapReflection = Unity_GlossyEnvironment(UNITY_PASS_TEXCUBE(unity_SpecCube0), unity_SpecCube0_HDR, ParallaxCorrectedReflectionVector(i.worldPos, rawReflectionVec), _Roughness);
                    float ssrHit = 0;
                    float3 ssrColor = 0;
                    #if CHECKERBOARD_RENDER
                        if (fmod(floor(i.pos.x) + floor(i.pos.y), 2.0) != 0) { ssrHit = 0; } else
                    #endif
                    {
                        if (rawReflectionVec.y > 0) {
                            float3 viewPos = mul(UNITY_MATRIX_V, float4(i.worldPos, 1)).xyz;
                            float3 viewReflect = mul((float3x3)UNITY_MATRIX_V, rawReflectionVec);
                            ssrColor = RaymarchSSR(viewPos, viewReflect, ssrHit);
                            float angleFade = saturate(1.0 - pow(NdotV, _SSR_AngleFalloff));
                            ssrHit *= angleFade;
                        }
                    }
                    reflectionColor = lerp(cubemapReflection, ssrColor, ssrHit * _SSR_Intensity * (1.5 - _Roughness)) * _ReflectionIntensity;
                #else
                    float3 rawReflectionVec = reflect(-viewDir, normal);
                    reflectionColor = Unity_GlossyEnvironment(UNITY_PASS_TEXCUBE(unity_SpecCube0), unity_SpecCube0_HDR, ParallaxCorrectedReflectionVector(i.worldPos, rawReflectionVec), _Roughness) * _ReflectionIntensity;
                #endif

                #if USE_OILY_SHEEN
                    reflectionColor += getOilySheen(NdotV, i.worldPos);
                #endif

                float2 screenUV = i.screenPos.xy / i.screenPos.w;
                float3 refractedColor;
                float3 causticsColor = 0;
                float3 sssColor = 0;

                if (depthDifference > 0.01) {
                    float blurAmount = length(normal.xy) * _RefractionStrength * _RefractionBlur * 0.01;
                    float2 baseOffset = normal.xy * _RefractionStrength * (1 - fresnel);
                    float2 ca_r_offset = float2(_ChromaticAberration, 0) * (1-fresnel);
                    float2 ca_b_offset = -ca_r_offset;
                    float r = tex2D(_GrabTexture, screenUV + baseOffset + ca_r_offset).r;
                    float g = tex2D(_GrabTexture, screenUV + baseOffset).g;
                    float b = tex2D(_GrabTexture, screenUV + baseOffset + ca_b_offset).b;
                    const float2 taps[2] = { float2(0.707, 0.707), float2(-0.707, -0.707) };
                    [unroll] for(int j=0; j<2; j++) { float2 offset = taps[j] * blurAmount;
                    r += tex2D(_GrabTexture, screenUV + baseOffset + ca_r_offset + offset).r; g += tex2D(_GrabTexture, screenUV + baseOffset + offset).g;
                    b += tex2D(_GrabTexture, screenUV + baseOffset + ca_b_offset + offset).b; }
                    refractedColor = float3(r,g,b) / 3.0;

                    #if USE_CAUSTICS || USE_SUBSURFACE_SCATTERING
                        float3 refractedRay = normalize(refract(-viewDir, normal, 1.0 / 1.33));
                        float3 underwaterWorldPos = i.worldPos + refractedRay * depthDifference;
                        float causticsFade = saturate(1.0 - (depthDifference * 0.2));
                        #if USE_CAUSTICS
                            float caustic1 = getCausticsLayer(underwaterWorldPos.xz, time, _CausticsScale1, _CausticsSpeed1, _CausticsContrast1, _CausticsWarpStrength1, _CausticsWarpScale1) * _CausticsIntensity1;
                            float caustic2 = getCausticsLayer(underwaterWorldPos.xz, time, _CausticsScale2, _CausticsSpeed2, _CausticsContrast2, _CausticsWarpStrength2, _CausticsWarpScale2) * _CausticsIntensity2;
                            float caustic3 = getCausticsLayer(underwaterWorldPos.xz, time, _CausticsScale3, _CausticsSpeed3, _CausticsContrast3, _CausticsWarpStrength3, _CausticsWarpScale3) * _CausticsIntensity3;
                            float totalCausticPattern = saturate(caustic1 + caustic2 + caustic3);
                            causticsColor = totalCausticPattern * lightColor * causticsFade;
                        #endif
                        #if USE_SUBSURFACE_SCATTERING
                            float sssFactor = pow(saturate(dot(viewDir, -lightDir)), 2.0);
                            sssColor = _SubsurfaceColor.rgb * sssFactor * _SubsurfaceIntensity * causticsFade * lightColor;
                        #endif
                    #endif
                } 
                else 
                {
                    refractedColor = _DeepColor.rgb;
                }
                
                float depthFactor = saturate(depthDifference * _DepthFalloff);
                float3 absorptionColor = lerp(_ShallowColor.rgb, _DeepColor.rgb, depthFactor);
                float3 ditherColor = 0;
                #if USE_DITHERING
                    float ditherMask = BayerDither(i.pos.xy);
                    float ditherAmount = _DitherStrength * pow(depthFactor, 2.0);
                    ditherColor = ditherAmount * (ditherMask - 0.5);
                #endif
                float3 finalRefraction = refractedColor * absorptionColor + ditherColor + causticsColor + sssColor;
                
                float3 foamColor = 0;
                #if USE_FOAM
                    float foamDepthMask = saturate(1.0 - (depthDifference * _FoamDepthFalloff));
                    float dissolveNoise = valueNoise(i.worldPos.xz * 5.0 + time * _FoamDissolveSpeed);
                    float foamCrestMask = saturate(pow(i.foamCrest, 4) - _FoamCrestThreshold - dissolveNoise);
                    float totalFoamMask = saturate(foamDepthMask + foamCrestMask);
                    float2 foamUV = i.worldPos.xz * _FoamTiling + time * _FoamSpeed.xy;
                    float foamPattern = tex2D(_FoamTex, foamUV).r;
                    foamColor = foamPattern * totalFoamMask * _FoamIntensity * lightColor;
                #endif
                
                float3 specular = CalculateSpecular(normal, viewDir, lightDir, _Roughness, _SpecularIntensity) * lightColor;
                
                float3 rimColor = 0;
                #if USE_INTERSECTION_RIM
                    float rimMask = pow(1.0 - saturate(depthDifference / _RimWidth), _RimPower);
                    rimColor = _RimColor.rgb * rimMask * _RimIntensity;
                #endif
                
                float3 finalColor = lerp(finalRefraction, reflectionColor, fresnel);
                finalColor += specular + foamColor + rimColor;

                UNITY_APPLY_FOG(i.fogCoord, finalColor);
                return half4(finalColor, _ShallowColor.a);
            }
            ENDCG
        }

        // Additional lighting pass for specular highlights
        Pass
        {
            Tags { "LightMode"="ForwardAdd" }
            Blend One One
            ZWrite Off
            Fog { Color (0,0,0,0) }

   
         CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag_add
            #pragma multi_compile_fwdadd_fullshadows
            #pragma shader_feature USE_SURFACE_NOISE
            #pragma shader_feature USE_NORMAL_MAPS
            #pragma shader_feature USE_FLOWMAP
            #pragma shader_feature USE_GLOBAL_RIPPLES
            #pragma shader_feature USE_INTERSECTION_RIPPLES
            

            half4 frag_add(v2f i) : SV_Target
            {
                float3 normal = getFinalNormal(i);
                float3 viewDir = i.viewDir;
                float3 lightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));
                float3 lightColor = _LightColor0.rgb;
                float3 specular = CalculateSpecular(normal, viewDir, lightDir, _Roughness, _SpecularIntensity) * lightColor;
                
                return half4(specular, 0);
            }
            ENDCG
        }
    }
    FallBack "Transparent/VertexLit"
}