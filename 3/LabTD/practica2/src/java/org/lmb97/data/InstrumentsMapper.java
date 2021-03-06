package org.lmb97.data;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.lmb97.data.Instruments;
import org.lmb97.data.InstrumentsExample;

public interface InstrumentsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    int countByExample(InstrumentsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    int deleteByExample(InstrumentsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    int insert(Instruments record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    int insertSelective(Instruments record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    List<Instruments> selectByExample(InstrumentsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    Instruments selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    int updateByExampleSelective(@Param("record") Instruments record, @Param("example") InstrumentsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    int updateByExample(@Param("record") Instruments record, @Param("example") InstrumentsExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    int updateByPrimaryKeySelective(Instruments record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table instruments
     *
     * @mbggenerated Tue May 15 11:58:16 CEST 2012
     */
    int updateByPrimaryKey(Instruments record);
}