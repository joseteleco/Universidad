package org.lmb97.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class MusicsheetsExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public MusicsheetsExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNull() {
            addCriterion("author is null");
            return (Criteria) this;
        }

        public Criteria andAuthorIsNotNull() {
            addCriterion("author is not null");
            return (Criteria) this;
        }

        public Criteria andAuthorEqualTo(Integer value) {
            addCriterion("author =", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotEqualTo(Integer value) {
            addCriterion("author <>", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThan(Integer value) {
            addCriterion("author >", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorGreaterThanOrEqualTo(Integer value) {
            addCriterion("author >=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThan(Integer value) {
            addCriterion("author <", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorLessThanOrEqualTo(Integer value) {
            addCriterion("author <=", value, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorIn(List<Integer> values) {
            addCriterion("author in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotIn(List<Integer> values) {
            addCriterion("author not in", values, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorBetween(Integer value1, Integer value2) {
            addCriterion("author between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andAuthorNotBetween(Integer value1, Integer value2) {
            addCriterion("author not between", value1, value2, "author");
            return (Criteria) this;
        }

        public Criteria andAcquisitorIsNull() {
            addCriterion("acquisitor is null");
            return (Criteria) this;
        }

        public Criteria andAcquisitorIsNotNull() {
            addCriterion("acquisitor is not null");
            return (Criteria) this;
        }

        public Criteria andAcquisitorEqualTo(Integer value) {
            addCriterion("acquisitor =", value, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitorNotEqualTo(Integer value) {
            addCriterion("acquisitor <>", value, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitorGreaterThan(Integer value) {
            addCriterion("acquisitor >", value, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitorGreaterThanOrEqualTo(Integer value) {
            addCriterion("acquisitor >=", value, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitorLessThan(Integer value) {
            addCriterion("acquisitor <", value, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitorLessThanOrEqualTo(Integer value) {
            addCriterion("acquisitor <=", value, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitorIn(List<Integer> values) {
            addCriterion("acquisitor in", values, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitorNotIn(List<Integer> values) {
            addCriterion("acquisitor not in", values, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitorBetween(Integer value1, Integer value2) {
            addCriterion("acquisitor between", value1, value2, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitorNotBetween(Integer value1, Integer value2) {
            addCriterion("acquisitor not between", value1, value2, "acquisitor");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateIsNull() {
            addCriterion("acquisition_date is null");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateIsNotNull() {
            addCriterion("acquisition_date is not null");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateEqualTo(Date value) {
            addCriterionForJDBCDate("acquisition_date =", value, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("acquisition_date <>", value, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateGreaterThan(Date value) {
            addCriterionForJDBCDate("acquisition_date >", value, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("acquisition_date >=", value, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateLessThan(Date value) {
            addCriterionForJDBCDate("acquisition_date <", value, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("acquisition_date <=", value, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateIn(List<Date> values) {
            addCriterionForJDBCDate("acquisition_date in", values, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("acquisition_date not in", values, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("acquisition_date between", value1, value2, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andAcquisitionDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("acquisition_date not between", value1, value2, "acquisitionDate");
            return (Criteria) this;
        }

        public Criteria andProviderIsNull() {
            addCriterion("provider is null");
            return (Criteria) this;
        }

        public Criteria andProviderIsNotNull() {
            addCriterion("provider is not null");
            return (Criteria) this;
        }

        public Criteria andProviderEqualTo(Integer value) {
            addCriterion("provider =", value, "provider");
            return (Criteria) this;
        }

        public Criteria andProviderNotEqualTo(Integer value) {
            addCriterion("provider <>", value, "provider");
            return (Criteria) this;
        }

        public Criteria andProviderGreaterThan(Integer value) {
            addCriterion("provider >", value, "provider");
            return (Criteria) this;
        }

        public Criteria andProviderGreaterThanOrEqualTo(Integer value) {
            addCriterion("provider >=", value, "provider");
            return (Criteria) this;
        }

        public Criteria andProviderLessThan(Integer value) {
            addCriterion("provider <", value, "provider");
            return (Criteria) this;
        }

        public Criteria andProviderLessThanOrEqualTo(Integer value) {
            addCriterion("provider <=", value, "provider");
            return (Criteria) this;
        }

        public Criteria andProviderIn(List<Integer> values) {
            addCriterion("provider in", values, "provider");
            return (Criteria) this;
        }

        public Criteria andProviderNotIn(List<Integer> values) {
            addCriterion("provider not in", values, "provider");
            return (Criteria) this;
        }

        public Criteria andProviderBetween(Integer value1, Integer value2) {
            addCriterion("provider between", value1, value2, "provider");
            return (Criteria) this;
        }

        public Criteria andProviderNotBetween(Integer value1, Integer value2) {
            addCriterion("provider not between", value1, value2, "provider");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table musicsheets
     *
     * @mbggenerated do_not_delete_during_merge Tue Apr 17 19:12:25 CEST 2012
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table musicsheets
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}