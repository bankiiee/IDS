/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.model;

/**
 *
 * @author Servlets
 */
public class News {
    private int newsid;
    private int userid;
    private String headline;
    private String story;
    private String fromdate;
    private String todate;
    private String remark;
    private int forusergroupid;
    private int newstypeid;
    private int mediaid;
    private String attatchment;
    private String status;

    /**
     * @return the userid
     */
    public News(News n){
        this.userid = n.getUserid();
        this.headline = n.getHeadline();
     
        this.story = n.getStory();
        this.fromdate = n.getFromdate();
        this.todate = n.getTodate();
        this.remark = n.getRemark();
        this.forusergroupid = n.getForusergroupid();
        this.newstypeid = n.getNewstypeid();
        this.mediaid = n.getMediaid();
        this.status = n.getStatus();
        this.attatchment = n.getAttatchment();
                
    }

    public News() {
       
    }
    
    public int getUserid() {
        return userid;
    }

    /**
     * @param userid the userid to set
     */
    public void setUserid(int userid) {
        this.userid = userid;
    }

    /**
     * @return the headline
     */
    public String getHeadline() {
        return headline;
    }

    /**
     * @param headline the headline to set
     */
    public void setHeadline(String headline) {
        this.headline = headline;
    }

    /**
     * @return the story
     */
    public String getStory() {
        return story;
    }

    /**
     * @param story the story to set
     */
    public void setStory(String story) {
        this.story = story;
    }

    /**
     * @return the fromdate
     */
    public String getFromdate() {
        return fromdate;
    }

    /**
     * @param fromdate the fromdate to set
     */
    public void setFromdate(String fromdate) {
        this.fromdate = fromdate;
    }

    /**
     * @return the todate
     */
    public String getTodate() {
        return todate;
    }

    /**
     * @param todate the todate to set
     */
    public void setTodate(String todate) {
        this.todate = todate;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the forusergroupid
     */
    public int getForusergroupid() {
        return forusergroupid;
    }

    /**
     * @param forusergroupid the forusergroupid to set
     */
    public void setForusergroupid(int forusergroupid) {
        this.forusergroupid = forusergroupid;
    }

    /**
     * @return the newstypeid
     */
    public int getNewstypeid() {
        return newstypeid;
    }

    /**
     * @param newstypeid the newstypeid to set
     */
    public void setNewstypeid(int newstypeid) {
        this.newstypeid = newstypeid;
    }

    /**
     * @return the newsinputid
     */
    public int getMediaid() {
        return mediaid;
    }

    /**
     * @param newsinputid the newsinputid to set
     */
    public void setMediaid(int mediaid) {
        this.mediaid = mediaid;
    }

    /**
     * @return the attatchment
     */
    public String getAttatchment() {
        return attatchment;
    }

    /**
     * @param attatchment the attatchment to set
     */
    public void setAttatchment(String attatchment) {
        this.attatchment = attatchment;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the newsid
     */
    public int getNewsid() {
        return newsid;
    }

    /**
     * @param newsid the newsid to set
     */
    public void setNewsid(int newsid) {
        this.newsid = newsid;
    }
    
    
}
