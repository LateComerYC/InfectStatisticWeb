var mydata = [
    {name: '北京', value: 181}, {name: '天津', value: 89},
    {name: '上海', value: 65}, {name: '重庆', value: 221},
    {name: '河北', value: 61}, {name: '河南', value: 262},
    {name: '云南', value: 43}, {name: '辽宁', value: 123},
    {name: '黑龙江', value: 227}, {name: '湖南', value: 245},
    {name: '安徽', value: 270}, {name: '山东', value: 401},
    {name: '新疆', value: 44}, {name: '江苏', value: 173},
    {name: '浙江', value: 396}, {name: '江西', value: 251},
    {name: '湖北', value: 43323}, {name: '广西', value: 113},
    {name: '甘肃', value: 9}, {name: '山西', value: 65},
    {name: '内蒙古', value: 34}, {name: '陕西', value: 65},
    {name: '吉林', value: 24}, {name: '福建', value: 87},
    {name: '贵州', value: 67}, {name: '广东', value: 515},
    {name: '青海', value: 78}, {name: '西藏', value: 0},
    {name: '四川', value: 239}, {name: '宁夏', value: 23},
    {name: '海南', value: 45}, {name: '台湾', value: 89},
    {name: '香港', value: 44}, {name: '澳门', value: 32}
];
var myChart = echarts.init(document.getElementById('maps'));
var optionMap = {
    backgroundColor: '#FFFFFF',
    title: {
        text: '现有确诊',
        subtext: '',
        x: 'center'
    },
    tooltip: {
        //trigger: 'item',
        //triggerOn: 'click',
    },
    //左侧小导航图标
    visualMap: {
        show: true,
        x: 'left',
        y: 'center',
        splitList: [
            {start: 10000}, {start: 1000, end: 9999},
            {start: 100, end: 999}, {start: 10, end: 99},
            {start: 1, end: 9}, {start: 0, end: 0},
        ],
        color: ['#611931', '#A40D14', '#D30910', '#F99C48', '#FFC4A7', '#FFFFFF']
    },

    //配置属性
    series: [{
        name: '确诊人数：',
        type: 'map',
        mapType: 'china',
        roam: true,
        label: {
            normal: {
                show: true  //省份名称
            },
            emphasis: {
                show: true
            }
        },
        data: mydata  //数据
    }]
};
myChart.setOption(optionMap);
function past() {
    var mydata = [
        {name: '北京', value: 181}, {name: '天津', value: 89},
        {name: '上海', value: 65}, {name: '重庆', value: 221},
        {name: '河北', value: 61}, {name: '河南', value: 262},
        {name: '云南', value: 43}, {name: '辽宁', value: 123},
        {name: '黑龙江', value: 227}, {name: '湖南', value: 245},
        {name: '安徽', value: 270}, {name: '山东', value: 401},
        {name: '新疆', value: 4400}, {name: '江苏', value: 173},
        {name: '浙江', value: 396}, {name: '江西', value: 251},
        {name: '湖北', value: 43323}, {name: '广西', value: 113},
        {name: '甘肃', value: 9}, {name: '山西', value: 65},
        {name: '内蒙古', value: 34}, {name: '陕西', value: 65},
        {name: '吉林', value: 24}, {name: '福建', value: 87},
        {name: '贵州', value: 67}, {name: '广东', value: 515},
        {name: '青海', value: 78}, {name: '西藏', value: 0},
        {name: '四川', value: 239}, {name: '宁夏', value: 23},
        {name: '海南', value: 45}, {name: '台湾', value: 89},
        {name: '香港', value: 44}, {name: '澳门', value: 32}
    ];
    var myChart = echarts.init(document.getElementById('maps'));
    var optionMap = {
        //配置属性
        title: {
            text: '累计确诊',
            subtext: '',
            x: 'center'
        },
        series: [{
            name: '确诊人数：',
            type: 'map',
            mapType: 'china',
            roam: true,
            label: {
                normal: {
                    show: true  //省份名称
                },
                emphasis: {
                    show: true
                }
            },
            data: mydata  //数据
        }]
    };
    myChart.setOption(optionMap);
}
function current() {
    myChart.setOption(optionMap);
}