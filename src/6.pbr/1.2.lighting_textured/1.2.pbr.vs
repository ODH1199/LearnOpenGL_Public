#version 330 core
// 버텍스 셰이더의 입력 변수
layout (location = 0) in vec3 aPos; // vertex 3차원 위치값
layout (location = 1) in vec3 aNormal; // vertex normal vector
layout (location = 2) in vec2 aTexCoords; // vertex 텍스쳐 좌표

// 버텍스 셰이더의 출력 변수 -> 프레그먼트(픽셀) 셰이더의 입력으로 씀
out vec2 TexCoords; // vertex 텍스쳐좌표 [버텍스셰이더의 출력]->[픽셀셰이더의 입력]
out vec3 WorldPos;
out vec3 Normal;

// CPU에서 입력받은 변수를 넘겨 받을 gpu 변수
uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;
uniform mat3 normalMatrix;

void main()
{
    TexCoords = aTexCoords;
    WorldPos = vec3(model * vec4(aPos, 1.0));
    Normal = normalMatrix * aNormal;   

    gl_Position =  projection * view * vec4(WorldPos, 1.0);
}