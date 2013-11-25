Highcharts.theme = {
    /*colors: ['#058DC7', '#ffffff', '#ED561B', '#DDDF00', '#24CBE5', '#64E572',
        '#FF9655', '#FFF263', '#6AF9C4'],*/
    chart: {
    /*    backgroundColor: {
            linearGradient: [0, 0, 500, 500],
            stops: [
                [0, 'rgb(255, 255, 255)'],
                [1, 'rgb(240, 240, 255)']
            ]
        },
        */
        plotBackgroundColor: null,
        plotBorderWidth: 0,
        plotShadow: false
    },
    title: {
        /*style: {
            color: '#000',
            font: 'bold 16px "Trebuchet MS", Verdana, sans-serif'
        }  */
    },
    subtitle: {
        style: {
            color: '#666666',
            font: 'bold 12px "Trebuchet MS", Verdana, sans-serif'
        }
    },
    legend: {
        enabled: true,
        borderWidth: '0px'
    },
    xAxis: {
        labels: {
            style: {
                fontSize: '12px'
            }
        }
    },
    plotOptions: {
        pie: {
            dataLabels: {
                enabled: true,
                distance: 15,
                connectorColor: '#000000',
                useHTML: true,
                style: {
                    fontFamily: '\"Helvetica Neue\", Helvetica, Arial, sans-serif',
                    fontWeight: 'normal',
                    fontSize: '12px',
                    color: 'black'
                }
            }
        },
        column: {
            //colorByPoint: true,
            dataLabels: {
                enabled: true,
                inside: false,
                distance: 0,
                zIndex: 99,
                format: '<span style="color:{point.color}">{point.y} %</span>',
                connectorColor: '#000000',
                useHTML: true,
                style: {
                    fontFamily: '\"Helvetica Neue\", Helvetica, Arial, sans-serif',
                    fontWeight: 'bold',
                    fontSize: '12px',
                    color: 'black'
                }
            }
        },
        series: {
            events: {
                legendItemClick: function(event) {
                    return false;
                }
            }
        }
    },
    credits: {
        enabled: false
    }
};

// Apply the theme
Highcharts.setOptions(Highcharts.theme);