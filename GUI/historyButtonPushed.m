        function historyButtonPushed(app, event)
            app.panel1.Visible = 'on';
            app.panel6.BackgroundColor = [1 1 1];
            app.panel6.BorderType = 'line';
            app.panel7.Visible = 'on';
            % untoggle the residual panels
            app.panel2.BorderType = 'none';
            app.panel4.BorderType = 'none';
            app.panel2.BackgroundColor = [0.94 0.94 0.94];
            app.panel4.BackgroundColor = [0.94 0.94 0.94];
            app.panel3.Visible = 'off'
            app.panel5.Visible = 'off'
        end