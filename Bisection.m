classdef Bisection
    % Bisection  Bisection Method
    %   H = Bisection creates an object which computes approximate solution
    %   of f(x)=0 using Bisection Method.
    %
    %% Input Properties
    properties
        % Func    Function f(x) (Function handle)
        %   the default is x^3+x-1
        Func = @(x) x^3 + x - 1;
        % Inte    Interval [a,b]
        %   the initial interval is [0,1] (2-D Vector)
        Inte = [0,1];
        % Tol     Tolerance (Scalar)
        %   the default value is 0.00005
        Tol = 0.00005;
        
        
    end
    %% Output Properties
    properties( Dependent = true , SetAccess = private )
        % Root    Root of equation f(x)=0
        %   the default value is 0.0001
        Root = 0;
        
    end
    %% Bisection Method
    methods
        function Root = get.Root(obj)
            f = obj.Func;
            tol = obj.Tol;
            a = obj.Inte(1);
            b = obj.Inte(2);
            
            fa = f(a);
            fb = f(b);
            if sign(fa)*sign(fb) >= 0
                error('f(a)f(b)<0 not satisfied!')
            end
            while( (b-a)/2 > tol)
                c = (a+b)/2;
                fc = f(c);
                if fc == 0
                    break
                end
                if sign(fc)*sign(fa) < 0
                    b = c;
                    fb = fc; %#ok<NASGU>  
                else
                    a = c;
                    fa = fc;
                end
                
            end
            Root = (a+b)/2;
            
        end
    end
    %% Set Properties to Specific Values
    methods
        function obj = set.Func(obj,value)
            obj.Func = value;
            
        end
        function obj = set.Inte(obj,value)
            obj.Inte = value;
            
        end
        function obj = set.Tol(obj,value)
            obj.Tol = value;
            
        end
        
    end
    
    %% Constructor
    methods
        function obj = Bisection(func,inte,tol)
            if nargin == 0
                
            else
                obj.Func = func;
                obj.Inte = inte;
                obj.Tol = tol;
            end
            
        end
    end
    
end %EoC
