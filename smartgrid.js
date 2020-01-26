const smartgrid = require('smart-grid');

const settings = {
    outputStyle: "scss",
    columns: 24,
    offset: '10px',
    container: {
        maxWidth: '960px',
        fields: '30px'
    },
    breakPoints: {
        md: {
            width: "992px",
            fields: "30px"
        },
        m: {
            width: "1050px",
            fields: "30px"
        },
        sm: {
            width: "720px",
            fields: "30px"
        },
        xs: {
            width: "576px",
            fields: "30px"
        },
        xxs: {
            width: "380px",
            fields: "5px"
        }
    },
    oldSizeStyle: false,
    properties: [
        'justify-content'
    ]
};

smartgrid('./src/precss', settings);