classdef Nest
    % Nest  Nested multiplication or Horner's Method
    %   H = Nest creates an object which evaluates ploynomial from nested form
    %   using Horner's Method.
    %
    %   Here is an example:
    %   To evaluate polynomial P(x) at x = 1
    %   P(x) = -1 + 5*x + -3*x^2 +3*x^3 + 2*x^4
    %   we have
    %   P(x) = -1 + x*(5 + x*(-3 + x*(3+ x*2)))
    %        = -1 + (x-0)*(5 + (x-0)*(-3 + (x-0)*(3+ (x-0)*2)))
    %        = 6
    %
    %% Input Properties
    properties
        % Degree    Degree of polynomial (Nature Number)
        %   In the example above, Degree equals 4
        Degree = 4;
        % Coef   Coefficients of polynomial (Vector)
        %   In the example above, Coef equals [-1 5 -3 3 2]
        %   Note: constant term first
        Coef = [-1 5 -3 3 2];
        % X     Coordinate x at which to evaluate (Scalar)
        X = 1;
        % BP    BasePoint of polynomial
        %   In the example above, BP equals [0 0 0 0]
        %   Note: first order term first
        BP = [0 0 0 0];
        
    end
    %% Output Properties
    properties( Dependent = true , SetAccess = private )
        % P    Output of polynomial with specific X (Nature Number)
        %   In the example above, P equals 6
        P = 6;
        
    end
    %% Set Properties to Specific Values
    methods
        function obj = set.Degree(obj,value)
            obj.Degree = value;
            
        end
        function obj = set.Coef(obj,value)
            obj.Coef = value;
            
        end
        function obj = set.X(obj,value)
            obj.X = value;
            
        end
        function obj = set.BP(obj,value)
            obj.BP = value;
            
        end
        
    end
    %% Horner's Method
    methods
        function P = get.P(obj)
            y = obj.Coef(end);
            for i = obj.Degree:-1:1
                y = y.*(obj.X - obj.BP(i)) + obj.Coef(i);
                
            end
            P = y;
        end
    end
    %% Constructor
    methods
        function obj = Nest(degree,coef,x,bp)
            if nargin == 0
                
            else
                obj.Degree = degree;
                obj.Coef = coef;
                obj.X = x;
                obj.BP = bp;
            end
            
        end
    end
    
end %EoC

