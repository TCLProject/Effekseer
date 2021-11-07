struct PS_INPUT
{
    float3 v_Color;
};

struct PS_OUTPUT
{
    float4 o_FragColor;
};

static float3 input_v_Color;
static float4 _entryPointOutput_o_FragColor;

struct SPIRV_Cross_Input
{
    float3 input_v_Color : TEXCOORD0;
};

struct SPIRV_Cross_Output
{
    float4 _entryPointOutput_o_FragColor : TEXCOORD0;
};

PS_OUTPUT _main(PS_INPUT _input)
{
    PS_OUTPUT _output;
    _output.o_FragColor = float4(_input.v_Color, 1.0f);
    return _output;
}

void vert_main()
{
    PS_INPUT _input;
    _input.v_Color = input_v_Color;
    PS_INPUT param = _input;
    _entryPointOutput_o_FragColor = _main(param).o_FragColor;
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    input_v_Color = stage_input.input_v_Color;
    vert_main();
    SPIRV_Cross_Output stage_output;
    stage_output._entryPointOutput_o_FragColor = _entryPointOutput_o_FragColor;
    return stage_output;
}
