classdef FigGui < handle
    properties
        fig
    end
    methods
        function obj = GUItest(varargin)
            obj.fig = figure(varargin{:});
        end
        function clear_figure(obj)
            clf(obj.fig);
        end
    end
end