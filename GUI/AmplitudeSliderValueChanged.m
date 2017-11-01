        function AmplitudeSliderValueChanged(app, event)
            value = app.AmplitudeSlider.Value;
            plot(app.UIAxes, value*peaks)
            app.UIAxes.YLim = [-1000 1000];
            
        end