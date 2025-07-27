package com.ruoyi.web.controller.demo.entity;


/**
 * 注册表单实体类，用于封装用户注册信息
 */
public class RegisterForm {
    /**
     * 用户输入的用户名
     */
    private String username;
    /**
     * 用户输入的密码
     */
    private String password;
    /**
     * 用户输入的确认密码
     */
    private String confirmPassword;
    /**
     * 用户输入的邮箱
     */
    private String email;
    /**
     * 用户输入的手机号
     */
    private String phone;
    /**
     * 用户输入的验证码
     */
    private String verifyCode;

    /**
     * 获取用户名
     * @return 用户名
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置用户名
     * @param username 用户名
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取密码
     * @return 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取确认密码
     * @return 确认密码
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * 设置确认密码
     * @param confirmPassword 确认密码
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * 获取邮箱
     * @return 邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置邮箱
     * @param email 邮箱
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取手机号
     * @return 手机号
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置手机号
     * @param phone 手机号
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取验证码
     * @return 验证码
     */
    public String getVerifyCode() {
        return verifyCode;
    }

    /**
     * 设置验证码
     * @param verifyCode 验证码
     */
    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }
}