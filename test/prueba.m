clc;
clear;
close all;

% Parámetros DH
% [theta, d, a, alpha]
DH_params = [
    0, 1, 0, -pi/2;      % Paso 1
    -pi/2, 1, 3, 0;       % Paso 2
    pi/2, -1, 2, pi;      % Paso 3
    pi/2, -1, 0, -pi/2;   % Paso 4
    pi/2, -1, 0, -pi/2;   % Paso 5
    0, 1, 0, 0            % Paso 6
];

% Números de articulaciones
n = size(DH_params, 1);

% Matriz identidad para punto de inicio
T = eye(4);

% Inicializar puntos para graficar
points = zeros(3, n+1);
points(:, 1) = T(1:3, 4);

% Calcular las posiciones usando las matrices de transformación
for i = 1:n
    theta = DH_params(i, 1);
    d = DH_params(i, 2);
    a = DH_params(i, 3);
    alpha = DH_params(i, 4);

    A = [
        cos(theta), -sin(theta) * cos(alpha), sin(theta) * sin(alpha), a * cos(theta);
        sin(theta), cos(theta) * cos(alpha), -cos(theta) * sin(alpha), a * sin(theta);
        0, sin(alpha), cos(alpha), d;
        0, 0, 0, 1
    ];
    
    
    T = T * A;
    points(:, i+1) = T(1:3, 4);
    
    % Dibujar el sistema de coordenadas en cada punto
    hold on;
    quiver3(T(1,4), T(2,4), T(3,4), T(1,1), T(2,1), T(3,1), 0.2, 'r', 'LineWidth', 1); % Eje X
    quiver3(T(1,4), T(2,4), T(3,4), T(1,2), T(2,2), T(3,2), 0.2, 'g', 'LineWidth', 1); % Eje Y
    quiver3(T(1,4), T(2,4), T(3,4), T(1,3), T(2,3), T(3,3), 0.2, 'b', 'LineWidth', 1); % Eje Z
end

% Graficar el robot
figure;
plot3(points(1, :), points(2, :), points(3, :), '-o', 'LineWidth', 2, 'MarkerSize', 8);
grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Representación del Robot mediante el Método DH');
axis equal;
view(3);