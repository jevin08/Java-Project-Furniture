package com.furniture.FinalProject.ModelWrapper;

import java.util.List;

import com.furniture.FinalProject.Model.Filter;

public class FilterList {
	
	public List<Filter> filterList;

	public FilterList() {
		super();
	}

	public List<Filter> getFilterList() {
		return filterList;
	}

	public void setFilterList(List<Filter> filterList) {
		this.filterList = filterList;
	}

	@Override
	public String toString() {
		return "FilterList [filterList=" + filterList + "]";
	}
	

}
