package org.lmb97.data;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.lmb97.data.RelPeopleLottery;
import org.lmb97.data.RelPeopleLotteryExample;
import org.lmb97.data.RelPeopleLotteryKey;

public interface RelPeopleLotteryMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    int countByExample(RelPeopleLotteryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    int deleteByExample(RelPeopleLotteryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    int deleteByPrimaryKey(RelPeopleLotteryKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    int insert(RelPeopleLottery record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    int insertSelective(RelPeopleLottery record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    List<RelPeopleLottery> selectByExample(RelPeopleLotteryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    RelPeopleLottery selectByPrimaryKey(RelPeopleLotteryKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    int updateByExampleSelective(@Param("record") RelPeopleLottery record, @Param("example") RelPeopleLotteryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    int updateByExample(@Param("record") RelPeopleLottery record, @Param("example") RelPeopleLotteryExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    int updateByPrimaryKeySelective(RelPeopleLottery record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table rel_people_lottery
     *
     * @mbggenerated Tue Apr 17 19:12:25 CEST 2012
     */
    int updateByPrimaryKey(RelPeopleLottery record);
}