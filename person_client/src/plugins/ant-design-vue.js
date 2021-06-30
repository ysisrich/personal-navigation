// import Vue from 'vue'
// import Antd from 'ant-design-vue';
// import 'ant-design-vue/dist/antd.css';

// Vue.use(Antd);


import Vue from 'vue';
import 'ant-design-vue/dist/antd.css';
import {
    Affix,
    AutoComplete,
    Avatar,
    Button,
    Card,
    Collapse,
    Checkbox,
    Col,
    DatePicker,
    Form,
    FormModel,
    Icon,
    Input,
    Layout,
    Menu,
    Modal,
    Pagination,
    Radio,
    Row,
    Select,
    Spin,
    Tag,
	Table,
    Tooltip,
    Upload,
    Drawer,
	Divider,
    Skeleton,
    Result,
    Descriptions,
    Space,
	message
} from 'ant-design-vue';

Vue.use(Affix);
Vue.use(AutoComplete);
Vue.use(Avatar);
Vue.use(Button);
Vue.use(Col);
Vue.use(DatePicker);
Vue.use(FormModel);
Vue.use(Icon);
Vue.use(Input);
Vue.use(Layout);
Vue.use(Menu);
Vue.use(Modal);
Vue.use(Pagination);
Vue.use(Radio);
Vue.use(Row);
Vue.use(Select);
Vue.use(Spin);
Vue.use(Card);
Vue.use(Tag);
Vue.use(Table);
Vue.use(Tooltip);
Vue.use(Upload);
Vue.use(Drawer);
Vue.use(Divider);
Vue.use(Skeleton);
Vue.use(Result);
Vue.use(Descriptions);
Vue.use(Space);


Vue.prototype.$message = message