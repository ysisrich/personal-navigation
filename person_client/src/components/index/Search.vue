<template>
  <div class="global-search-wrapper" style="width: 300px">
    <a-auto-complete
      class="global-search"
      size="large"
      style="width: 50%; min-width: 250px;"
      placeholder="全站搜索项目资源"
      option-label-prop="title"
      @select="onSelect"
      @search="handleSearch"
    >
      <a-input @keyup.enter="search">
        <a-button
          slot="suffix"
          style="margin-right: -12px"
          class="search-btn"
          size="large"
          type="primary"
		  @click="search"
        >
          <a-icon type="search" />
        </a-button>
      </a-input>
    </a-auto-complete>
  </div>
</template>
<script>
import bus from '@/plugins/eventBus.js'
export default {
  data() {
    return {
      dataSource: [],
	  value:''
    };
  },
  mounted() {
  	
  },
  methods: {
    onSelect(value) {
      console.log('onSelect', value);
    },

    handleSearch(value) {
		// console.log(value)
		this.value = value
		this.value.trim().length == 0 ? bus.$emit('searchData',this.value) :''
      this.dataSource = value ? this.searchResult(value) : [];
    },
	
	search(){
		bus.$emit('searchData',this.value)
	},

    getRandomInt(max, min = 0) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    },

    searchResult(query) {
      return new Array(this.getRandomInt(5))
        .join('.')
        .split('.')
        .map((item, idx) => ({
          query,
          category: `${query}${idx}`,
          count: this.getRandomInt(200, 100),
        }));
    },
  },
};
</script>

<style>
.global-search-wrapper {
  padding-right: 50px;
}

.global-search {
  width: 100%;
}

.global-search.ant-select-auto-complete .ant-select-selection--single {
  margin-right: -46px;
}

.global-search.ant-select-auto-complete .ant-input-affix-wrapper .ant-input:not(:last-child) {
  padding-right: 62px;
}

.global-search.ant-select-auto-complete .ant-input-affix-wrapper .ant-input-suffix button {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}

.global-search-item {
  display: flex;
}

.global-search-item-desc {
  flex: auto;
  text-overflow: ellipsis;
  overflow: hidden;
}

.global-search-item-count {
  flex: none;
}
</style>
