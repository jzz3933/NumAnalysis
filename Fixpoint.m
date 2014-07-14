classdef Fixpoint
    % Fixpoint  Fixed-Point Iteration
    %   H = Fixpoint creates an object which computes approxmate solution
    %   of f(x)=x using Fixed-Point Iteration. 
    %
    %% Input Properties
    properties
        % Func   Function f(x) (Function handle)
        %   the default is cos(x)
        Func = @(x) cos(x);
        % Step   Number of iteration steps (Scalar)
        %   the default value is 30
        Step = 30;
        % IniX   Initial guess (Scalar)
        %   the default value is 1
        IniX = 1;

        
    end
    %% Output Properties
    properties( Dependent = true , SetAccess = private )
        % Y    Approxmate solution of f(x)=x
        %   the default value is 0.7391
        Y = 0.7391;
        
    end
    %% Set Properties to Specific Values
    methods
        function obj = set.Func(obj,value)
            obj.Func = value;
            
        end
        function obj = set.Step(obj,value)
            obj.Step = value;
            
        end
        function obj = set.IniX(obj,value)
            obj.IniX = value;
            
        end
        
    end
    %% Fixed-Point Iteration
    methods
        function Y = get.Y(obj)
            f = obj.Func;
            x = zeros(1,obj.Step+1);
            x(1) = obj.IniX;
            for i = 1:obj.Step
                x(i+1) = f(x(i));
                
            end
            Y = x(obj.Step+1);
        end
    end
    %% Constructor
    methods
        function obj = Fixpoint(func,inix,step)
            if nargin == 0
                
            else
                obj.Func = func;
                obj.IniX = inix;
                obj.Step = step;
                
            end
            
        end
    end
    
end %EoC

